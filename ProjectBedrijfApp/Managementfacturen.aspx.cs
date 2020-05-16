using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class Managementfacturen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            con.Open();
            string querie = "select voornaam from personeel where achternaam = 'Je'";
            SqlCommand cmd = new SqlCommand(querie, con);
            SqlDataReader dr = cmd.ExecuteReader();
            string resultaat = dr.Read().ToString();
            lbltest.Text = dr["voornaam"].ToString();
            con.Close();
        }
    }
}