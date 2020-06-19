using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class betalen2 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = Convert.ToInt32(DropDownList1.SelectedValue);
        }

        protected void Btnbetaalcash_Click(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

        }
    }
}