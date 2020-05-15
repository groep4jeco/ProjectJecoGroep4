using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class besteloverzicht : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page lastPage = (Page)Context.Handler;
            lblGerecht1.Text = ((Label)lastPage.FindControl("lblToegevoegd1")).Text;
        }

        protected void btnPlus1_Click(object sender, EventArgs e)
        {

        }

        protected void btnMinus1_Click(object sender, EventArgs e)
        {

        }
    }
}