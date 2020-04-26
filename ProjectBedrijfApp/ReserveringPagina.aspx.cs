using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class ReserveringPagina : System.Web.UI.Page
    {
        private int SelectedTafelID;
        private string tijdvak;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TafelID"] != null)
            {
                string TafelIDString = Request.QueryString["TafelID"];
                SelectedTafelID = int.Parse(TafelIDString);
                Label3.Text = SelectedTafelID.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label3.Text = SelectedTafelID.ToString() + "\r\n" + "gekozen tijdvak: " + tijdvak + "\r\n" + "het aantal personen: " + TextBox1.Text;
        }

        

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Console.Write("Enter your name: ");
            if (RadioButton1.Checked)
            {
                RadioButton2.Checked = false;
            }
            tijdvak = RadioButton1.Text;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Console.Write("Enter your name: ");
            if (RadioButton2.Checked)
            {
                RadioButton1.Checked = false;
            }
            tijdvak = RadioButton2.Text;
        }
    }
}