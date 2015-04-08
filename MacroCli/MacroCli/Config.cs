using MySql.Data.MySqlClient;
using System;
using System.Globalization;


namespace MacroCli
{
    class Config
    {
        private static MySqlConnection mConn = null;

        public static string LOG_TXT_PATH = "C:\\Program Files (x86)\\Ampps\\www\\log.txt";
        public static string PATH_UPLOAD = @"C:\\\\Program Files (x86)\\\\Ampps\\\\www\\\\uploads\\\\";
        public static string PATH_READY = @"C:\\\\Program Files (x86)\\\\Ampps\\\\www\\\\ready\\\\";
        public static string PATH_MACRO = @"C:\\\\Program Files (x86)\\\\Ampps\\\\www\\\\macros\\\\";



        //public static string PATH_UPLOAD = "../uploads/";
        //public static string PATH_READY = "../ready/";
        //public static string PATH_MACRO = "../macros/";
        public static bool TRACING = true;




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
