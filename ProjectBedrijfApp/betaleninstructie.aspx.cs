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
using System.Runtime.InteropServices;

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
        SqlDataReader dradres;
        int kind;
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
        int tellertje;
        double kortingbedrag;
        double nieuwtot;
        SqlDataReader drklant;
        object prijsk;
        string aantalv;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Button2.Enabled = false;
                Button1.Enabled = false;
                btnkorting.Enabled = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;

                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;

                Label12.Visible = false;
                Label13.Visible = false;
                Label14.Visible = false;
                lblAantalVolw.Visible = false;
                lblTotKind.Visible = false;
                LblAantalKind.Visible = false;
                lblTotVolw.Visible = false;
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                Response.Redirect("betalen.aspx");
            }
        }

        protected void txtinvoeremail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void btnzoekfactuur_Click(object sender, EventArgs e)
        {
            tellertje = 0;
            Session["tellertje"] = tellertje;

            if (Page.IsValid == true)
            {



                con.Open();
                string querie = "SELECT[Naam], [Adres], [Plaats] FROM[Restaurant] WHERE [Restaurant ID] = @ID";
                SqlCommand cmd = new SqlCommand(querie, con);

                if (querie == null)

                {

                    Label3.Visible = true;
                    Label4.Visible = true;
                    Label5.Visible = true;

                    Label6.Visible = true;
                    Label7.Visible = true;
                    Label8.Visible = true;
                    Label9.Visible = true;
                    Label10.Visible = true;
                    Label11.Visible = true;



                }

                else

                {

                    cmd.Parameters.AddWithValue("@ID", 1);
                    SqlDataReader dr = cmd.ExecuteReader();
                    string resultaat2 = dr.Read().ToString();
                    Label3.Text = dr["Naam"].ToString();
                    Label4.Text = dr["Adres"].ToString();
                    Label5.Text = dr["Plaats"].ToString();
                    dr.Close();
                }

                Button2.Enabled = true;
            }
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

            try
            {
                string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
                SqlCommand cmdklant = new SqlCommand(querieklant, con);
                cmdklant.Parameters.AddWithValue("@IDKLANT", resultaatklant);
                drklant = cmdklant.ExecuteReader();
                string resultaatklant2 = drklant.Read().ToString();
                Label6.Text = drklant["Voornaam"].ToString() + ' ' + drklant["Achternaam"].ToString();
                Label7.Text = drklant["Email"].ToString();
                Label8.Text = drklant["Telefoonnummer"].ToString();
            }
            catch
            {
                Label6.Text = "sorry mislukt";
                Label7.Text = "sorry mislukt";
                Label8.Text = "sorry mislukt";

            }
            finally
            {
                drklant.Close();
                con.Close();
            }

            con.Open();
            try
            {
                string querieadres = "SELECT Online_bestellen.AdresHuisnummer, Online_bestellen.AdresPostcode, adres.Straatnaam, adres.Plaats FROM [Klant] INNER JOIN Adres on adres.KlantKlantID = klant.KlantID inner join Online_bestellen on Adres.Postcode = Online_bestellen.AdresPostcode  WHERE [KlantKlantID] = @IDKLANT";
                SqlCommand cmdadres = new SqlCommand(querieadres, con);
                cmdadres.Parameters.AddWithValue("@IDKLANT", resultaatklant);
                dradres = cmdadres.ExecuteReader();
            }
            catch
            {
                //mislukt
            }
            finally
            {
                con.Close();
            }
            
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



            lblSubtotaal.Text = subtotaal.ToString("0.00");
            allinmenu();



            Button1.Enabled = true;
            btnkorting.Enabled = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
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
                            lblKorting.Text = kortingdrank.ToString("0.00");
                            try
                            {
                                string optellen = "Update factuur set Totaalbedrag = Totaalbedrag - @prijs where Factuurnummer = @factuur";
                                SqlDataAdapter adapter4 = new SqlDataAdapter();
                                adapter4.UpdateCommand = new SqlCommand(optellen, con);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", kortingdrank);
                                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                            }
                            catch
                            {
                                //geen update
                            }
                            finally
                            {
                                con.Close();
                            }


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

                            lblKorting.Text = kortingfood.ToString("0.00");
                            try
                            {
                                string optellen = "Update factuur set Totaalbedrag = Totaalbedrag - @prijs where Factuurnummer = @factuur";
                                SqlDataAdapter adapter4 = new SqlDataAdapter();
                                adapter4.UpdateCommand = new SqlCommand(optellen, con);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", kortingfood);
                                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                            }
                            catch
                            {
                                //geen update
                            }
                            finally
                            {
                                con.Close();
                            }
                           
                            bijwerken();
                        }

                        if (cat == "3") //alles
                        {
                            con.Close();
                            bijwerken();
                            subtotaal = labeltje14;
                            con.Open();
                            try
                            {
                                SqlDataReader dr3 = cmdSchedule.ExecuteReader();
                                string resulaat3 = dr3.Read().ToString();
                                string kortingp = dr3["korting"].ToString();
                                double vermenigvuldiger = 1.00 - double.Parse(kortingp);
                                dr3.Close();
                                nieuwtot = labeltje14 * vermenigvuldiger;
                                kortingbedrag = subtotaal - nieuwtot;
                            }
                            catch
                            {
                                kortingbedrag = 0.00;
                            }
                            finally
                            {
                                con.Close();
                            }
                            lblKorting.Text = kortingbedrag.ToString("0.00");

                            con.Open();
                            try
                            {
                                string optellen = "Update factuur set Totaalbedrag = @prijs where Factuurnummer = @factuur";
                                SqlDataAdapter adapter4 = new SqlDataAdapter();
                                adapter4.UpdateCommand = new SqlCommand(optellen, con);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                                adapter4.UpdateCommand.Parameters.AddWithValue("@prijs", nieuwtot);
                                int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                            }
                            catch
                            {
                                //invoer mislukt
                            }
                            finally
                            {
                                con.Close();
                            }
                            
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
        }

        private void bijwerken()
        {
            con.Open();
            string queriefactuur = "SELECT [Totaalbedrag] FROM [Factuur] WHERE [Factuurnummer] = @Factuurnummer";
            SqlCommand cmdfactuur = new SqlCommand(queriefactuur, con);
            cmdfactuur.Parameters.AddWithValue("@Factuurnummer", (int)Session["factuurnummer"]);


            if (queriefactuur == null)

            {
                Label12.Visible = true;
                Label13.Visible = true;
                Label14.Visible = true;
                lblAantalVolw.Visible = true;
                lblTotKind.Visible = true;
                lblTotVolw.Visible = true;
                LblAantalKind.Visible = true;

            }

            else
            {

                Label12.Visible = true;
                Label13.Visible = true;
                Label14.Visible = true;
                lblAantalVolw.Visible = true;
                lblTotKind.Visible = true;
                lblTotVolw.Visible = true;
                LblAantalKind.Visible = true;

                SqlDataReader drfactuur = cmdfactuur.ExecuteReader();
                string resultaatfactuur = drfactuur.Read().ToString();
                string factuurtotaal = drfactuur["Totaalbedrag"].ToString();
                double probeer = double.Parse(factuurtotaal);
                double label12 = probeer / 1.09;
                double label13 = probeer / 109 * 9;
                string label14 = drfactuur["Totaalbedrag"].ToString();
                labeltje14 = double.Parse(label14);
                Label14.Text = labeltje14.ToString("0.00");
                Label12.Text = label12.ToString("0.00");
                Label13.Text = label13.ToString("0.00");
                drfactuur.Close();
            }

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
            try
            {
                SqlCommand cmdvol = new SqlCommand(eerstevol, con);
                cmdvol.Parameters.AddWithValue("@reservering", Session["tafel"]);
                object volwassenen = cmdvol.ExecuteScalar();
                aantalv = volwassenen.ToString();
            }
            catch
            {
                aantalv = "0";
            }
            finally
            {
                con.Close();
            }




            int volw = int.Parse(aantalv);
            con.Open();
            try
            {
                SqlCommand cmdkind = new SqlCommand(eerstekind, con);
                cmdkind.Parameters.AddWithValue("@reservering", Session["tafel"]);
                object kinderen1 = cmdkind.ExecuteScalar();
                string kinderen = kinderen1.ToString();
                kind = int.Parse(kinderen);
            }
            catch
            {
                kind = 0;
            }
            finally
            {
                con.Close();
            }
            

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

            // int kinderenmetallin = menuutjes - volw;
            //int volwzonderallin = volw - menuutjes;
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
            try
            {
                string prequerie = "select Tijdvak.Nummer from Tijdvak where Begintijd = @tijd AND Dag = @dag";
                SqlCommand cmdtijdvak = new SqlCommand(prequerie, con);
                cmdtijdvak.Parameters.AddWithValue("@dag", dagen);
                cmdtijdvak.Parameters.AddWithValue("@tijd", time);
                object tijd2 = cmdtijdvak.ExecuteScalar();
                tijden = tijd2.ToString();
                tijdvaknummer = int.Parse(tijden);
                Session["tijdvaknummer"] = tijdvaknummer;
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            
            con.Open();
            try
            {
                string zoekprijsvolw = "select [prijs volwassenen] from tijdvak where Nummer = @tijdvak";
                SqlCommand cmdprijsv = new SqlCommand(zoekprijsvolw, con);
                cmdprijsv.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
                object prijsv = cmdprijsv.ExecuteScalar();
                string prijsvol = prijsv.ToString();
                prijsvolwassenen = double.Parse(prijsvol) * volmetallin;
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            con.Open();
            try
            {
                string zoekprijsvolkind = "select [prijs kinderen] from tijdvak where Nummer = @tijdvak";
                SqlCommand cmdprijsk = new SqlCommand(zoekprijsvolkind, con);
                cmdprijsk.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
                prijsk = cmdprijsk.ExecuteScalar();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }

            
            string prijskin = prijsk.ToString();
            prijskids = double.Parse(prijskin) * kinderenmetallin;

            lblTotKind.Text = prijskids.ToString();
            lblTotVolw.Text = prijsvolwassenen.ToString();

            lblTotKind.Visible = true;
            lblTotVolw.Visible = true;
        }

        protected void txttafelnummer_TextChanged(object sender, EventArgs e)
        {

        }

        private void extrarondes(object sender, EventArgs e)

        {
            string vraagoprondes = "select [Extra rondes] from in_restaurant where Reserveringsnummer = @reservering";
            con.Open();
            try
            {
                SqlCommand cmdrondes = new SqlCommand(vraagoprondes, con);
                cmdrondes.Parameters.AddWithValue("@reservering", Session["reservering"]);
                object objrondes = cmdrondes.ExecuteScalar();
                string extraro = objrondes.ToString();
                int extrarondes = int.Parse(extraro);
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            

            lblextrarondes.Text = vraagoprondes.ToString();




        }

        protected void Terug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/overview,aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                int tafelnummer = int.Parse(txttafelnummer.Text);
                con.Open();
                string reserveringophalen = "select Reserveringsnummer from tafelbezetting where TafelTafelnummer = @tafel";
                SqlCommand cmdtafel = new SqlCommand(reserveringophalen, con);
                cmdtafel.Parameters.AddWithValue("@tafel", tafelnummer);
                object objreservering = cmdtafel.ExecuteScalar();
                string stringreservering = objreservering.ToString();
                reserveringsnummer = int.Parse(stringreservering);
                Session["tafel"] = reserveringsnummer;
                if(Session["tafel"] != null && (int)Session["tafel"] != 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }

            catch
            {
                args.IsValid = false;
            }
            finally
            {
                con.Close();
            }
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            btnkorting.Enabled = true;
        }

        protected void maximaalkortingscodes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int juistonjuist = 0;
            //controleer of code is juist
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
                    juistonjuist = 1;
                }
                else
                {
                    juistonjuist = 0;
                }
            }
            catch
            {
                juistonjuist = 0;
            }
            finally 
            {
                con.Close();
            }

            try
            {
                if (juistonjuist == 0)
                {
                    args.IsValid = true;
                }
                if (juistonjuist == 1)
                {
                    if ((int)Session["tellertje"] > 0)
                    {
                        args.IsValid = false;
                    }

                    if ((int)Session["tellertje"] == 0)
                    {
                        args.IsValid = true;
                        Session["tellertje"] = (int)Session["tellertje"] + 1;
                    }
                    
                }
            }

            finally
            {

            }
        }
    }
}