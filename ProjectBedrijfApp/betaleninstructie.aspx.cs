using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Globalization;
using System.Web.UI.DataVisualization.Charting;

namespace ProjectBedrijfApp
{
    public partial class betaleninstructie : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
        DateTime kalender = DateTime.Today;
        string time;
        bool drinkenbestellen;
        string tijdvakdata;
        int tijdvaknummer;
        string tijden;
        int resultaatklant;
        int reserveringsnummer;
        int resultaattotaal;
        int volmetallin;
        int kinderenmetallin;
        double drankentotaal;
        double foodtotaal;
        double prijskids;
        int menuutjes;
        double prijsvolwassenen;
        double labeltje14;
        double subtotaal;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("betalen.aspx");
        }

        protected void txtinvoeremail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void btnzoekfactuur_Click(object sender, EventArgs e)
        {
            int tafelnummer = int.Parse(txttafelnummer.Text);
            con.Open();

            string reserveringophalen = "select Reserveringsnummer from tafelbezetting where TafelTafelnummer = @tafel";
            SqlCommand cmdtafel = new SqlCommand(reserveringophalen, con);
            cmdtafel.Parameters.AddWithValue("@tafel", tafelnummer);
            object objreservering = cmdtafel.ExecuteScalar();
           

            if (objreservering == null)

            {
                lblValidator.Visible = true;


            }

            else

            {
                lblValidator.Visible = false;
                string stringreservering = objreservering.ToString();
                reserveringsnummer = int.Parse(stringreservering);
                Session["tafel"] = reserveringsnummer;
            }
            con.Close();


            con.Open();
            string querie = "SELECT[Naam], [Adres], [Plaats] FROM[Restaurant] WHERE [Restaurant ID] = @ID";
            SqlCommand cmd = new SqlCommand(querie, con);

            cmd.Parameters.AddWithValue("@ID", 1);
            SqlDataReader dr = cmd.ExecuteReader();
            string resultaat2 = dr.Read().ToString();
            Label3.Text = dr["Naam"].ToString();
            Label4.Text = dr["Adres"].ToString();
            Label5.Text = dr["Plaats"].ToString();
            dr.Close();
        }


        protected void Button2_Click(object sender, EventArgs e)

        {

            foreach (GridViewRow gvr in GridView1.Rows)

            {
                resultaattotaal = (int)GridView1.DataKeys[gvr.RowIndex].Values["Factuurnummer"];
            }
            Session["factuurnummer"] = resultaattotaal;
            foreach (GridViewRow gvr in GridView1.Rows)

            {
                resultaatklant = (int)GridView1.DataKeys[gvr.RowIndex].Values["KlantKlantID"];
            }

            con.Open();


            string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
            SqlCommand cmdklant = new SqlCommand(querieklant, con);
            cmdklant.Parameters.AddWithValue("@IDKLANT", resultaatklant);
            SqlDataReader drklant = cmdklant.ExecuteReader();
            string resultaatklant2 = drklant.Read().ToString();
            Label6.Text = drklant["Voornaam"].ToString() + ' ' + drklant["Achternaam"].ToString();
            Label7.Text = drklant["Email"].ToString();
            Label8.Text = drklant["Telefoonnummer"].ToString();

            drklant.Close();



            string querieadres = "SELECT Online_bestellen.AdresHuisnummer, Online_bestellen.AdresPostcode, adres.Straatnaam, adres.Plaats FROM [Klant] INNER JOIN Adres on adres.KlantKlantID = klant.KlantID inner join Online_bestellen on Adres.Postcode = Online_bestellen.AdresPostcode  WHERE [KlantKlantID] = @IDKLANT";
            SqlCommand cmdadres = new SqlCommand(querieadres, con);
            cmdadres.Parameters.AddWithValue("@IDKLANT", resultaatklant);
            SqlDataReader dradres = cmdadres.ExecuteReader();
            con.Close();
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



            bijwerken();
            subtotaal = labeltje14;



            /////dit label komt de labels waar de kortingen vanaf gaan//////labelnaam.text = subtotaal.tostring("0.00")
            allinmenu();




        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            try
            {
                con.Open();

                string query = "SELECT[Kortingscode], [Catogorienummer], korting FROM[Actie] WHERE[Kortingscode] = @korting";
                string invoer = TextBox1.Text;



                SqlCommand cmdSchedule = new SqlCommand(query, con);

                cmdSchedule.Parameters.AddWithValue("@korting", invoer);


                SqlDataReader dr = cmdSchedule.ExecuteReader();
                string resulaat = dr.Read().ToString();
                string ikwilweten = dr["Kortingscode"].ToString();

                if (dr["Kortingscode"].ToString() == invoer)
                {

                    string cat = dr["Catogorienummer"].ToString();

                    if (cat == "1") //drankjes
                    {

                        string kortingp = dr["korting"].ToString();
                        double kortingdrank = (double)drankentotaal * double.Parse(kortingp);
                        double test = (double)drankentotaal - kortingdrank;
                        dr.Close();
                        int weetikveel = (int)Session["factuurnummer"];
                        string poging = kortingdrank.ToString();
                        /////dit label is voor kortingbedrag//////labelnaam.text = kortingdrank.tostring("0.00")
                        string optellen = "Update factuur set Totaalbedrag = Totaalbedrag - @prijs where Factuurnummer = @factuur";
                        SqlDataAdapter adapter4 = new SqlDataAdapter();
                        adapter4.UpdateCommand = new SqlCommand(optellen, con);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", kortingdrank);
                        int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                        con.Close();
                        bijwerken();
                    }

                    if (cat == "2") //losse gerechten
                    {

                        con.Close();
                        allinmenu();
                        double allin = prijskids + prijsvolwassenen;
                        Drankjesberekenen();
                        double drankjes = drankentotaal;
                        bijwerken();
                        foodtotaal = labeltje14 - allin - drankjes;
                        con.Open();
                        SqlDataReader dr2 = cmdSchedule.ExecuteReader();
                        string resulaat2 = dr2.Read().ToString();
                        string kortingp = dr2["korting"].ToString();
                        dr2.Close();

                        double kortingfood = (double)foodtotaal * double.Parse(kortingp);
                        double test = (double)foodtotaal - kortingfood;

                        /////dit label is voor kortingbedrag//////labelnaam.text = kortingfood.tostring("0.00")

                        string optellen = "Update factuur set Totaalbedrag = Totaalbedrag - @prijs where Factuurnummer = @factuur";
                        SqlDataAdapter adapter4 = new SqlDataAdapter();
                        adapter4.UpdateCommand = new SqlCommand(optellen, con);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", kortingfood);
                        int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                        con.Close();
                        bijwerken();
                    }

                    if (cat == "3") //alles
                    {
                        con.Close();
                        bijwerken();
                        con.Open();
                        SqlDataReader dr3 = cmdSchedule.ExecuteReader();
                        string resulaat3 = dr3.Read().ToString();
                        string kortingp = dr3["korting"].ToString();
                        double vermenigvuldiger = 1.00 - double.Parse(kortingp);
                        dr3.Close();
                        double nieuwtot = labeltje14 * vermenigvuldiger;
                        double kortingbedrag = subtotaal - nieuwtot;

                        /////dit label is voor kortingbedrag//////labelnaam.text = kortingbedrag.tostring("0.00")

                        string optellen = "Update factuur set Totaalbedrag = @prijs where Factuurnummer = @factuur";
                        SqlDataAdapter adapter4 = new SqlDataAdapter();
                        adapter4.UpdateCommand = new SqlCommand(optellen, con);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                        adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", nieuwtot);
                        int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                        con.Close();
                        bijwerken();

                    }

                }
                dr.Close();
            }

            catch
            {
                //oke geen korting
            }
            finally
            {
                con.Close();
            }
        }

        private void bijwerken()
        {
            con.Open();
            string queriefactuur = "SELECT [Totaalbedrag] FROM [Factuur] WHERE [Factuurnummer] = @Factuurnummer";
            SqlCommand cmdfactuur = new SqlCommand(queriefactuur, con);
            cmdfactuur.Parameters.AddWithValue("@Factuurnummer", (int)Session["factuurnummer"]);
            SqlDataReader drfactuur = cmdfactuur.ExecuteReader();
            string resultaatfactuur = drfactuur.Read().ToString();
            string factuurtotaal = drfactuur["Totaalbedrag"].ToString();
            double probeer = double.Parse(factuurtotaal);
            double label12 = probeer / 1.09;
            double label13 = probeer / 109 * 9;
            string label14 = drfactuur["Totaalbedrag"].ToString();
            labeltje14 = double.Parse(label14);
            Label14.Text = labeltje14.ToString("0.00");
            lblAantalVolw.Text = label12.ToString("0.00");
            LblAantalKind.Text = label13.ToString("0.00");

            drfactuur.Close();
            con.Close();
        }

        private void Drankjesberekenen()
        {
            foreach (GridViewRow gvr in GridView4.Rows)
            {
                string drankkor = GridView4.DataKeys[gvr.RowIndex].Values["Prijs"].ToString();
                string drankaantal = GridView4.DataKeys[gvr.RowIndex].Values["hoeveelheid"].ToString();
                double regelprijs = double.Parse(drankkor) * double.Parse(drankaantal);
                drankentotaal += regelprijs;

            }
        }

        private void allinmenu()
        {
            string eerstekind = "select [Aantal kinderen] from in_restaurant where Reserveringsnummer = @reservering";
            string eerstevol = "select [Aantal Volwassenen] from in_restaurant where Reserveringsnummer = @reservering";

            con.Open();
            SqlCommand cmdvol = new SqlCommand(eerstevol, con);
            cmdvol.Parameters.AddWithValue("@reservering", Session["tafel"]);
            object volwassenen = cmdvol.ExecuteScalar();
            string aantalv = volwassenen.ToString();



            int volw = int.Parse(aantalv);

            SqlCommand cmdkind = new SqlCommand(eerstekind, con);
            cmdkind.Parameters.AddWithValue("@reservering", Session["tafel"]);
            object kinderen1 = cmdkind.ExecuteScalar();
            string kinderen = kinderen1.ToString();
            int kind = int.Parse(kinderen);
            con.Close();

            try
            {
                string allin = "select [Aantal arregementen] from in_restaurant where Reserveringsnummer = @reservering";
                con.Open();
                SqlCommand cmdalles = new SqlCommand(allin, con);
                cmdalles.Parameters.AddWithValue("@reservering", Session["tafel"]);
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

            LblAantalKind.Text = kinderenmetallin.ToString();
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
            prijsvolwassenen = double.Parse(prijsvol) * volmetallin;

            string zoekprijsvolkind = "select [prijs kinderen] from tijdvak where Nummer = @tijdvak";
            SqlCommand cmdprijsk = new SqlCommand(zoekprijsvolkind, con);
            cmdprijsk.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
            object prijsk = cmdprijsk.ExecuteScalar();
            con.Close();
            string prijskin = prijsk.ToString();
            prijskids = double.Parse(prijskin) * kinderenmetallin;

            lblTotKind.Text = prijskids.ToString();
            lblTotVolw.Text = prijsvolwassenen.ToString();
        }

        protected void txttafelnummer_TextChanged(object sender, EventArgs e)
        {

        }
    }
}