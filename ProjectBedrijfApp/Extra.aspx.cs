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
    public partial class Extra : System.Web.UI.Page
    {
        int menuutjes;
        string aantal;
        string nummer;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDoorgaan.Enabled = false;

            
            ddlfruit.Visible = false;
            Label5.Visible = false;

            int reserveringsnummer = (int)Session["reservering"];
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

            if (!IsPostBack)
            {
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

                        for (int i = 1; i <= menuutjes; i++)
                        {
                            int getal = i;
                            string fruit = getal.ToString();
                            ddlfruit.Items.Add(new ListItem(fruit, fruit));
                        }
                    }

                    catch
                    {
                        menuutjes = 0;
                        ddlfruit.Enabled = false;
                    }

                    finally
                    {
                        con.Close();
                    }
            }
            
        }

        protected void btnExtraRondes_Click(object sender, EventArgs e)
        {
            btnExtraRondes.Enabled = false;
            btnApartBestellen.Enabled = true;
            btnDoorgaan.Enabled = true;
            ddlfruit.Visible = true;
            Label5.Visible = true;
        }

        protected void btnApartBestellen_Click(object sender, EventArgs e)
        {
            btnExtraRondes.Enabled = true;
            btnApartBestellen.Enabled = false;
            btnDoorgaan.Enabled = true;
            
        }

        protected void btnDoorgaan_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

            int extrarondes = 1;
            int maxrondes = (int)Session["maxronde"];

            if (btnExtraRondes.Enabled == false)
            {
                if (Session["extraatjes"] != null && Session["ronde"] != null && Session["maxronde"] != null && Session["reservering"] != null)
                {
                    Session["extraatjes"] = ddlfruit.SelectedValue.ToString();
                    int rondetjes = int.Parse(Session["ronde"].ToString()) + 1;
                    Session["ronde"] = rondetjes;
                    maxrondes += extrarondes;
                    Session["maxronde"] = maxrondes;
                    aantal = Session["extraatjes"].ToString();
                    nummer = Session["reservering"].ToString();
                }    

                con.Open();
                string rondestoevoegen = "Update in_restaurant set [Extra rondes] = isnull([Extra rondes], 0) + @aantal where reserveringsnummer = @reserveringsnummero";
                SqlDataAdapter adapter3 = new SqlDataAdapter();
                adapter3.UpdateCommand = new SqlCommand(rondestoevoegen, con);
                adapter3.UpdateCommand.Parameters.AddWithValue("@reserveringsnummero", nummer);
                adapter3.UpdateCommand.Parameters.AddWithValue("@aantal", aantal);
                int doehet = adapter3.UpdateCommand.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Bestellen.aspx");
            }

            else
            {
                Response.Redirect("ApartBestellen.aspx");
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}



