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


        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ronde"] = "1";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                int reserveringsnummer = int.Parse(TextBox1.Text);

                Session["reservering"] = reserveringsnummer;


                Response.Redirect("~/Bestellen.aspx");
            }

        }
    }
}