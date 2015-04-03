using System;
using System.IO;
using System.Data;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;
using Microsoft.Office.Interop.Excel;
using MySql.Data.Types;



namespace MacroCli
{
    class Program
    {


        static void Main(string[] args)
        {

            Data.resolveParams(args);

            Data.stackID = createStack(Data.user, Data.distributor, Data.date, Data.inputPath, Data.outputPath);
            Data.listITems = runVBE(Data.inputPath, Data.outputPath, Data.macroPath, Data.distributor, Data.year, Data.month, Data.day, Data.stackID, Data.user);
            //errorLog(listITems.Count.ToString()+ "vvvvv");
            Log.log(" Salvando linhas.:"+ Data.listITems.Count, Data.stackID.ToString());
            bool saved = false;
            int i = 0;
            while (!saved)
            {
                try
                {
                  
                    for ( i = 0; i < Data.listITems.Count; i++)
                    {
                        StackItem item = Data.listITems[i];
                        item.save(Config.getConn());
                    }

                    saved = true;
                }
                catch (Exception e)
                {
                    // mConn.Close();
                    Log.log(" Erro ao salvar linhas: "+i.ToString() +"->"  + e.Message);
                    clearStackList(Data.stackID);

                }
            }


            Log.log(" Linas Salvas:", Data.stackID.ToString());
            closeExcelProcess();




        }

        static int createStack(string user, string distributor, DateTime period, string pathorigem, string pathdestino)
        {

            int res = -1;
            while (res == -1)
            {
                try
                {
                    int aux = 0;
                    // mConn.Open();
                    MySqlCommand command = new MySqlCommand();
                    string _period = period.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                    pathorigem = pathorigem.Replace("\\", "/");
                    pathdestino = pathdestino.Replace("\\", "/");
                    string SQL = "INSERT INTO stack(id,user,distributor,date,period,pathorigem,pathdestino,status)VALUES(null,'" + user + "','" + distributor + "',now(),'" + _period + "','" + pathorigem + "','" + pathdestino + "',1);";
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
                    Log.log(user, "", "ERRO AO CRIAR STACK" + ex.Message, "createStack");

                }
               
            }

            Log.log(user, res.ToString(), "STACK CRIADO", "createStack");
            return res;

        }


       


      

      

       


       

     
        static List<StackItem> runVBE(string input, string output, string macroPath, string distributor, int year, int month, int day, int stackID, string user)
        {
            List<StackItem> res = null;
            bool macroRunned = false;
          

            while (!macroRunned)
            {
                try
                {
                    closeExcelProcess();

                    Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
                    excel.Visible = false;
                    Microsoft.Office.Interop.Excel.Workbook workbook;


                    Log.log(user, stackID.ToString(), "inicio runVB", "runVB");
                    excel.Visible = false;
                    workbook = excel.Workbooks.Open(input);
                    workbook.ConflictResolution = Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlLocalSessionChanges;
                    excel.DisplayAlerts = false;
                    excel.Visible = false;
                    Log.log(user, stackID.ToString(), "arquivo aberto"+ input, "runVB");
                    excel.VBE.ActiveVBProject.VBComponents.Import(macroPath);
                    Log.log(user, stackID.ToString(), "macro importada" + macroPath, "runVB");

                  
                    excel.Run("Macro", day, month, year, distributor);
                    Log.log(user, stackID.ToString(), "macro rodada ", "runVB");
                    res = IterateRows(workbook.ActiveSheet, stackID);


                    Log.log(user, stackID.ToString(), "acabou iterate: ", "runVB");
                    workbook.Saved = true;
                    bool fileSaved = false;

                    while (!fileSaved)
                    {
                        try
                        {
                            if (File.Exists(output))
                            {
                                File.Delete(output);
                            }
                            workbook.SaveAs(output,
                                Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook,
                                System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false,
                                Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, false, false, System.Reflection.Missing.Value,
                                System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                            fileSaved = true;
                        }
                        catch (Exception ee)
                        {
                            Log.log(" Erro ao Salvar: " + ee.Message);
                        }
                    }
                   
                  
                    workbook.Close(null, null, null);
                    Log.log(user, stackID.ToString(), "MACRO EXECUTADA", "runVB");
                    excel.Workbooks.Close();
                    excel.Quit();

                    macroRunned = true;

                }
                catch (Exception e)
                {
                    Log.log(user, stackID.ToString(), "ERRO NA MACRO: " + e.Message, "runVB");
                }               
              //  macroRunned = true;
            }
            return res;

        }


        static List<StackItem> IterateRows(Microsoft.Office.Interop.Excel.Worksheet worksheet, int stackID)
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

                //int iTotalColumns = worksheet.UsedRange.Columns.Count;
                //int iTotalRows = worksheet.UsedRange.Rows.Count;
                Log.log(" iniciou ITERATE line"+line.ToString());
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
                      item= new StackItem();

                        item.stackID = stackID;

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 1];
                        item.nome = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                        // errorLog(item.nome);
                        if (item.nome.ToUpper() == "NOME") continue;

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 2];
                        item.cd = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                        // errorLog(item.cd);

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 3];
                        item.material = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                        // errorLog(item.material);

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 4];
                        item.vendaMedia = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        // errorLog(item.vendaMedia.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 5];
                        item.estoqueChao = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        //  errorLog(item.estoqueChao.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 6];
                        item.estoqueTransito = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        // errorLog(item.estoqueTransito.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 7];
                        item.estoquePendente = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        // errorLog(item.estoquePendente.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 8];
                        item.estoqueTotal = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        //  errorLog(item.estoqueTotal.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 9];
                        item.diasChao = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        // errorLog(item.diasChao.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 10];
                        item.diasTotal = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        // errorLog(item.diasTotal.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 11];
                        item.ean = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                        // errorLog(item.ean.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 13];
                        item.tipo = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                        // errorLog(item.tipo.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 14];
                        item.valor = (cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0;
                        //  errorLog(item.valor.ToString());

                        cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 15];
                        // errorLog(cell.Value2.ToString());
                        item.periodo = DateTime.ParseExact("30/12/1899", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        //errorLog(item.periodo.ToShortDateString());
                        // errorLog("V2"+cell.Value2.ToString());
                        item.periodo = item.periodo.AddDays((cell.Value2 != null) ? Config.toDouble(cell.Value2.ToString()) : 0);
                        // errorLog("V#"+item.periodo.ToShortDateString());
                        //item.periodo = DateTime.ParseExact((cell.Value2 != null) ? cell.Value2.ToString() : "01/01/2015", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                        res.Add(item);

                    }
                    // Console.ReadKey();

                    rowsRead = true;
                }
                catch (Exception e)
                {
                    Log.log("Error on Iterate "  +  item.ToString());
                    Log.log("Error on Iterate "+line.ToString()+":" + e.Message);
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

        public static void closeExcelProcess(){

            bool closed = false;

            while(!closed){
                try
                {
                    foreach (System.Diagnostics.Process proc in System.Diagnostics.Process.GetProcessesByName("EXCEL.EXE"))
                    {
                        proc.Kill();
                    }
                    closed = true;
                }
                catch (Exception ex)
                {
                    Log.log("Erro ao Fechar Processos EXCEL.EXE: "+ ex.Message);
                }
            }
           

        }
    }
}
