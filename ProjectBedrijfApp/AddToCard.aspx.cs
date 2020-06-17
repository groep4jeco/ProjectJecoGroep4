using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProjectBedrijfApp
{
    public partial class AddToCard : System.Web.UI.Page
    {
        int inclusief;
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
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
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
            int htotaal = 0;
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
            /*
            string eerstekeer = "select [All you can eat] from in_restaurant where Reserveringsnummer = @reservering";
            string eerstevol = "select [Aantal Volwassenen] from in_restaurant where Reserveringsnummer = @reservering";
            string eerstekind = "select [Aantal kinderen] from in_restaurant where Reserveringsnummer = @reservering";
            con.Open();
            SqlCommand cmdeerste = new SqlCommand(eerstekeer, con);
            cmdeerste.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object eerstekeerregel = cmdeerste.ExecuteScalar();
            string allin = eerstekeerregel.ToString();

            if (allin == "False")
            {
                inclusief = 0;
            }
            if (allin == "True")
            {
                inclusief = 1;
            }
            

            SqlCommand cmdvol = new SqlCommand(eerstevol, con);
            cmdvol.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object volwassenen = cmdvol.ExecuteScalar();
            string aantalv = volwassenen.ToString();
            int volw = int.Parse(aantalv);

            SqlCommand cmdkind = new SqlCommand(eerstekind, con);
            cmdkind.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object kinderen1 = cmdvol.ExecuteScalar();
            string kinderen = kinderen1.ToString();
            int kind = int.Parse(kinderen);
            con.Close();
            */
            /*
            if (inclusief == 1 && ronde == 1)
            {
                con.Open();
                string invoeren = "insert into Factuur (KlantenpasEmail, Factuurdatum, Totaalbedrag, Reserveringsnummer, KlantKlantID) values ((select Klant.Email from Reservering inner join klant on Klant.KlantID = Reservering.KlantKlantID where Reserveringsnummer = @reservering), (SELECT CONVERT (date, GETDATE())), (select CAST(SUM([Prijs volwassenen] * @volw + [Prijs kinderen] * @kind)AS decimal (10,2)) from in_restaurant inner join Tijdvak on in_restaurant.TijdvakNummer = Tijdvak.Nummer where Reserveringsnummer = @reservering), @reservering, (select Reservering.KlantKlantID from Reservering where Reservering.Reserveringsnummer = @reservering))";
                SqlDataAdapter adapter2 = new SqlDataAdapter();
                adapter2.InsertCommand = new SqlCommand(invoeren, con);
                adapter2.InsertCommand.Parameters.AddWithValue("@reservering", Session["reservering"]);
                adapter2.InsertCommand.Parameters.AddWithValue("@volw", volw);
                adapter2.InsertCommand.Parameters.AddWithValue("@kind", kind);
                int doehet = adapter2.InsertCommand.ExecuteNonQuery();
                con.Close();
            }
            */

            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];


            con.Close();
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
                string Gerechtnummer = GridView1.DataKeys[i]["Gerechtnummer"].ToString();
                string prijs = GridView1.DataKeys[i]["Prijs"].ToString();

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
                    drklant.Close();
                    string optellen = "Update factuur set Totaalbedrag += @prijs where Factuurnummer = @factuur";
                    SqlDataAdapter adapter3 = new SqlDataAdapter();
                    adapter3.UpdateCommand = new SqlCommand(optellen, con);
                    adapter3.UpdateCommand.Parameters.AddWithValue("@factuur", factuurnummer);
                    adapter3.UpdateCommand.Parameters.AddWithValue("@prijs", prijs);
                    int doehet = adapter3.UpdateCommand.ExecuteNonQuery();
                    con.Close();
                }


                catch
                {
                    drklant.Close();
                    string eerstevol = "select [Aantal Volwassenen] from in_restaurant where Reserveringsnummer = @reservering";
                    string eerstekind = "select [Aantal kinderen] from in_restaurant where Reserveringsnummer = @reservering";


                    SqlCommand cmdvol = new SqlCommand(eerstevol, con);
                    cmdvol.Parameters.AddWithValue("@reservering", Session["reservering"]);
                    object volwassenen = cmdvol.ExecuteScalar();
                    string aantalv = volwassenen.ToString();
                    int volw = int.Parse(aantalv);

                    SqlCommand cmdkind = new SqlCommand(eerstekind, con);
                    cmdkind.Parameters.AddWithValue("@reservering", Session["reservering"]);
                    object kinderen1 = cmdvol.ExecuteScalar();
                    string kinderen = kinderen1.ToString();
                    int kind = int.Parse(kinderen);

                    string factuurmaken = "insert into Factuur (KlantenpasEmail, Factuurdatum, Totaalbedrag, Reserveringsnummer, KlantKlantID) values ((select Klant.Email from Reservering inner join klant on Klant.KlantID = Reservering.KlantKlantID where Reserveringsnummer = @reservering), (SELECT CONVERT (date, GETDATE())), @prijs, @reservering, (select Reservering.KlantKlantID from Reservering where Reservering.Reserveringsnummer = @reservering))";
                    SqlDataAdapter adapter2 = new SqlDataAdapter();
                    adapter2.InsertCommand = new SqlCommand(factuurmaken, con);
                    adapter2.InsertCommand.Parameters.AddWithValue("@reservering", Session["reservering"]);
                    adapter2.InsertCommand.Parameters.AddWithValue("@prijs", prijs);
                    adapter2.InsertCommand.Parameters.AddWithValue("@volw", volw);
                    adapter2.InsertCommand.Parameters.AddWithValue("@kind", kind);
                    int doehet2 = adapter2.InsertCommand.ExecuteNonQuery();

                }

                finally
                {
                    con.Close();
                    //drklant.Close();
                }
            }
            
            dt.Rows.Clear();

            
            int maxronde = int.Parse(Session["maxronde"].ToString());

              

               

            if (ronde < maxronde)
            {
                ronde++;
                Session["ronde"] = ronde;
                Response.Redirect("~/Timer.aspx");
            }
            else
            {
                Response.Redirect("~/regristratiepagina.aspx");
            }

        }
    }
}