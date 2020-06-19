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
        string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019";


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

        protected void ClickBetalen(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                if (DropDownList1.SelectedValue == "Maestro")
                {


                }
                if (DropDownList1.SelectedValue == "MasterCard")

                {


                }
                if (DropDownList1.SelectedValue == "Cash")

                {

                }
                con.Close();
            }
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

        protected void btnMaestro_Click(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

        }
    }
}