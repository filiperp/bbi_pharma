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
        static MySqlConnection mConn;

        static string BASE_PATH = "c:\\" ;
        static bool TRACING = true;





        public static void errorLog(string msg)
        {
            if (TRACING)
            {
                Console.WriteLine(msg);

              //  Console.ReadKey();
            }
            DateTime d = DateTime.Now;

            string _d = d.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
            // Compose a string that consists of three lines.
            string lines = _d + " - " + msg;
            System.IO.StreamWriter file;
            if (!File.Exists(BASE_PATH + "log.txt"))
            {
               file = new System.IO.StreamWriter(BASE_PATH + "log.txt");
               
            }
            else
            {
                 file = File.AppendText(BASE_PATH + "log.txt");
            }

            file.WriteLine(lines);

            file.Close();

            // Write the string to a file.
           
        }
        public static void log(string user, string id, string message, string action)
        {

            if (TRACING)
            {
                Console.WriteLine("{0}-{1}-{2}-{3}", user, id, message, action);
               // Console.ReadKey();
            }
            bool logged = false;

            while (!logged)
            {
                try
                {
                    // mConn.Open();
                    MySqlCommand command = new MySqlCommand();
                    string SQL = "INSERT INTO pharma.log(log_id,log_date,log_user,log_import,log_action,log_msg)VALUES(null,now(),'" + user +
                        "','" + id + "','" + action + "','" + message + "');";
                    command.CommandText = SQL;
                    command.Connection = mConn;
                    command.ExecuteNonQuery();
                    // mConn.Close();
                    logged = true;

                }
                catch (Exception ex)
                {
                    errorLog("Error: " + ex.ToString());
                }
                finally
                {
                    //  mConn.Close();
                }

            }



        }

        public static void clearStackList(int stackID)
        {

            bool logged = false;

            while (!logged)
            {
                try
                {
                    //  mConn.Open();
                    MySqlCommand command = new MySqlCommand();
                    string SQL = "delete from stackitem where stackID= " + stackID.ToString();
                    command.CommandText = SQL;
                    command.Connection = mConn;
                    command.ExecuteNonQuery();
                    // mConn.Close();
                    logged = true;

                }
                catch (Exception ex)
                {
                    errorLog("Error: " + ex.ToString());
                }
                finally
                {
                    //  mConn.Close();
                }

            }



        }

        static int createStack(string user, string distributor, DateTime period,string pathorigem, string pathdestino)
        {

            int res = -1;
            while (res == -1)
            {
                try
                {
                    // mConn.Open();
                    MySqlCommand command = new MySqlCommand();
                    string _period = period.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                    pathorigem = pathorigem.Replace("\\\\", "/");
                    pathdestino = pathdestino.Replace("\\\\", "/");
                    string SQL = "INSERT INTO stack(id,user,distributor,date,period,pathorigem,pathdestino,status)VALUES(null,'" + user + "','" + distributor + "',now(),'" + _period + "','" + pathorigem + "','" + pathdestino + "',1);";
                    errorLog(SQL);
                    command.CommandText = SQL;
                    command.Connection = mConn;
                    command.ExecuteNonQuery();

                    MySqlDataReader rdr = null;
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.CommandText = "Select MAX(id) from stack";
                    cmd.Connection = mConn;
                    rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {

                        res = rdr.GetInt32(0);
                    }
                    rdr.Close();
                    // mConn.Close();

                }
                catch (Exception ex)
                {
                    log(user, "", "ERRO AO CRIAR STACK" + ex.Message, "createStack");

                }
                finally
                {
                    // mConn.Close();

                }
            }

            log(user, res.ToString(), "STACK CRIADO", "createStack");
            return res;

        }


        static double toDouble(string value)
        {
            double res = 0;
            try
            {
                res = Convert.ToDouble(value.Replace(",", "."));
            }
            catch
            {
                res = 0;
            }
            return res;
        }


        static List<StackItem> IterateRows(Microsoft.Office.Interop.Excel.Worksheet worksheet, int stackID)
        {
            worksheet.Columns.ClearFormats();
            worksheet.Rows.ClearFormats();

            int iTotalColumns = worksheet.UsedRange.Columns.Count;
            int iTotalRows = worksheet.UsedRange.Rows.Count;

            List<StackItem> res = new List<StackItem>();
             Microsoft.Office.Interop.Excel.Range cell;
            Microsoft.Office.Interop.Excel.Range usedRange = worksheet.UsedRange;
            errorLog("Rows:" + usedRange.Rows.Count);
            errorLog("Columns:" + usedRange.Columns.Count);

           


            try
            {

                foreach (Microsoft.Office.Interop.Excel.Range row in usedRange.Rows)
                {
                    
                    //Do something with the row.
                    StackItem item = new StackItem();

                    item.stackID = stackID;

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1,1];                  
                    item.nome =  (cell.Value2 != null) ? cell.Value2.ToString(): "";
                   // errorLog(item.nome);
                    if (item.nome.ToUpper() == "NOME") continue;
                     
                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 2];
                    item.cd = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                   // errorLog(item.cd);

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 3];
                    item.material = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                   // errorLog(item.material);

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 4];
                    item.vendaMedia = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                   // errorLog(item.vendaMedia.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 5];
                    item.estoqueChao = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                  //  errorLog(item.estoqueChao.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 6];
                    item.estoqueTransito = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                   // errorLog(item.estoqueTransito.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 7];
                    item.estoquePendente = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                   // errorLog(item.estoquePendente.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 8];
                    item.estoqueTotal = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                  //  errorLog(item.estoqueTotal.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 9];
                    item.diasChao = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                   // errorLog(item.diasChao.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 10];
                    item.diasTotal = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                   // errorLog(item.diasTotal.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 11];
                    item.ean = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                   // errorLog(item.ean.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 13];
                    item.tipo = (cell.Value2 != null) ? cell.Value2.ToString() : "";
                   // errorLog(item.tipo.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 14];
                    item.valor = (cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0;
                  //  errorLog(item.valor.ToString());

                    cell = (Microsoft.Office.Interop.Excel.Range)row.Cells[1, 15];
                   // errorLog(cell.Value2.ToString());
                    item.periodo = DateTime.ParseExact("30/12/1899", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    //errorLog(item.periodo.ToShortDateString());
                   // errorLog("V2"+cell.Value2.ToString());
                    item.periodo = item.periodo.AddDays((cell.Value2 != null) ? toDouble(cell.Value2.ToString()) : 0);
                   // errorLog("V#"+item.periodo.ToShortDateString());
                   //item.periodo = DateTime.ParseExact((cell.Value2 != null) ? cell.Value2.ToString() : "01/01/2015", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                  

                    res.Add(item);


                }
               // Console.ReadKey();

                return res;

            }
            catch (Exception e)
            {
                errorLog("Iterate:0" + e.Message);
            }
            return null;
            
        }
        static List<StackItem> runVB(string input, string output, string macroPath, string distributor, int year, int month, int day, int stackID, string user)
        {
            List<StackItem> res = null;

            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            excel.Visible = false;
            Microsoft.Office.Interop.Excel.Workbook workbook;
            bool macroRunned = false;

            while (!macroRunned)
            {
                try
                {
                    log(user, stackID.ToString(), "inicio MACRO: ", "runVB");
                    excel.Visible = false;
                    workbook = excel.Workbooks.Open(input);
                    workbook.ConflictResolution = Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlLocalSessionChanges;
                    excel.DisplayAlerts = false;
                    excel.Visible = false;
                    excel.VBE.ActiveVBProject.VBComponents.Import(macroPath);
                    log(user, stackID.ToString(), "run MACRO: ", "runVB");
                    excel.Run("Macro", day, month, year, distributor);
                    log(user, stackID.ToString(), "acabou run MACRO: ", "runVB");
                    res = IterateRows(workbook.ActiveSheet, stackID);
                    log(user, stackID.ToString(), "acabou iterate: ", "runVB");
                    workbook.Saved = true;
                    workbook.SaveAs(output,
                        Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook,
                                System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false,
                                Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlShared, false, false, System.Reflection.Missing.Value,
                                System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                    workbook.Close(null, null, null);
                    log(user, stackID.ToString(), "MACRO EXECUTADA", "runVB");
                    excel.Workbooks.Close();
                    excel.Quit();



                    //Console.WriteLine("salvou");


                    macroRunned = true;

                }
                catch (Exception e)
                {

                    log(user, stackID.ToString(), "ERRO NA MACRO: " + e.Message, "runVB");

                    //  macroRunned = true; 
                    //                throw;
                }
                finally
                {


                    //  workbook.Close(null, null, null);


                  
                    excel.Workbooks.Close();
                    excel.Quit();

                }

                macroRunned = true;
            }
            return res;

        }

        //INSERT INTO import(id,user,distributor,date,period)VALUES(id,user,distributor,date,period);
        static void Main(string[] args)
        {

            mConn = new MySqlConnection("Persist Security Info=False;server=localhost;database=pharma;uid=root;server=localhost;uid=root;pwd=Mudar#123");
            mConn.Open();
            string input;
            string output;
            string macroPath;
            string user;
            string distributor;
            DateTime date;
            int year;
            int month;
            int day;
            int stackID;
            List<StackItem> listITems;

            // args = new string[2];
            ///  args[0] = "asdf" ;
            // args[1] = "asdfadsf";



            //  string input = args[0] ;
            //  string output = args[1];
            //  string macroPath = args[2];

            //input = BASE_PATH + "american_farma.xls";
            //output = BASE_PATH + "american_farma_out.xlsx";
            //macroPath = BASE_PATH + "american_farma.vbs";
            //user = "user";
            //distributor = "distributor";
            //date = DateTime.ParseExact("25/06/1983", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //year = date.Year;
            //month = date.Month;
            //day = date.Day;
            //stackID = createStack(user, distributor, date, input, output);
            //listITems = runVB(input, output, macroPath, distributor, year, month, day, stackID, user);


            input = args[0];
            output = args[1];
            macroPath = args[2];
            user = args[3];
            distributor = args[4];
            date = DateTime.ParseExact(args[5], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            year = date.Year;
            month = date.Month;
            day = date.Day;
            stackID = createStack(user, distributor, date, input, output);
            listITems = runVB(input, output, macroPath, distributor, year, month, day, stackID, user);


            //errorLog(listITems.Count.ToString()+ "vvvvv");

            bool saved = false;

            while (!saved)
            {
                try
                {
                    Program.errorLog("item salvoX");
                    for (int i = 0; i < listITems.Count; i++)
                    {
                        StackItem item = listITems[i];
                        item.save(mConn);
                    }

                    //listITems.ForEach(delegate(StackItem element) { 
                        Program.errorLog("item salvo");
                       // element.save(mConn); });
                    saved = true;
                }
                catch (Exception e)
                {
                    // mConn.Close();
                    clearStackList(stackID);

                }
            }



            //  Console.ReadKey();

            mConn.Close();

            //Console.ReadKey();





        }
    }
}
