using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class Timer : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            lblRonde.Text = Session["ronde"].ToString();
            Button1.Enabled = false;
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            int minuten = int.Parse(lblTimer.Text);

            if (minuten > 0)
            {
                lblTimer.Text = (minuten - 1).ToString();
            }
            else
            {
                Timer1.Enabled = false;
                Button1.Enabled = true;
            }

        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Bestellen.aspx");
        }
    }
}