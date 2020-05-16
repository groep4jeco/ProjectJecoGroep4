using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class tabletkeuze : System.Web.UI.Page
    {
        private string Id;
        private string voornaam;
        protected void Page_Load(object sender, EventArgs e)
        {
            Id = Session["Id"].ToString();
            voornaam = (string)Session["Naam"];
            VrmNaam.Text = voornaam;
            IdLabel.Text = Id;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("overview.aspx");
        }
    }
}