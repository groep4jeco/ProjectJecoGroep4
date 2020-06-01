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
    public partial class Bestellen_drinken : System.Web.UI.Page
    {
        int maxbestelbaar;
        int htotaal;
        int nrow;
        int i;
        int toevoegen;


        protected void Page_Load(object sender, EventArgs e)
        {
            lblDatum.Text = DateTime.Now.ToString("D");


            DataTable dt = new DataTable();
            dt = (DataTable)Session["koopdrinken"];

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
                        GridView2.DataSource = dt2;
                        GridView2.DataBind();

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
                        GridView2.DataSource = dt2;
                        GridView2.DataBind();

                        Session["koopdrinken"] = dt2;


                        Response.Redirect("Bestellen_drinken.aspx");
                    }
                }
                else
                {
                    dt2 = (DataTable)Session["koopdrinken"];
                    GridView2.DataSource = dt2;
                    GridView2.DataBind();
                    if (GridView2.Rows.Count > 0)
                    {
                        GridView2.FooterRow.Cells[2].Text = "Totaal:";
                        GridView2.FooterRow.Cells[3].Text = totalehoeveelheid().ToString() + " / " + maxbestelbaar.ToString();

                    }

                }

            }

        }

        public int totalehoeveelheid()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["koopdrinken"];
            nrow = dt.Rows.Count;
            i = 0;
            htotaal = 0;

            toevoegen = htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString());

            while (i < nrow)
            {
                if (htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString()) <= maxbestelbaar)
                {
                    htotaal = htotaal + Convert.ToInt32(dt.Rows[i]["Hoeveelheid"].ToString());
                }


                i = i + 1;

            }
            return htotaal;



        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocard")
            {


                DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("Bestellen_drinken.aspx?id=" + e.CommandArgument.ToString() + "&Hoeveelheid=" + dlist.SelectedItem.ToString());
            }
        }

        protected void btnOverzicht_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCard.aspx");
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt2 = new DataTable();
            dt2 = (DataTable)Session["koopdrinken"];


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

            Session["koopdrinken"] = dt2;
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
    }
}