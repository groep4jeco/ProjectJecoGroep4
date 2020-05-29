using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Bestellen
{
    public partial class AddToCard : System.Web.UI.Page
    {
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
            int ronde = (int)Session["ronde"];
            ronde++;
            Session["ronde"] = ronde;


            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            dt.Rows.Clear();
            Response.Redirect("~/Bestellen.aspx");
        }
    }    
}