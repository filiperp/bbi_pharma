using MySql.Data.MySqlClient;
using System;
using System.IO;
namespace MacroCli
{
    class Log
    {

        public static void log(string msg)
        {
            log(" ", Data.stackID.ToString(), msg, " ");
        }
        public static void log(string msg, string ID)
        {
            log(" ",ID, msg, " ");
        }
        public static void log(string user, string id, string message, string action)
        {

            message = message.Replace("'", "#");
            message = message.Replace("\"", "#");
              string SQL = " " ;
            if (Config.LOG_CONSOLE)
            {
               Console.WriteLine("{0}:{1}-{2}-{3}-{4}", Config.nowString(), user, id, message, action);
            }
            bool logged = false;
            while (!logged)
            {
                try
                {
                    MySqlCommand command = new MySqlCommand();
                 SQL = "INSERT INTO pharma.log(log_id,log_date,log_user,log_import,log_action,log_msg)VALUES(null,now(),'" + user +
                        "','" + id + "','" + action + "','" + message + "');";
                    command.CommandText = SQL;
                    command.Connection = Config.getConn();
                    command.ExecuteNonQuery();
                    logged = true;
                }
                catch (Exception ex)
                {
                    logTxt("Error createLog: " + SQL);
                    logTxt("Error createLog: " + ex.ToString());
                }
            }
        }

        public static void logTxt(string msg)
        {
            string lines = Config.nowString() +" - " + msg;
            System.IO.StreamWriter file;
            if (!File.Exists(Config.LOG_TXT_PATH))
            {
                file = new System.IO.StreamWriter(Config.LOG_TXT_PATH);
            }
            else
            {
                file = File.AppendText(Config.LOG_TXT_PATH);
            }
            file.WriteLine(lines);
            file.Close();
        }
    }
}
