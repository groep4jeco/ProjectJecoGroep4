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
    public partial class regristratiepagina : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ronde"] = "1";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                int tafelnummer = int.Parse(TextBox1.Text);
                con.Open();
                string reserveringophalen = "select Reserveringsnummer from tafelbezetting where TafelTafelnummer = @tafel";
                SqlCommand cmdtafel = new SqlCommand(reserveringophalen, con);
                cmdtafel.Parameters.AddWithValue("@tafel", tafelnummer);
                object objreservering = cmdtafel.ExecuteScalar();
                string stringreservering = objreservering.ToString();
                int reserveringsnummer = int.Parse(stringreservering);
                Session["reservering"] = reserveringsnummer;
                con.Close();

                Response.Redirect("~/Bestellen.aspx");
            }

        }
    }
}