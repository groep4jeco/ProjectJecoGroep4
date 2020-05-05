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
            Panel2.Visible = false;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void BtnZoek_Click(object sender, EventArgs e)
        {
            string datum = calendarTest.SelectedDate.ToString("yyyy-MM-dd");
            DateTime test = DateTime.Parse(datum);
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        { 
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex =-1;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Panel2.Visible = true;
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
            con.Open();
            string querie = "SELECT[Naam], [Adres], [Plaats] FROM[Restaurant] WHERE([Restaurant ID] = '1'";
            SqlCommand cmd = new SqlCommand(querie, con);
            SqlDataReader dr = cmd.ExecuteReader();
            string resultaat = dr.Read().ToString();
            Label3.Text = dr["Naam"].ToString();
            con.Close();

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}