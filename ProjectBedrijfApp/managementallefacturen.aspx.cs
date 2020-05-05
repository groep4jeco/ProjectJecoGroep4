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
    }
}