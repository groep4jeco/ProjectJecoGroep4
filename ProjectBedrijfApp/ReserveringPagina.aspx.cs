﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography.X509Certificates;
using System.Xml.Schema;
using System.Security.Principal;
using System.Drawing.Printing;
using System.Collections;
using System.Globalization;



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
        SqlDataAdapter adapter2 = new SqlDataAdapter();
        String sql = "";

        private int klantid;
        public int resultaatklant;


        int allin;
        string  tijdvakdata;
        int aantalrondes;

        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");


        protected void Page_Load(object sender, EventArgs e)
        {
            Reserveringsnummer = (int)Session["Reserveringsnummer"];
            tafelID = (List<string>)Session["TafelId"];

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantID"] != null)
            {
                Session["klantid"] = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantID"];
            }
            
            lbldatum.Text = Session["klantid"].ToString();
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string combindedString = string.Join(",", tafelID);
            Label3.Text = "Gekozen tafels: " + combindedString + "   Reservering nummmer: "+ Reserveringsnummer.ToString() + "\r\n" + "  gekozen tijdvak: " + tijdvak + "\r\n" + "  het aantal personen: " + TextBox1.Text;
            if (cbAlles.Checked == true)
            {
                allin = 1;
                txtRondes.Visible = true;
            }

            else
            {
                allin = 0;
                
            }

            if (RadioButton1.Checked == true)
            {
                tijdvakdata = "17:00:00.0000000";
            }

            else if (RadioButton2.Checked == true)
            {
                tijdvakdata = "19:30:00.0000000";
            }

            if (txtRondes.Visible == false)
            {
                 aantalrondes = 0;
            }

            else
            {
                aantalrondes = int.Parse(txtRondes.Text);
            }

            CultureInfo dutch = new CultureInfo("nl-NL");
            DateTime dagvandaag = DateTime.Now;
            string dagen = dutch.DateTimeFormat.GetDayName(dagvandaag.DayOfWeek).ToString();
            string dagen2 = dagen.ToString();
            Label1.Text = dagen2;
            string datum = dagvandaag.ToString("yyyy-MM-dd");
            DateTime test = DateTime.Parse(datum);

            string reservering = "Insert into reservering(datum, klantklantID, [RestaurantRestaurant ID]) values (@datum, @klant, @restaurant)";
            string reserveringsnummer = "select reserveringsnummer from reservering where klantklantid = @klant AND datum = @datum AND [RestaurantRestaurant ID] = @restaurant";
            string invoegen = "Begin transaction; Insert into in_restaurant([All you can eat], [Aantal rondes], [ReserveringsstatusStatus ID], TijdvakNummer, [Aantal kinderen], [Aantal Volwassenen], Reserveringsnummer)  values(CAST( 'allin' AS BINARY(2) ), @aantalrondes, 2, (select Tijdvak.Nummer from Tijdvak where Begintijd = CAST('5pm' AS time) AND Dag = @dagprobeer), 2, 2, @reserveringsnummers); commit;";
            //command = new SqlCommand(invoegen, connnection);
            con.Open();
            adapter2.InsertCommand = new SqlCommand(reservering, con);
            adapter2.InsertCommand.Parameters.AddWithValue("@datum", test);
            adapter2.InsertCommand.Parameters.AddWithValue("@klant", Session["klantid"]);
            adapter2.InsertCommand.Parameters.AddWithValue("@restaurant", 1);
            int probeer1 = adapter2.InsertCommand.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cmdklant = new SqlCommand(reserveringsnummer, con);
            cmdklant.Parameters.AddWithValue("@datum", test);
            cmdklant.Parameters.AddWithValue("@klant", Session["klantid"]);
            cmdklant.Parameters.AddWithValue("@restaurant", 1);
            SqlDataReader drklant = cmdklant.ExecuteReader();
             string resultaatklant2 = drklant.Read().ToString();
            Session["Reserveringsnummer"] = drklant["Reserveringsnummer"];
            drklant.Close();

            con.Close();

            con.Open();
                //command.CommandType = CommandType.StoredProcedure;
            adapter.InsertCommand = new SqlCommand(invoegen, con);
            adapter.InsertCommand.Parameters.AddWithValue("@reserveringsnummers", Session["Reserveringsnummer"]);
            adapter.InsertCommand.Parameters.AddWithValue("@dagprobeer", dagen2);
            adapter.InsertCommand.Parameters.AddWithValue("@aantalrondes", aantalrondes);
            int probeer = adapter.InsertCommand.ExecuteNonQuery();
            con.Close();

            //command.Dispose();
            //connnection.Close();

            //int resultaatklant = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            //string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
           
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

        protected void BtnZoek_Click(object sender, EventArgs e)
        {

        }


    }
}