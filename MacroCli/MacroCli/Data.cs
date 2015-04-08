using System;
using System.Collections.Generic;

namespace MacroCli
{
    class Data
    {
        public static string InputPath;


        public static string OutputPath;


        public static string MacroPath;

            public static string user;
            public static string distributor;
            public static DateTime date;
            public static int year;
            public static int month;
            public static int day;
            public static int stackID;
            public static List<StackItem> listITems;

        public static void resolveParams(string[] args){

            InputPath = Config.PATH_UPLOAD + args[0];
            OutputPath = Config.PATH_READY + args[1];
            MacroPath = Config.PATH_MACRO + args[2];
            user = args[3];
            distributor = args[4];
            date = DateTime.ParseExact(args[5], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            year = date.Year;
            month = date.Month;
            day = date.Day;




            //InputPath = Config.PATH_UPLOAD + "American Farma_filipe_af.xls";
            //OutputPath = Config.PATH_READY + "American Farma_filipe_af.xlsx";
            //MacroPath = Config.PATH_MACRO + "american_farma.vbs";
            //user = "filipep";
            //distributor = "filie SA";
            //date = DateTime.ParseExact("11/11/1999", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //year = date.Year;
            //month = date.Month;
            //day = date.Day;


                

            //}
        }

           


       
           

           

    }
}
