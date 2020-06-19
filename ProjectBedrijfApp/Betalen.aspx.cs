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
   
        
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = Convert.ToInt32(DropDownList1.SelectedValue);
        }

       
        protected void BtnCash1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

            
        }

        protected void btnPrint_Click1(object sender, EventArgs e)
        {

        }

        protected void btnmcprinten_Click(object sender, EventArgs e)
        {

        }
    }
}