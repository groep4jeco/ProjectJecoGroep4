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
    public partial class Bestellen : System.Web.UI.Page
    {
        int maxbestelbaar;
        int htotaal;
        int nrow;
        int i;
        int toevoegen;
        int ronde;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (btnStop.Enabled == true)
            {
                lblAfbreken.Visible = false;
                btnJA.Visible = false;
                btnNee.Visible = false;
            }
            else
            {
                lblAfbreken.Visible = true;
                btnJA.Visible = true;
                btnNee.Visible = true;
            }
            

            lblDatum.Text = DateTime.Now.ToString("D");


            string queriepersonen = ("select SUM([Aantal Volwassenen] + [Aantal kinderen]) from in_restaurant where Reserveringsnummer = @reservering");
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

            try
            {
                con.Open();
                SqlCommand cmdklant = new SqlCommand(queriepersonen, con);
                cmdklant.Parameters.AddWithValue("@reservering", Session["reservering"]);
                object drpersonen = cmdklant.ExecuteScalar();
                string aantalpersonen = drpersonen.ToString();

                lblAantalpersonen.Text = aantalpersonen;
            }
            catch
            {
                lblWaarschuwing.Text = "Kan aantal personen niet ophalen";
            }
            finally
            {
                con.Close();
            }

            //maxbestelbaar = int.Parse(aantalpersonen) * 5;

            string queriearregementen = ("select [Aantal arregementen] from in_restaurant where Reserveringsnummer = @reservering");
            SqlConnection con2 = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

            try
            {
                con2.Open();
                SqlCommand cmdarregementen = new SqlCommand(queriearregementen, con2);
                cmdarregementen.Parameters.AddWithValue("@reservering", Session["reservering"]);
                object drarregementen = cmdarregementen.ExecuteScalar();
                string aantalarregementen = drarregementen.ToString();

                maxbestelbaar = int.Parse(aantalarregementen) * 5;
            }
            catch
            {
                lblWaarschuwing.Text = "Aantal arregementen zijn niet vastgesteld!";
            }
            finally
            {
                con2.Close();
            }

            if (Session["ronde"] != null)
            {
                lblRonde.Text = Session["ronde"].ToString();
                Session["ronde"] = lblRonde.Text;
                ronde = int.Parse(lblRonde.Text);
                Session["ronde"] = ronde;
            }

           /*
            con.Open();
            string maxrondes = ("select [Aantal rondes] from in_restaurant where Reserveringsnummer = @reservering");
            SqlCommand rondesaanvraag = new SqlCommand(maxrondes, con);
            rondesaanvraag.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object test = rondesaanvraag.ExecuteScalar();
            string aantalrondes = test.ToString();
            con.Close();
            */

            lblMaxRondes.Text = Session["maxronde"].ToString();

            if (int.Parse(lblRonde.Text) > (int)Session["ronde"])
            {
                Response.Redirect("regristratiepagina.aspx");
            }


            DataTable dt = new DataTable();
            if (Session["buyitems"] != null)
            {
                dt = (DataTable)Session["buyitems"];
            }

            if (dt != null)
            {

                Label3.Text = dt.Rows.Count.ToString();

            }
            else
            {
                Label3.Text = "0";

            }

            //Voor de gridview
            if (!IsPostBack)
            {
                DataTable dt2 = new DataTable();
                DataRow dr;
                dt2.Columns.Add("sno");
                dt2.Columns.Add("Gerechtnummer");
                dt2.Columns.Add("Omschrijving");
                dt2.Columns.Add("Hoeveelheid");
                dt2.Columns.Add("Prijs");
                dt2.Columns.Add("totalprice");
                dt2.Columns.Add("afb_pad");



                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt2.NewRow();
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
                       // dr["Prijs"] = ds.Tables[0].Rows[0]["Prijs"].ToString();

                        double prices = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        string price = prices.ToString("0.00");
                        dr["Prijs"] = price;
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());

                        double totalprices = double.Parse(price) * quantity;
                        string totalprice = totalprices.ToString("0.00");
                        dr["totalprice"] = totalprice;

                        dt2.Rows.Add(dr);
                        GridView2.DataSource = dt2;
                        GridView2.DataBind();

                        Session["buyitems"] = dt2;


                        Response.Redirect("Bestellen.aspx");
                    }
                    else
                    {

                        dt2 = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt2.Rows.Count;

                        dr = dt2.NewRow();
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
                        double prices = Convert.ToDouble(ds.Tables[0].Rows[0]["Prijs"].ToString());
                        string price = prices.ToString("0.00");
                        dr["Prijs"] = price;
                        double quantity = Convert.ToInt16(Request.QueryString["Hoeveelheid"].ToString());

                        double totalprices = double.Parse(price) * quantity;
                        string totalprice = totalprices.ToString("0.00");
                        dr["totalprice"] = totalprice;

                        dt2.Rows.Add(dr);
                        GridView2.DataSource = dt2;
                        GridView2.DataBind();

                        Session["buyitems"] = dt2;


                        Response.Redirect("Bestellen.aspx");
                    }
                }
                else
                {
                    dt2 = (DataTable)Session["buyitems"];
                    GridView2.DataSource = dt2;
                    GridView2.DataBind();
                    if (GridView2.Rows.Count > 0)
                    {
                        GridView2.FooterRow.Cells[2].Text = "Totaal:";
                        GridView2.FooterRow.Cells[3].Text = totalehoeveelheid().ToString() + " / " + maxbestelbaar.ToString();

                    }

                }

            }
            
            if (ronde == int.Parse(lblMaxRondes.Text))
            {
                lblWaarschuwing2.Text = "(LAATSTE RONDE!)";
            }
            
        }

        public int totalehoeveelheid()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            nrow = dt.Rows.Count;
            i = 0;
            htotaal = 0;

            toevoegen = htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString());

            while (i < nrow)
            {

                htotaal = htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString());



                i = i + 1;

                if (htotaal > maxbestelbaar)
                {
                    lblWaarschuwing.Text = "Je hebt het maximaal aantal gratis gerechten bereikt!";
                }

                /*if (htotaal >= maxbestelbaar)
                {
                    DataList1.Enabled = false;
                }

                if (htotaal > maxbestelbaar)
                {
                    btnOverzicht.Enabled = false;
                }*/

            }
            return htotaal;



        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocard")
            {


                DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("Bestellen.aspx?id=" + e.CommandArgument.ToString() + "&Hoeveelheid=" + dlist.SelectedItem.ToString());
            }
        }

        protected void btnOverzicht_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCard.aspx");
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt2 = new DataTable();
            dt2 = (DataTable)Session["buyitems"];


            for (int i = 0; i <= dt2.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt2.Rows[i]["sno"].ToString());
                TableCell cell = GridView2.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt2.Rows[i].Delete();
                    dt2.AcceptChanges();
                    break;
                }
            }

            for (int i = 1; i <= dt2.Rows.Count; i++)
            {
                dt2.Rows[i - 1]["sno"] = i;
                dt2.AcceptChanges();
            }

            Session["buyitems"] = dt2;
            Response.Redirect(Request.RawUrl);
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            /*
            int minuten = int.Parse(lblTimer.Text);

            if (minuten > 0)
            {
                lblTimer.Text = (minuten - 1).ToString();
            }

            else
            {
                Timer1.Enabled = false;
            }*/
        }



        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            /*
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];
            int aantal = Convert.ToInt32(row.Cells[3].Text);

            if (e.CommandName == "btnPlus")
            {
                row.Cells[3].Text = (aantal + 1).ToString();
            }

            if (e.CommandName == "btnMinus")
            {
                if (int.Parse(row.Cells[3].Text) > 1)
                {
                    row.Cells[3].Text = (aantal - 1).ToString();
                }

            }

            Session["aantal"] = Convert.ToInt32(row.Cells[3].Text);
            */
        }

        protected void btnStop_Click(object sender, EventArgs e)
        {
            btnStop.Enabled = false;

            lblAfbreken.Visible = true;
            btnJA.Visible = true;
            btnNee.Visible = true;
        }

        protected void btnJA_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["buyitems"];

                dt.Rows.Clear();
            }

            catch
            {

            }
            finally
            {
                Response.Redirect("login.aspx");
            }
            
        }

        protected void btnNee_Click(object sender, EventArgs e)
        {
            lblAfbreken.Visible = false;
            btnJA.Visible = false;
            btnNee.Visible = false;

            btnStop.Enabled = true;
        }
    }
}