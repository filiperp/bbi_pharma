using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;



namespace MacroCli
{
    class Program
    {


        static void Main(string[] args)
        {
            //Log.log("versao6");
            clearLog();
            for (int j = 0; j < args.Length; j++)
            {
                Log.log(" param: " + args[j], j.ToString());
            }
            Data.resolveParams(args);

            Data.stackID = createStack();
            Data.listITems = runVBE();
            //errorLog(listITems.Count.ToString()+ "vvvvv");
            Log.log(" Salvando linhas.:" + Data.listITems.Count, Data.stackID.ToString());
            bool saved = false;
            int i = 0;
            while (!saved)
            {
                try
                {

                    for (i = 0; i < Data.listITems.Count; i++)
                    {
                        StackItem item = Data.listITems[i];
                        item.save(Config.getConn());
                    }

                    saved = true;
                }
                catch (Exception e)
                {
                    // mConn.Close();
                    Log.log(" Erro ao salvar linhas: " + i.ToString() + "->" + e.Message);
                    clearStackList(Data.stackID);

                }
            }


            Log.log(" Linas Salvas:", Data.stackID.ToString());
            updateStackStatus(Data.stackID);
            Log.log("Status atualizado!");
            closeExcelProcess();




        }

        static int createStack()
        {

            int res = -1;
            while (res == -1)
            {
                try
                {
                    int aux = 0;
                    // mConn.Open();
                    MySqlCommand command = new MySqlCommand();
                    string _period = Data.date.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                    //pathorigem = pathorigem.Replace("\\", "/");
                    //pathdestino = pathdestino.Replace("\\", "/");
                    string SQL = "INSERT INTO stack(id,user,distributor,date,period,pathorigem,pathdestino,status)VALUES(null,'" + Data.user + "','" + Data.distributor + "',now(),'" + _period + "','" + Data.InputPath + "','" + Data.OutputPath + "',1);";
                    Log.log(SQL);
                    command.CommandText = SQL;
                    command.Connection = Config.getConn();
                    command.ExecuteNonQuery();
                    MySqlDataReader rdr = null;
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.CommandText = "Select MAX(id) from stack";
                    cmd.Connection = Config.getConn();
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        aux = rdr.GetInt32(0);
                    }
                    rdr.Close();
                    res = aux;
                    // mConn.Close();
                }
                catch (Exception ex)
                {
                    Log.log(Data.user, "", "ERRO AO CRIAR STACK" + ex.Message, "createStack");

                }

            }

            Log.log(Data.user, res.ToString(), "STACK CRIADO", "createStack");
            return res;

        }















        static List<StackItem> runVBE()
        {
            List<StackItem> res = null;
            bool macroRunned = false;
            Microsoft.Office.Interop.Excel.Application excel = null;
            Microsoft.Office.Interop.Excel.Workbook workbook = null;
            Microsoft.Office.Interop.Excel.XlSaveAsAccessMode mode = Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange;
            Log.log("admin", Data.stackID.ToString(), Data.InputPath, " inputpath");
            Log.log("admin", Data.stackID.ToString(), Data.OutputPath, " outputpath");
            Log.log("admin", Data.stackID.ToString(), Data.MacroPath, " macro");
            while (!macroRunned)
            {
                try
                {



                    closeExcelProcess();
                    if (excel != null)
                    {
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(excel);
                        excel = null;
                    }
                    if (workbook != null)
                    {
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(workbook);
                        workbook = null;

                    }

                    excel = new Microsoft.Office.Interop.Excel.Application();







                    Log.log(Data.user, Data.stackID.ToString(), "inicio runVB", "runVB");
                    excel.Visible = true;
                    workbook = excel.Workbooks.Open(Data.InputPath);
                    workbook.ConflictResolution = Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlLocalSessionChanges;


                    excel.DisplayAlerts = true;
                    excel.Visible = true;

                    Log.log(Data.user, Data.stackID.ToString(), "arquivo aberto: " + Data.InputPath, "runVB");
                    excel.VBE.ActiveVBProject.VBComponents.Import(Data.MacroPath);
                    Log.log(Data.user, Data.stackID.ToString(), "macro importada: " + Data.MacroPath, "runVB");


                    excel.Run("Macro", Data.day, Data.month, Data.year, Data.distributor);

                    Log.log(Data.user, Data.stackID.ToString(), "macro rodada ", "runVB");

                    System.Threading.Thread.Sleep(3000);
                    //workbook.Saved = true;
                    bool fileSaved = false;

                    while (!fileSaved)
                    {
                        try
                        {
                            //if (File.Exists(Data.OutputPath))
                            //{
                            //    File.Delete(Data.OutputPath);
                            //}
                            //workbook.SaveAs(Data.OutputPath,
                            //    Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook,
                            //    System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false,
                            //    mode,false, false, System.Reflection.Missing.Value,
                            //    System.Reflection.Missing.Value,true);

                            // workbook.SaveCopyAs(Data.OutputPath);
                            fileSaved = true;
                        }
                        catch (Exception ee)
                        {
                            Log.log(" Erro ao Salvar: " + ee.Message);

                            Log.log(" Erro ao Salvar: " + ee.ToString());

                        }
                    }
                    System.Threading.Thread.Sleep(3000);
                    Log.log("Arquivo salvo");

                    bool tryIterate = false;
                    while (!tryIterate)
                    {
                        try
                        {
                            Microsoft.Office.Interop.Excel.Worksheet ws = workbook.ActiveSheet;
                            res = iterateRows(ws, Data.stackID);
                            Log.log(Data.user, Data.stackID.ToString(), "acabou iterate: ", "runVB");
                            tryIterate = true;
                        }
                        catch (Exception exc)
                        {
                            Log.log("Erro ao tentar iterate Program.cs" + exc.Message);
                            Log.log("Erro ao tentar iterate Program.cs" + exc.ToString());

                        }

                    }



                    workbook.Close(null, null, null);
                    Log.log(Data.user, Data.stackID.ToString(), "MACRO EXECUTADA", "runVB");
                    excel.Workbooks.Close();
                    excel.Quit();

                    macroRunned = true;

                }
                catch (Exception e)
                {
                    Log.log(Data.user, Data.stackID.ToString(), "ERRO NA MACRO: " + e.Message, "runVB");
                    Log.log(Data.user, Data.stackID.ToString(), "ERRO NA MACRO: " + e.ToString(), "runVB");
                    //  Log.log(Data.user, Data.stackID.ToString(), "ERRO NA MACRO: " + e.InnerException.ToString(), "runVB");
                }
                //  macroRunned = true;
            }
            return res;

        }


        public static List<StackItem> iterateRows(Microsoft.Office.Interop.Excel.Worksheet worksheet, int stackID)
        {

            Log.log(" iniciou ITERATE");
            List<StackItem> res = null;
            bool rowsRead = false;
            StackItem item = null;
            int line = 0;





            while (!rowsRead)
            {
                worksheet.Columns.ClearFormats();
                worksheet.Rows.ClearFormats();

                //System.IO.StreamWriter file;
                //if (!File.Exists(Config.PATH_READY))
                //{
                //    File.Delete(Config.PATH_READY);

                //}
                //file = new System.IO.StreamWriter(Config.LOG_TXT_PATH);




                //int iTotalColumns = worksheet.UsedRange.Columns.Count;
                //int iTotalRows = worksheet.UsedRange.Rows.Count;
                Log.log(" iniciou ITERATE line" + line.ToString());
                Microsoft.Office.Interop.Excel.Range cell;
                Microsoft.Office.Interop.Excel.Range usedRange = worksheet.UsedRange;
                Log.log("Rows:" + usedRange.Rows.Count + " Columns:" + usedRange.Columns.Count);

                line = 0;
                res = new List<StackItem>();
                try
                {
                    foreach (Microsoft.Office.Interop.Excel.Range row in usedRange.Rows)
                    {
                        line++;
                        //Do something with the row.
                        item = new StackItem();

                        item.stackID = stackID;

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 1];
                        item.distribuidor = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                    

                        if (item.distribuidor.ToUpper() == "DISTRIBUIDOR") continue;

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 2];
                        item.cd = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                    

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 3];
                        item.apresentacao = (cell.Value2 != null) ? cell.Value2.ToString() : "";

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 4];
                        item.ean = (cell.Value2 != null) ? cell.Value2.ToString() : "";

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 5];
                        item.tipo = (cell.Value2 != null) ? cell.Value2.ToString() : "";

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 6];
                        item.info = (cell.Value2 != null) ? cell.Value2.ToString() : "";

                
                        // errorLog(item.tipo.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 7];
                        item.valor = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        //  errorLog(item.valor.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 8];
                        // errorLog(cell.Value2.ToString());
                        item.periodo = DateTime.ParseExact("30/12/1899", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        //errorLog(item.periodo.ToShortDateString());
                        // errorLog("V2"+cell.Value2.ToString());
                        item.periodo = item.periodo.AddDays((cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0);
                        // errorLog("V#"+item.periodo.ToShortDateString());
                        //item.periodo = DateTime.ParseExact((cell.Value2 != null) ? cell.Value2.ToString() : "01/01/2015", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                        //file.WriteLine(item.ToString());
                        res.Add(item);

                    }
                    // Console.ReadKey();
                    //file.Close();
                    rowsRead = true;
                }
                catch (Exception e)
                {
                    Log.log("Error on Iterate " + item.ToString());
                    Log.log("Error on Iterate " + line.ToString() + ":" + e.Message);
                }
            }

            return res;

        }



        public static void clearStackList(int stackID)
        {
            bool logged = false;
            while (!logged)
            {
                try
                {
                    MySqlCommand command = new MySqlCommand();
                    string SQL = "delete from stackitem where stackID= " + stackID.ToString();
                    command.CommandText = SQL;
                    command.Connection = Config.getConn();
                    command.ExecuteNonQuery();
                    logged = true;
                }
                catch (Exception ex)
                {
                    Log.log("Error clearStackList: " + ex.ToString());
                }
            }
        }

        public static void clearLog()
        {
            bool logged = false;
            while (!logged)
            {
                try
                {
                    MySqlCommand command = new MySqlCommand();
                    string SQL = "delete from log ";
                    command.CommandText = SQL;
                    command.Connection = Config.getConn();
                    command.ExecuteNonQuery();
                    logged = true;
                }
                catch (Exception ex)
                {
                    Log.log("Error clearStackList: " + ex.ToString());
                }
            }
        }

        public static void updateStackStatus(int stackID)
        {
            bool logged = false;
            while (!logged)
            {
                try
                {
                    MySqlCommand command = new MySqlCommand();
                    string SQL = "update stack set status=2 where id= " + stackID.ToString();
                    command.CommandText = SQL;
                    command.Connection = Config.getConn();
                    command.ExecuteNonQuery();
                    logged = true;
                }
                catch (Exception ex)
                {
                    Log.log("Error updateStackStatus: " + ex.ToString());
                }
            }
        }

        public static void closeExcelProcess()
        {

            bool closed = false;

            while (!closed)
            {
                try
                {
                    foreach (System.Diagnostics.Process proc in System.Diagnostics.Process.GetProcessesByName("EXCEL.EXE"))
                    {
                        proc.Kill();
                    }
                    foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcessesByName("EXCEL"))
                    {
                        p.Kill();
                    }
                    closed = true;
                }
                catch (Exception ex)
                {
                    Log.log("Erro ao Fechar Processos EXCEL.EXE: " + ex.Message);
                }
            }


        }
    }
}
