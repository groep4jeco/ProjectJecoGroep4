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
    public partial class Bestellen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
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
                


                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
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
                        dr["Gerechtnummer"] = ds.Tables[0].Rows[0]["Gerechtnummer"].ToString();
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

                        Session["buyitems"] = dt2;
                        


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
                        dr["Gerechtnummer"] = ds.Tables[0].Rows[0]["Gerechtnummer"].ToString();
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

                        Session["buyitems"] = dt2;
                        



                    }
                }
                else
                {
                    dt2 = (DataTable)Session["buyitems"];
                    GridView2.DataSource = dt2;
                    GridView2.DataBind();

                }

            }

            lblDatum.Text = DateTime.Now.ToString("D");


            string queriepersonen = ("select SUM([Aantal Volwassenen] + [Aantal kinderen]) from in_restaurant where Reserveringsnummer = @reservering");
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            con.Open();
            SqlCommand cmdklant = new SqlCommand(queriepersonen, con);
            cmdklant.Parameters.AddWithValue("@reservering", Session["reservering"]);
            object drpersonen = cmdklant.ExecuteScalar();
            string aantalpersonen = drpersonen.ToString();
            con.Close();
          
            lblAantalpersonen.Text = aantalpersonen;


            int Ronde = int.Parse(lblRonde.Text);
            Session["Ronde"] = Ronde;
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
            int minuten = int.Parse(lblTimer.Text);

            if (minuten > 0)
            {
                lblTimer.Text = (minuten - 1).ToString();
            }

            else
            {
                Timer1.Enabled = false;
            }
        }

 

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];
            int aantal = Convert.ToInt32(row.Cells[2].Text);

            if (e.CommandName == "btnPlus")
            {
                row.Cells[2].Text = (aantal + 1).ToString();
            }

            if (e.CommandName == "btnMinus")
            {
                if (int.Parse(row.Cells[2].Text) > 1)
                {
                    row.Cells[2].Text = (aantal - 1).ToString();
                }

            }

            Session["aantal"] = Convert.ToInt32(row.Cells[2].Text);
        }


    }
}