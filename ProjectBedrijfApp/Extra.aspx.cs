using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class Extra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDoorgaan.Enabled = false;

            Label4.Visible = false;
            txbAantal.Visible = false;
        }

        protected void btnExtraRondes_Click(object sender, EventArgs e)
        {
            btnExtraRondes.Enabled = false;
            btnApartBestellen.Enabled = true;
            btnDoorgaan.Enabled = true;

            Label4.Visible = true;
            txbAantal.Visible = true;
        }

        protected void btnApartBestellen_Click(object sender, EventArgs e)
        {
            btnExtraRondes.Enabled = true;
            btnApartBestellen.Enabled = false;
            btnDoorgaan.Enabled = true;
        }

        protected void btnDoorgaan_Click(object sender, EventArgs e)
        {
            if (btnApartBestellen.Enabled = false)
            {
                
            }
            Response.Redirect("ApartBestellen.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}