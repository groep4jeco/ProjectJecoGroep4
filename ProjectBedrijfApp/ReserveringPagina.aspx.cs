using System;
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
using System.Web.Services.Description;
using System.IO;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

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
        SqlDataReader drklant;

        private int klantid;
        public int resultaatklant;


        int allin;
        string time;
        string tijdvakdata;
        int aantalrondes;

        string telefoonnummer;
        string email;
        int teller;
        bool clicked;
        int kinderen;

        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");


        protected void Page_Load(object sender, EventArgs e)
        {
            // Reserveringsnummer = (int)Session["Reserveringsnummer"];
            tafelID = (List<string>)Session["TafelId"];
            teller = tafelID.Count();
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
            if (TxtKind.Text == "")
            {
                kinderen = 0;
            }
            else
            {
                kinderen = int.Parse(TxtKind.Text);
            }

            if (int.Parse(TxtVolw.Text) + kinderen > teller * 2)
            {
                lblSorry.Text = "Het aantal personen is hoger dan de capiciteit van de tafels ga terug naar het overzicht en selecteer meer tafels";
            }


            else
            {
                if (RadioButton1.Checked == false && RadioButton2.Checked == false)
                {
                    lblSorry.Text = "Vink een tijdvak aan";
                }
                else
                {
                    lblSorry.Text = "";

                    if (RadioButton1.Checked == true)
                    {
                        time = "17:00:00";
                        var result = Convert.ToDateTime(time);
                        tijdvakdata = result.ToString("hh:mm:ss tt", CultureInfo.CurrentCulture);
                    }

                    else if (RadioButton2.Checked == true)
                    {
                        time = "19:30:00";
                        var result = Convert.ToDateTime(time);
                        tijdvakdata = result.ToString("hh:mm:ss");
                    }

                    try
                    {
                        aantalrondes = int.Parse(txtRondes.Text);
                    }
                    catch
                    {
                        aantalrondes = 0;
                    }
                    finally
                    {

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
                    string invoegen = "Begin transaction; Insert into in_restaurant([All you can eat], [Aantal rondes], [ReserveringsstatusStatus ID], TijdvakNummer, [Aantal kinderen], [Aantal Volwassenen], Reserveringsnummer)  values(@allin, @aantalrondes, 2, (select Tijdvak.Nummer from Tijdvak where Begintijd = @tijd AND Dag = @dagprobeer), @volw, @kind, @reserveringsnummers); commit;";
                    //command = new SqlCommand(invoegen, connnection);
                    //
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
                    adapter.InsertCommand.Parameters.AddWithValue("@tijd", time);
                    adapter.InsertCommand.Parameters.AddWithValue("@allin", allin);
                    adapter.InsertCommand.Parameters.AddWithValue("@volw", TxtVolw.Text);
                    adapter.InsertCommand.Parameters.AddWithValue("@kind", kinderen);
                    adapter.InsertCommand.Parameters.AddWithValue("@aantalrondes", aantalrondes);
                    int probeer = adapter.InsertCommand.ExecuteNonQuery();

                    con.Close();

                    foreach (var item in tafelID)
                    {
                        con.Open();
                        string tafelreservering = "INSERT INTO Tafel_Reservering (TafelTafelnummer, [TafelRestaurantRestaurant ID], [Reserveringsnummer]) VALUES (@tafelnummer, @restaurant, @reservering)";
                        adapter.InsertCommand = new SqlCommand(tafelreservering, con);
                        adapter.InsertCommand.Parameters.AddWithValue("@reservering", Session["Reserveringsnummer"]);
                        adapter.InsertCommand.Parameters.AddWithValue("@tafelnummer", item);
                        adapter.InsertCommand.Parameters.AddWithValue("@restaurant", 1);
                        int tafeltjes = adapter.InsertCommand.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            Response.Redirect("~/overview.aspx");
        }


        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                RadioButton2.Checked = false;
            }
            tijdvak = RadioButton1.Text;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton2.Checked)
            {
                RadioButton1.Checked = false;
            }
            tijdvak = RadioButton2.Text;
        }

        protected void BtnZoek_Click(object sender, EventArgs e)
        {
            lblSorry.Text = "";
            /*
            for (int i = 25; i < 80; i++)
            {
                con.Open();
                string tafels = "Insert into Tafel (Tafelnummer, Zitplaatsen, [RestaurantRestaurant ID]) VALUES (@i, 2, 1)";
                adapter.InsertCommand = new SqlCommand(tafels, con);
                adapter.InsertCommand.Parameters.AddWithValue("@i", i);
                int tewekeke = adapter.InsertCommand.ExecuteNonQuery();
                con.Close();
            }
            */
        }

        protected void cbAlles_CheckedChanged(object sender, EventArgs e)
        {
            if (cbAlles.Checked == true)
            {
                txtRondes.Visible = true;
                lblRondes.Visible = true;
                allin = 1;
            }
            if (cbAlles.Checked == false)
            {
                txtRondes.Visible = false;
                lblRondes.Visible = false;
                allin = 0;
            }
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {

        }

        private int telrijen()
        {
            int count = GridView1.Rows.Count;
            TxtVolw.Text = count.ToString();
            btnNieuw.Visible = true;
            lblEmail.Visible = true;
            txtEmail.Visible = true;
            lbltelefoon.Visible = true;
            Txttelefoon.Visible = true;
            return count;
        }

        protected void txtVoornaam_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                telrijen();
            }

        }

        protected void btnNieuw_Click(object sender, EventArgs e)
        {


            if (txtVoornaam.Text != "" || txtAchternaam.Text != "")
            {

                System.Diagnostics.Debug.WriteLine(clicked);
                string nieuwe_klant = "Insert into Klant (Voornaam, Achternaam, Email, Telefoonnummer) VALUES (@voornaam, @achternaam, @email, @telefoon)";
                con.Open();
                adapter.InsertCommand = new SqlCommand(nieuwe_klant, con);
                adapter.InsertCommand.Parameters.AddWithValue("@voornaam", txtVoornaam.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@achternaam", txtAchternaam.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@email", txtEmail.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@telefoon", Txttelefoon.Text);
                int probeer = adapter.InsertCommand.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();




            }

            if (txtVoornaam.Text == "" || txtAchternaam.Text == "")
            {
                lblSorry.Text = "De voor en achternaam zijn niet ingevuld.";
            }

        }

        protected void TxtVolw_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtRondes_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Txttelefoon_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/overview.aspx");
        }
    }
}