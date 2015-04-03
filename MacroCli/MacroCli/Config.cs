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
    class Config
    {
        private static MySqlConnection mConn = null;

        public  const string LOG_TXT_PATH = "C:\\log.txt";
        public  const string BASE_PATH = "c:\\";
        public  bool TRACING = true;


        public  const bool LOG_CONSOLE = false;

        public static MySqlConnection getConn()
        {
            if(mConn==null){
                mConn = new MySqlConnection("Persist Security Info=False;server=localhost;database=pharma;uid=root;server=localhost;uid=root;pwd=Mudar#123");
                mConn.Open();
            }
            return mConn;

        }

        public static string nowString()
        {
            DateTime d = DateTime.Now;
            return  d.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
        }
        public static double toDouble(string value)
        {
            double res = 0;
            try
            {
                value = value.Replace(".", "");
                value = value.Replace(",", ".");
                res = Convert.ToDouble(value);
            }
            catch
            {
                res = 0;
            }
            return res;
        }

    }
}
