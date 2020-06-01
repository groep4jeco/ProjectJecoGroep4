﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProjectBedrijfApp
{
    public partial class Dranken_overzicht : System.Web.UI.Page
    {
        public List<string> tafelID = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            tafelID = (List<string>)Session["TafelId"];
            if (!IsPostBack)
            {
                DataTable dt2 = new DataTable();
                DataRow dr;
                dt2.Columns.Add("sno");
                dt2.Columns.Add("artikelnummer");
                dt2.Columns.Add("Omschrijving");
                dt2.Columns.Add("Hoeveelheid");
                dt2.Columns.Add("Prijs");
                dt2.Columns.Add("totalprice");
                dt2.Columns.Add("afb_pad");



                if (Request.QueryString["id"] != null)
                {
                    if (Session["koopdrinken"] == null)
                    {
                        dr = dt2.NewRow();
                        String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;Persist Security Info=True;User ID=BIM01A2019;Password=BIM01A2019";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Dranken where artikelnummer=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["afb_pad"] = ds.Tables[0].Rows[0]["afb_pad"].ToString();
                        dr["artikelnummer"] = ds.Tables[0].Rows[0]["artikelnummer"].ToString();
                        dr["Omschrijving"] = ds.Tables[0].Rows[0]["Omschrijving"].ToString();
                        dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
                        dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
                        double totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt2.Rows.Add(dr);
                        GridView1.DataSource = dt2;
                        GridView1.DataBind();

                        Session["koopdrinken"] = dt2;


                        Response.Redirect("Bestellen_drinken.aspx");
                    }
                    else
                    {

                        dt2 = (DataTable)Session["koopdrinken"];
                        int sr;
                        sr = dt2.Rows.Count;

                        dr = dt2.NewRow();
                        String mycon = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;Persist Security Info=True;User ID=BIM01A2019;Password=BIM01A2019";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Dranken where artikelnummer=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["afb_pad"] = ds.Tables[0].Rows[0]["afb_pad"].ToString();
                        dr["artikelnummer"] = ds.Tables[0].Rows[0]["artikelnummer"].ToString();
                        dr["Omschrijving"] = ds.Tables[0].Rows[0]["Omschrijving"].ToString();
                        dr["Hoeveelheid"] = Request.QueryString["Hoeveelheid"];
                        dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();
                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());
                        double totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt2.Rows.Add(dr);
                        GridView1.DataSource = dt2;
                        GridView1.DataBind();

                        Session["koopdrinken"] = dt2;


                        Response.Redirect("Bestellen_drinken.aspx");
                    }
                }
                else
                {
                    dt2 = (DataTable)Session["koopdrinken"];
                    GridView1.DataSource = dt2;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[4].Text = "Totaal:";
                        GridView1.FooterRow.Cells[5].Text = totalehoeveelheid().ToString();

                        GridView1.FooterRow.Cells[6].Text = "€" + grandtotal().ToString();

                    }

                }
                Label3.Text = GridView1.Rows.Count.ToString();
            }

        }
        public double grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["koopdrinken"];
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
            dt = (DataTable)Session["koopdrinken"];
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
            dt = (DataTable)Session["koopdrinken"];


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

            Session["koopdrinken"] = dt;
            Response.Redirect("Dranken_overzicht.aspx");
        }

        protected void btnTerug_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Bestellen_drinken.aspx");
        }

        protected void btnBevestig_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

            CultureInfo dutch = new CultureInfo("nl-NL");
            DateTime dagvandaag = DateTime.Now;
            string dagen = dutch.DateTimeFormat.GetDayName(dagvandaag.DayOfWeek).ToString();

            TimeSpan startdeel1 = new TimeSpan(16, 50, 0);
            TimeSpan enddeel1 = new TimeSpan(19, 15, 0);
            //TimeSpan now = DateTime.Now.TimeOfDay;
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
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();
            string prequerie = "select Tijdvak.Nummer from Tijdvak where Begintijd = @tijd AND Dag = @dag";
            SqlCommand cmdtijdvak = new SqlCommand(prequerie, con);
            cmdtijdvak.Parameters.AddWithValue("@dag", dagen);
            cmdtijdvak.Parameters.AddWithValue("@tijd", time);
            object tijd = cmdtijdvak.ExecuteScalar();
            tijden = tijd.ToString();
            tijdvaknummer = int.Parse(tijden);
            Session["tijdvaknummer"] = tijdvaknummer;
            con.Close();

            string tafels = "select Reserveringsnummer from Tafelbezetting where TijdvakNummer = @tijdvak and TafelTafelnummer = @tafel";
            SqlCommand cmdtafel = new SqlCommand(tafels, con);
            cmdtafel.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
            cmdtafel.Parameters.AddWithValue("@tafel", tafelID);
            object tafeltje = cmdtafel.ExecuteScalar();
            tafels = tafeltje.ToString();
            int reserveringnummers = int.Parse(tafels);
            Session["reserveringsnummer"] = reserveringnummers;



            DataTable dt = new DataTable();
            dt = (DataTable)Session["koopdrinken"];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string prequerie = "select MAX(Bestelregel.Bestelregelcode) from Bestelregel";
                con.Open();
                SqlCommand cmdcode = new SqlCommand(prequerie, con);
                object bestelregel = cmdcode.ExecuteScalar();
                string code = bestelregel.ToString();
                int bestelregelcode = int.Parse(code);

                string hoeveelheid = GridView1.DataKeys[i]["Hoeveelheid"].ToString();
                string artikelnummer = GridView1.DataKeys[i]["artikelnummer"].ToString();
                string prijs = GridView1.DataKeys[i]["Prijs"].ToString();

                string querie = "SET IDENTITY_INSERT Bestelregel ON Insert into Bestelregel([Bestelregelcode], [Hoeveelheid] ,[Besteltijd] ,[Reserveringsnummer] ,[Drankenartikelnummer],[bestelstatusID]) values(@code, @hoeveelheid, @Tijd, @reservering, @drank, 1); SET IDENTITY_INSERT Bestelregel OFF";
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.InsertCommand = new SqlCommand(querie, con);
                adapter.InsertCommand.Parameters.AddWithValue("@code", bestelregelcode + 1);
                adapter.InsertCommand.Parameters.AddWithValue("@hoeveelheid", hoeveelheid);
                adapter.InsertCommand.Parameters.AddWithValue("@tijd", tijd);
                adapter.InsertCommand.Parameters.AddWithValue("@reservering", Session["reserveringsnummer"]);
                adapter.InsertCommand.Parameters.AddWithValue("@drank", artikelnummer);
                int probeer = adapter.InsertCommand.ExecuteNonQuery();
                con.Close();
            }

            dt.Rows.Clear();

            Response.Redirect("~/Bestellen_drinken.aspx");

        }
    }
}