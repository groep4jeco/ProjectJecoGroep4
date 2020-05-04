using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ProjectBedrijfApp
{
    public partial class managementallefacturen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          DateTime test = DateTime.Now;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void BtnZoek_Click(object sender, EventArgs e)
        {

            
             SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            con.Open();
           string datum = calendarTest.SelectedDate.ToString("yyyy-MM-dd");
            DateTime test = DateTime.Parse(datum);


             string querie = "select * from factuur where factuurdatum = '" + test + "'";
            SqlCommand cmd = new SqlCommand(querie, con);
            SqlDataReader dr = cmd.ExecuteReader();
            string resultaat = dr.Read().ToString();
            Label1.Text = "The selected date is " + datum.ToString();
            dr.Close();
            con.Close();

            DataList1.Enabled = true;
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {

        }
    }
}