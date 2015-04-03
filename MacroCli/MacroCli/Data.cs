using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MacroCli
{
    class Data
    {
            public static string inputPath;
            public static string outputPath;
            public static string macroPath;
            public static string user;
            public static string distributor;
            public static DateTime date;
            public static int year;
            public static int month;
            public static int day;
            public static int stackID;
            public static List<StackItem> listITems;

        public static void resolveParams(string[] args){

            inputPath = args[0];
            outputPath = args[1];
            macroPath = args[2];
            user = args[3];
            distributor = args[4];
            date = DateTime.ParseExact(args[5], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            year = date.Year;
            month = date.Month;
            day = date.Day;

            //if(args.Length!=5){
            //    inputPath = Config.BASE_PATH + "american_farma.xls";
            //    outputPath = Config.BASE_PATH + "american_farma_out.xlsx";
            //    macroPath = Config.BASE_PATH + "american_farma.vbs";
            //    user = "user";
            //    distributor = "distributor";
            //    date = DateTime.ParseExact("25/06/1983", "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //    year = date.Year;
            //    month = date.Month;
            //    day = date.Day;
              

            //}else{
            //    inputPath = args[0];
            //    outputPath = args[1];
            //    macroPath = args[2];
            //    user = args[3];
            //    distributor = args[4];
            //    date = DateTime.ParseExact(args[5], "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //    year = date.Year;
            //    month = date.Month;
            //    day = date.Day;


                

            //}
        }

           


       
           

           

    }
}
