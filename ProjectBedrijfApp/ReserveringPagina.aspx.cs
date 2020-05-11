using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class ReserveringPagina : System.Web.UI.Page
    {
        private int SelectedTafelID;
        private string tijdvak;
        private int Reserveringsnummer;
        public List<string> tafelID = new List<string>();

        SqlCommand command;
        SqlDataAdapter adapter = new SqlDataAdapter();
        String sql = "";

        SqlConnection connnection = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");


        protected void Page_Load(object sender, EventArgs e)
        {
            Reserveringsnummer = (int)Session["Reserveringsnummer"];
            tafelID = (List<string>)Session["TafelId"];

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string combindedString = string.Join(",", tafelID);
            Label3.Text = "Gekozen tafels: " + combindedString + "   Reservering nummmer: "+ Reserveringsnummer.ToString() + "\r\n" + "  gekozen tijdvak: " + tijdvak + "\r\n" + "  het aantal personen: " + TextBox1.Text;

            connnection.Open();
            sql = "Insert into Tafel_Reservering(combindedString,Reserveringsnummer,tijdvak, TextBox1.Text)";
            command = new SqlCommand(sql, connnection);
            adapter.InsertCommand = new SqlCommand(sql, connnection);
            adapter.InsertCommand.ExecuteNonQuery();

            command.Dispose();
            connnection.Close();
        }

        

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Console.Write("Enter your name: ");
            if (RadioButton1.Checked)
            {
                RadioButton2.Checked = false;
            }
            tijdvak = RadioButton1.Text;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Console.Write("Enter your name: ");
            if (RadioButton2.Checked)
            {
                RadioButton1.Checked = false;
            }
            tijdvak = RadioButton2.Text;
        }
    }
}