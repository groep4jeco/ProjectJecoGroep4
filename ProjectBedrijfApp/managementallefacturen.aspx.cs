using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography.X509Certificates;
using System.Xml.Schema;
using System.Security.Principal;
using System.Drawing.Printing;
using System.Collections;
using System.Globalization;

namespace ProjectBedrijfApp
{
    public partial class managementallefacturen : System.Web.UI.Page
    {
        DateTime kalender = DateTime.Today;
        string time;
        bool drinkenbestellen;
        string tijdvakdata;
        int tijdvaknummer;
        string tijden;
        int reserveringsnummer;
        int volmetallin;
        int kinderenmetallin;
        int AantalExtraRondes;

        int menuutjes;
        protected void Page_Load(object sender, EventArgs e)
        {
            kalender = calendarTest.SelectedDate;
            Panel2.Visible = false;
        }
        [System.ComponentModel.Browsable(false)]
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void BtnZoek_Click(object sender, EventArgs e)
        {
            string datum = calendarTest.SelectedDate.ToString("yyyy-MM-dd");
            DateTime test = DateTime.Parse(datum);

            CultureInfo dutch = new CultureInfo("nl-NL");
            DateTime dagvandaag = DateTime.Now;
            string dagen = dutch.DateTimeFormat.GetDayName(dagvandaag.DayOfWeek).ToString();
            string dagen2 = dagen.ToString();
            Label1.Text = dagen2;




        }

        protected void DataList1_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)

        {
            reserveringsnummer = (int)GridView1.DataKeys[GridView1.SelectedIndex]["Reserveringsnummer"];
            extrarondes();

            kalender = calendarTest.SelectedDate;
            Panel2.Visible = true;
            int resultaat = (int)GridView1.DataKeys[GridView1.SelectedIndex]["Restaurant ID"];
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            con.Open();
            string querie = "SELECT[Naam], [Adres], [Plaats] FROM[Restaurant] WHERE [Restaurant ID] = @ID";
            SqlCommand cmd = new SqlCommand(querie, con);
            cmd.Parameters.AddWithValue("@ID", resultaat);
            SqlDataReader dr = cmd.ExecuteReader();
            string resultaat2 = dr.Read().ToString();
            Label3.Text = dr["Naam"].ToString();
            Label4.Text = dr["Adres"].ToString();
            Label5.Text = dr["Plaats"].ToString();
            dr.Close();
            int resultaatklant = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
            SqlCommand cmdklant = new SqlCommand(querieklant, con);
            cmdklant.Parameters.AddWithValue("@IDKLANT", resultaatklant);
            SqlDataReader drklant = cmdklant.ExecuteReader();
            string resultaatklant2 = drklant.Read().ToString();
            Label6.Text = drklant["Voornaam"].ToString() + ' ' + drklant["Achternaam"].ToString();
            Label7.Text = drklant["Email"].ToString();
            Label8.Text = drklant["Telefoonnummer"].ToString();

            drklant.Close();

            int resultaatadres = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            string querieadres = "SELECT Online_bestellen.AdresHuisnummer, Online_bestellen.AdresPostcode, adres.Straatnaam, adres.Plaats FROM [Klant] INNER JOIN Adres on adres.KlantKlantID = klant.KlantID inner join Online_bestellen on Adres.Postcode = Online_bestellen.AdresPostcode  WHERE [KlantKlantID] = @IDKLANT";
            SqlCommand cmdadres = new SqlCommand(querieadres, con);
            cmdadres.Parameters.AddWithValue("@IDKLANT", resultaatadres);
            SqlDataReader dradres = cmdadres.ExecuteReader();

            try
            {

                Label9.Visible = true;
                Label10.Visible = true;
                Label11.Visible = true;

                string resultaatadres2 = dradres.Read().ToString();
                Label9.Text = dradres["Straatnaam"].ToString() + ' ' + dradres["AdresHuisnummer"].ToString();
                Label10.Text = dradres["AdresPostcode"].ToString() + ' ' + dradres["Plaats"].ToString();
                Label11.Text = dradres["Straatnaam"].ToString();

            }
            catch
            {
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;

            }
            finally
            {

            }
            dradres.Close();
            int resultaattotaal = (int)GridView1.DataKeys[GridView1.SelectedIndex]["Factuurnummer"];
            string queriefactuur = "SELECT [Totaalbedrag] FROM [Factuur] WHERE [Factuurnummer] = @Factuurnummer";
            SqlCommand cmdfactuur = new SqlCommand(queriefactuur, con);
            cmdfactuur.Parameters.AddWithValue("@Factuurnummer", resultaattotaal);
            SqlDataReader drfactuur = cmdfactuur.ExecuteReader();
            string resultaatfactuur = drfactuur.Read().ToString();
            string factuurtotaal = drfactuur["Totaalbedrag"].ToString();
            double probeer = double.Parse(factuurtotaal);
            double label12 = probeer / 1.09;
            double label13 = probeer / 109 * 9;
            Label14.Text = drfactuur["Totaalbedrag"].ToString();
            Label12.Text = label12.ToString("0.00");
            Label13.Text = label13.ToString("0.00");

            drfactuur.Close();
            con.Close();

            string eerstekind = "select [Aantal kinderen] from in_restaurant where Reserveringsnummer = @reservering";
            string eerstevol = "select [Aantal Volwassenen] from in_restaurant where Reserveringsnummer = @reservering";

            con.Open();
            SqlCommand cmdvol = new SqlCommand(eerstevol, con);
            cmdvol.Parameters.AddWithValue("@reservering", reserveringsnummer);
            object volwassenen = cmdvol.ExecuteScalar();
            string aantalv = volwassenen.ToString();
            int volw = int.Parse(aantalv);

            SqlCommand cmdkind = new SqlCommand(eerstekind, con);
            cmdkind.Parameters.AddWithValue("@reservering", reserveringsnummer);
            object kinderen1 = cmdkind.ExecuteScalar();
            string kinderen = kinderen1.ToString();
            int kind = int.Parse(kinderen);
            con.Close();

            try
            {
                string allin = "select [Aantal arregementen] from in_restaurant where Reserveringsnummer = @reservering";
                con.Open();
                SqlCommand cmdalles = new SqlCommand(allin, con);
                cmdalles.Parameters.AddWithValue("@reservering", reserveringsnummer);
                object allinss = cmdalles.ExecuteScalar();
                string arregementen1 = allinss.ToString();
                menuutjes = int.Parse(arregementen1);
                con.Close();
            }

            catch
            {
                menuutjes = 0;
            }

            finally
            {
                con.Close();
            }

            if (menuutjes > volw)
            {
                kinderenmetallin = menuutjes - volw;
                volmetallin = menuutjes - kinderenmetallin;
            }

            if (menuutjes <= volw)
            {
                int volwzonderallin = volw - menuutjes;
                volmetallin = volw - volwzonderallin;
            }

            //int kinderenmetallin = menuutjes - volw;
            // int volwzonderallin = volw - menuutjes;
            //int volmetallin = volw - volwzonderallin;

            lblAantalKind.Text = kinderenmetallin.ToString();
            lblAantalVolw.Text = volmetallin.ToString();

            CultureInfo dutch = new CultureInfo("nl-NL");
            DateTime dagvandaag = DateTime.Now;
            string dagen = dutch.DateTimeFormat.GetDayName(dagvandaag.DayOfWeek).ToString();

            TimeSpan startdeel1 = new TimeSpan(16, 50, 0);
            TimeSpan enddeel1 = new TimeSpan(19, 15, 0);
            TimeSpan now = new TimeSpan(17, 30, 0);
            if (startdeel1 < enddeel1 && startdeel1 <= now && now <= enddeel1)
            {
                time = "17:00:00";
            }
            TimeSpan startdeel2 = new TimeSpan(19, 15, 0);
            TimeSpan enddeel2 = new TimeSpan(21, 30, 0);
            if (startdeel2 < enddeel2 && startdeel2 <= now && now <= enddeel2)
            {
                time = "19:30:00";
            }

            con.Open();
            string prequerie = "select Tijdvak.Nummer from Tijdvak where Begintijd = @tijd AND Dag = @dag";
            SqlCommand cmdtijdvak = new SqlCommand(prequerie, con);
            cmdtijdvak.Parameters.AddWithValue("@dag", dagen);
            cmdtijdvak.Parameters.AddWithValue("@tijd", time);
            object tijd2 = cmdtijdvak.ExecuteScalar();
            tijden = tijd2.ToString();
            tijdvaknummer = int.Parse(tijden);
            Session["tijdvaknummer"] = tijdvaknummer;
            con.Close();
            con.Open();
            string zoekprijsvolw = "select [prijs volwassenen] from tijdvak where Nummer = @tijdvak";
            SqlCommand cmdprijsv = new SqlCommand(zoekprijsvolw, con);
            cmdprijsv.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
            object prijsv = cmdprijsv.ExecuteScalar();
            string prijsvol = prijsv.ToString();
            double prijsvolwassenen = double.Parse(prijsvol) * volmetallin;

            string zoekprijsvolkind = "select [prijs kinderen] from tijdvak where Nummer = @tijdvak";
            SqlCommand cmdprijsk = new SqlCommand(zoekprijsvolkind, con);
            cmdprijsk.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
            object prijsk = cmdprijsk.ExecuteScalar();
            string prijskin = prijsk.ToString();
            double prijskids = double.Parse(prijskin) * kinderenmetallin;

            lblTotKind.Text = prijskids.ToString();
            lblTotVolw.Text = prijsvolwassenen.ToString();

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void calendarTest_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "panel2.print()", true);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/tabletkeuze.aspx");
        }

        protected void btnPrint_Click1(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void extrarondes()

        {
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            string vraagoprondes = "select [Extra rondes] from in_restaurant where Reserveringsnummer = @reservering";
            con.Open();
            try
            {
                SqlCommand cmdrondes = new SqlCommand(vraagoprondes, con);
                cmdrondes.Parameters.AddWithValue("@reservering", reserveringsnummer);
                object objrondes = cmdrondes.ExecuteScalar();
                string extraro = objrondes.ToString();
                AantalExtraRondes = int.Parse(extraro);
                con.Close();
            }
            catch { AantalExtraRondes = 0; }
            finally { con.Close(); }

            if (AantalExtraRondes == 0)
            {
                lbllatenzien.Visible = false;
            }
            else
            {
                int prijs = AantalExtraRondes * 5;
                LblExtraRondesPrijs.Text = prijs.ToString("0.00");
                lblExtrarondes.Text = AantalExtraRondes.ToString();
            }


        }
    }
}