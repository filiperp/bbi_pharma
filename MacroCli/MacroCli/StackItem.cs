using System;
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
using MacroCli;


namespace MacroCli
{

    //Nome	CD	Material	Venda_Media	Estoque_chao	Estoque_Transito	Estoque_Pendente	Estoque_total	Dias_Chao	Dias_total	Ean	Distribuidor	Tipo	Valor	Periodo
    //La Bamba	AL	ALOIS 10MG CPR 1X30 (C1)	19,75	18	0	12	30			7896637023375	92	Venda	0	29/03/2015



    class StackItem
    {
        public int stackID;
        public string nome;
        public string cd;
        public string material;
        public double vendaMedia;
        public double estoqueChao;
        public double estoqueTransito;
        public double estoquePendente;
        public double estoqueTotal;
        public double diasChao;
        public double diasTotal;
        public string ean;
        public string tipo;
        public double valor;
        public DateTime periodo;

        public void save(MySqlConnection conn)
        {




           // conn.Open();
            MySqlCommand command = new MySqlCommand();
            string SQL = "INSERT INTO pharma.stackitem(stackID,nome,cd,material,vendamedia,estoquechao,estoquetransito,estoquependente,estoquetotal,diaschao,diastotal,ean,tipo,valor,periodo)VALUES(" +
                "" + this.stackID.ToString() + "," +
                "'" + this.nome + "'," +
                "'" + this.cd + "'," +
                "'" + this.material + "'," +
                "" + this.vendaMedia.ToString() + "," +
                "" + this.estoqueChao.ToString() + "," +
                "" + this.estoqueTransito.ToString() + "," +
                "" + this.estoquePendente.ToString() + "," +
                "" + this.estoqueTotal.ToString() + "," +
                "" + this.diasChao.ToString() + "," +
                "" + this.diasTotal.ToString() + "," +
                "'" + this.ean + "'," +
                "'" + this.tipo + "'," +
                "" + this.valor.ToString() + "," +
                "'" + this.periodo.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture) +
                "');";
           
           
                command.CommandText = SQL;
                command.Connection = conn;
                command.ExecuteNonQuery();
           
           
           
           // conn.Close();



            Program.log("ADMIN", "", "SALVO item: " + this.stackID.ToString(), "save");


        }





    }


}
