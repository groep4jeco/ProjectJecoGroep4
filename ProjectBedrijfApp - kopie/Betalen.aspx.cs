using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class Betalen : System.Web.UI.Page
    {
        private double prijs = 22.50;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double aantalPersonen = double.Parse(TextBox3.Text);
            double TotaalEten = aantalPersonen * prijs;
            BerekenTotaalBedrag(TotaalEten);
        }
        private void BerekenTotaalBedrag(double totalEten) 
        {
            Label4.Text = totalEten.ToString();
        }
    }
}