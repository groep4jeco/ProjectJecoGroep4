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

namespace ProjectBedrijfApp
{
    public partial class AddToCard : System.Web.UI.Page
    {
        int inclusief;
        int menuutjes;
        string prijs;
        int gerechtjes;
        int htotaal;

        int kind;
        int volw;
        int netto;

        string time;
        bool drinkenbestellen;
        string tijdvakdata;
        int tijdvaknummer;
        string tijden;
        double arregementprijzen;

        int factuurnummer;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("Gerechtnummer");
                dt.Columns.Add("Omschrijving");
                dt.Columns.Add("Hoeveelheid");
                dt.Columns.Add("Prijs");
                dt.Columns.Add("totalprice");
                dt.Columns.Add("afb_pad");


                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;Persist Security Info=True;User ID=BIM01A2019;Password=BIM01A2019";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Gerecht where Gerechtnummer=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["afb_pad"] = ds.Tables[0].Rows[0]["afb_pad"].ToString();
                        dr["Gerechtnummer"] = ds.Tables[0].Rows[0]["Gerechtnummer"].ToString();
                        dr["Omschrijving"] = ds.Tables[0].Rows[0]["Omschrijving"].ToString();
                        dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
                        dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
                        double totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Totaal:";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddToCard.aspx");
                        GridViewRow gvr = GridView1.SelectedRow;
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;Persist Security Info=True;User ID=BIM01A2019;Password=BIM01A2019";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Gerecht where Gerechtnummer=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["afb_pad"] = ds.Tables[0].Rows[0]["afb_pad"].ToString();
                        dr["Gerechtnummer"] = ds.Tables[0].Rows[0]["Gerechtnummer"].ToString();
                        dr["Omschrijving"] = ds.Tables[0].Rows[0]["Omschrijving"].ToString();
                        dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
                        dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
                        double totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Totaal:";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddToCard.aspx");

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[4].Text = "Totaal:";
                        GridView1.FooterRow.Cells[5].Text = totalehoeveelheid().ToString();

                        GridView1.FooterRow.Cells[6].Text = "Totaal:";
                        GridView1.FooterRow.Cells[7].Text = "€" + grandtotal().ToString();
                    }


                }
                Label3.Text = GridView1.Rows.Count.ToString();

            }


        }
        public double grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            double gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToDouble(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        public int totalehoeveelheid()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            htotaal = 0;
            while (i < nrow)
            {
                htotaal = htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString());

                i = i + 1;
            }
            return htotaal;

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;
            Response.Redirect("AddToCard.aspx");
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Bestellen.aspx");
        }

        protected void btnBevestig_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            int ronde = (int)Session["ronde"];


            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            try
            {
                string allin = "select [Aantal arregementen] from in_restaurant where Reserveringsnummer = @reservering";
                con.Open();
                SqlCommand cmdalles = new SqlCommand(allin, con);
                cmdalles.Parameters.AddWithValue("@reservering", Session["reservering"]);
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

            string eerstevol = "select [Aantal Volwassenen] from in_restaurant where Reserveringsnummer = @reservering";
            string eerstekind = "select [Aantal kinderen] from in_restaurant where Reserveringsnummer = @reservering";
            string nummertje = Session["reservering"].ToString();
            con.Open();
            SqlCommand cmdvol = new SqlCommand(eerstevol, con);
            cmdvol.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object volwassenen = cmdvol.ExecuteScalar();
            string aantalv = volwassenen.ToString();
            volw = int.Parse(aantalv);

            SqlCommand cmdkind = new SqlCommand(eerstekind, con);
            cmdkind.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object kinderen1 = cmdkind.ExecuteScalar();
            string kinderen = kinderen1.ToString();
            kind = int.Parse(kinderen);
            con.Close();
            netto = kind + volw - menuutjes;
            gerechtjes = menuutjes * 5;



            string tijd = DateTime.Now.ToString("HH:mm:ss tt");

           
                
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                    string prequerie = "select MAX(Bestelregel.Bestelregelcode) from Bestelregel";
                    con.Open();
                    SqlCommand cmdcode = new SqlCommand(prequerie, con);
                    object bestelregel = cmdcode.ExecuteScalar();
                    string code = bestelregel.ToString();
                    int bestelregelcode = int.Parse(code);

                    string hoeveelheid = GridView1.DataKeys[i]["Hoeveelheid"].ToString();
                int hoeveelheid2 = int.Parse(hoeveelheid);

                    string Gerechtnummer = GridView1.DataKeys[i]["Gerechtnummer"].ToString();
                if (gerechtjes <= 0)
                {
                    string prijsperproduct = GridView1.DataKeys[i]["Prijs"].ToString();
                    double totaal = double.Parse(prijsperproduct) * hoeveelheid2;
                    prijs = totaal.ToString();
                }

                if (gerechtjes >= 1)
                {
                    if (hoeveelheid2 > 1)
                    {
                        int mingerechten = hoeveelheid2;

                        if (gerechtjes < hoeveelheid2)
                        {
                            int over = mingerechten - gerechtjes;
                            string kosten = GridView1.DataKeys[i]["Prijs"].ToString();
                            double prijskaartje = double.Parse(kosten);
                            double berekening = prijskaartje * over;
                            prijs = berekening.ToString();
                            gerechtjes = 0;
                        }

                        if (gerechtjes >= hoeveelheid2)
                        {
                            gerechtjes = gerechtjes - hoeveelheid2;
                            prijs = "0";
                        }
                    }
                    if (hoeveelheid2 == 1)
                    {
                        prijs = "0";
                        gerechtjes = gerechtjes - 1;
                    }


                }


                    string querie = "SET IDENTITY_INSERT Bestelregel ON Insert into Bestelregel([Bestelregelcode], [Hoeveelheid] ,[Besteltijd] ,[Reserveringsnummer] ,[menugerechtnummer],[RondeNummer],[bestelstatusID]) values(@code, @hoeveelheid, @Tijd, @reservering, @gerecht, @ronde, 1); SET IDENTITY_INSERT Bestelregel OFF";
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    adapter.InsertCommand = new SqlCommand(querie, con);
                    adapter.InsertCommand.Parameters.AddWithValue("@code", bestelregelcode + 1);
                    adapter.InsertCommand.Parameters.AddWithValue("@hoeveelheid", hoeveelheid);
                    adapter.InsertCommand.Parameters.AddWithValue("@tijd", tijd);
                    adapter.InsertCommand.Parameters.AddWithValue("@reservering", Session["reservering"]);
                    adapter.InsertCommand.Parameters.AddWithValue("@gerecht", Gerechtnummer);
                    adapter.InsertCommand.Parameters.AddWithValue("@ronde", Session["ronde"]);
                    int probeer = adapter.InsertCommand.ExecuteNonQuery();
                    con.Close();

                    string controlebestaan = "select factuurnummer from factuur where reserveringsnummer = @reservering";
                    SqlCommand cmdfactuur = new SqlCommand(controlebestaan, con);
                    cmdfactuur.Parameters.AddWithValue("@reservering", Session["reservering"]);
                    SqlDataReader drklant;

                    con.Open();
                    drklant = cmdfactuur.ExecuteReader();

                    try
                    {

                        string factuur = drklant.Read().ToString();
                        string factuurtje = drklant["Factuurnummer"].ToString();
                        int factuurnummer = int.Parse(factuurtje);
                    Session["factuur"] = factuurnummer; 
                        drklant.Close();
                        string optellen = "Update factuur set Totaalbedrag += @prijs where Factuurnummer = @factuur";
                        SqlDataAdapter adapter3 = new SqlDataAdapter();
                        adapter3.UpdateCommand = new SqlCommand(optellen, con);
                        adapter3.UpdateCommand.Parameters.AddWithValue("@factuur", Session["factuur"]);
                        adapter3.UpdateCommand.Parameters.AddWithValue("@prijs", double.Parse(prijs.ToString()));
                        int doehet = adapter3.UpdateCommand.ExecuteNonQuery();
                        con.Close();
                    }


                    catch
                    {
                        drklant.Close();

                        string factuurmaken = "insert into Factuur (KlantenpasEmail, Factuurdatum, Totaalbedrag, Reserveringsnummer, KlantKlantID) values ((select Klant.Email from Reservering inner join klant on Klant.KlantID = Reservering.KlantKlantID where Reserveringsnummer = @reservering), (SELECT CONVERT (date, GETDATE())), @prijs, @reservering, (select Reservering.KlantKlantID from Reservering where Reservering.Reserveringsnummer = @reservering))";
                        SqlDataAdapter adapter2 = new SqlDataAdapter();
                        adapter2.InsertCommand = new SqlCommand(factuurmaken, con);
                        adapter2.InsertCommand.Parameters.AddWithValue("@reservering", Session["reservering"]);
                        adapter2.InsertCommand.Parameters.AddWithValue("@prijs", double.Parse(prijs));
                        adapter2.InsertCommand.Parameters.AddWithValue("@volw", volw);
                        adapter2.InsertCommand.Parameters.AddWithValue("@kind", kind);
                        int doehet2 = adapter2.InsertCommand.ExecuteNonQuery();

                    }

                    finally
                    {
                        con.Close();
                    }
                
                    
                }


        dt.Rows.Clear();

            if ((int)Session["ronde"] == 1)
            {
                string controlebestaan = "select factuurnummer from factuur where reserveringsnummer = @reservering";
                SqlCommand cmdfactuur = new SqlCommand(controlebestaan, con);
                cmdfactuur.Parameters.AddWithValue("@reservering", Session["reservering"]);
                SqlDataReader drklant;
                con.Open();
                drklant = cmdfactuur.ExecuteReader();
                    string factuur = drklant.Read().ToString();
                    string factuurtje = drklant["Factuurnummer"].ToString();
                    factuurnummer = int.Parse(factuurtje);
                    drklant.Close();
                con.Close();

                // dag bepalen en prijs per dag
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
                double prijsvolwassenen = double.Parse(prijsvol);

                string zoekprijsvolkind = "select [prijs kinderen] from tijdvak where Nummer = @tijdvak";
                SqlCommand cmdprijsk = new SqlCommand(zoekprijsvolkind, con);
                cmdprijsk.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
                object prijsk = cmdprijsk.ExecuteScalar();
                string prijskin = prijsk.ToString();
                double prijskids = double.Parse(prijskin);

                if (menuutjes > volw)
                {
                    int kinderenmetallin = menuutjes - volw;
                    arregementprijzen = prijsvolwassenen * volw + prijskids * kinderenmetallin;
                }

                if (menuutjes <= volw)
                {
                    int volwzonderallin = volw - menuutjes;
                    int volmetallin = volw - volwzonderallin;
                    arregementprijzen = prijsvolwassenen * volmetallin;
                }


                    string allintoevoegen = "Update factuur set Totaalbedrag += @prijs where Factuurnummer = @factuur";
                SqlDataAdapter adapter3 = new SqlDataAdapter();
                adapter3.UpdateCommand = new SqlCommand(allintoevoegen, con);
                adapter3.UpdateCommand.Parameters.AddWithValue("@factuur", Session["factuur"]);
                adapter3.UpdateCommand.Parameters.AddWithValue("@prijs", arregementprijzen);
                int doehet = adapter3.UpdateCommand.ExecuteNonQuery();
                con.Close();
            }
            int maxronde = int.Parse(Session["maxronde"].ToString());

            if (Session["extraatjes"] != null)
            {
                int extraprijs = int.Parse(Session["extraatjes"].ToString()) * 5;

                con.Open();
                string allintoevoegen = "Update factuur set Totaalbedrag += @prijs where Factuurnummer = @factuur";
                SqlDataAdapter adapter3 = new SqlDataAdapter();
                adapter3.UpdateCommand = new SqlCommand(allintoevoegen, con);
                adapter3.UpdateCommand.Parameters.AddWithValue("@factuur", Session["factuur"]);
                adapter3.UpdateCommand.Parameters.AddWithValue("@prijs", extraprijs);
                int doehet = adapter3.UpdateCommand.ExecuteNonQuery();
                con.Close();

            }





            if (ronde < maxronde)
            { 
                ronde++;
                Session["ronde"] = ronde;
                Response.Redirect("~/Timer.aspx");
            }
            else
            {
                Response.Redirect("~/Extra.aspx");
            }

        }
    }
}