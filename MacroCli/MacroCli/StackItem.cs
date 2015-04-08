using MySql.Data.MySqlClient;
using System;
using System.Globalization;


namespace MacroCli
{

    //Nome	CD	Material	Venda_Media	Estoque_chao	Estoque_Transito	Estoque_Pendente	Estoque_total	Dias_Chao	Dias_total	Ean	Distribuidor	Tipo	Valor	Periodo
    //La Bamba	AL	ALOIS 10MG CPR 1X30 (C1)	19,75	18	0	12	30			7896637023375	92	Venda	0	29/03/2015



    class StackItem
    {
        public int stackID;
        public string distribuidor;
        public string cd;
        public string apresentacao;
        public string ean;
        public string tipo;
        public string info;
        public double valor;
        public DateTime periodo;



        public void save(MySqlConnection conn)
        {




            // conn.Open();
            MySqlCommand command = new MySqlCommand();
            string SQL = "INSERT INTO pharma.stackitem(stackID,distribuidor,cd,apresentacao,ean,tipo,info,valor,periodo)VALUES(" +
                "" + this.stackID.ToString() + "," +
                "'" + this.distribuidor + "'," +
                "'" + this.cd + "'," +
                "'" + this.apresentacao + "'," +
                "'" + this.ean + "'," +
                "'" + this.tipo + "'," +
                "'" + this.info + "'," +
                "" + this.valor.ToString() + "," +
                "'" + this.periodo.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture) +
                "');";


            command.CommandText = SQL;
            command.Connection = conn;
            command.ExecuteNonQuery();



            // conn.Close();





            //  Log.log("ADMIN", "", "SALVO item: " + this.stackID.ToString(), "save");


        }

        public override string ToString()
        {
            string res = this.stackID.ToString() + ";" +
           this.distribuidor + ";" +
           this.cd + ";" +
           this.apresentacao + ";" +
           this.ean + ";" +

           this.tipo + ";" +
           this.info + ";" +
           this.valor.ToString() + ";" +
           this.periodo.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
            return res;
        }





    }


}
