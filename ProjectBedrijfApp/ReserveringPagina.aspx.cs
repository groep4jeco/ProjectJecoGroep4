using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


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

        int allin;
        string tijdvakdata;

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
            if (cbAlles.Checked = true)
            {
                allin = 1;
            }

            else
            {
                allin = 0;
                
            }
            int aantalrondes = int.Parse(txtRondes.Text);

            if (RadioButton1.Checked = true)
            {
                tijdvakdata = "17:00:00.0000000";
            }

            else if (RadioButton2.Checked = true)
            {
                tijdvakdata = "19:30:00.0000000";
            }

            DateTime dagvandaag = DateTime.Now;
            string dag = dagvandaag.DayOfWeek.ToString();
            
            connnection.Open();
            string invoegen = "Begin transaction; Insert into in_restaurant([All you can eat], [Aantal rondes], [ReserveringsstatusStatus ID], TijdvakNummer, [Aantal kinderen], [Aantal Volwassenen]) " +
                "values('allin', 'aantalrondes', 2, (select Tijdvak.Nummer from Tijdvak where Begintijd = 'tijdvakdata' AND Dag = dag), 2, 2); commit;";
            command = new SqlCommand(invoegen, connnection);
            //command.CommandType = CommandType.StoredProcedure;
            adapter.InsertCommand = new SqlCommand(invoegen, connnection);
            int probeer = adapter.InsertCommand.ExecuteNonQuery();

            //command.Dispose();
            //connnection.Close();

            //int resultaatklant = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            //string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
            //SqlCommand cmdklant = new SqlCommand(querieklant, con);
            //cmdklant.Parameters.AddWithValue("@IDKLANT", resultaatklant);
            // SqlDataReader drklant = cmdklant.ExecuteReader();
            // string resultaatklant2 = drklant.Read().ToString();
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