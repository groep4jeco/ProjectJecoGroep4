using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class overview1 : System.Web.UI.Page
    {
        public int SelectedTafelID;
        public bool ReserveerStatus;
        public List<string> tafelID = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["TafelId"] = tafelID;
            }
            //SqlConnection connnection = new SqlConnection("Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;Persist Security Info=True;User ID=BIM01A2019;Password=BIM01A2019");
            //connnection.Open();

        }

        public void Button1_Click(object sender, EventArgs e)
        {
            SettingReserverData();
        }

        private void SettingReserverData()
        {
          //  Tafel Tafel2 = new Tafel();
           // Tafel.Reserveringsnummer1++;
            //SelectedTafelID = Tafel.Reserveringsnummer1;
            Session["Reserveringsnummer"] = SelectedTafelID;
            Response.Redirect("~/ReserveringPagina.aspx?TafelID=");
        }

        public void SetReserverData(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string buttonId = button.Text;

            tafelID = (List<string>)Session["TafelId"];
            tafelID.Add(buttonId);
            Session["TafelId"] = tafelID;

            ReserveerStatus = true;

            foreach (var item in tafelID)
            {
                if (tafelID.Contains(buttonId) && ReserveerStatus)
                {
                    button.BackColor = Color.Green;
                }
                else
                {
                    button.BackColor = Color.Red;
                    ReserveerStatus = false;
                }
            }
        }

        protected void btn_keuken_Click(object sender, EventArgs e)
        {
            Response.Redirect ("Keukenscherm.aspx");
        }
    }

    class Tafel2
    {
        public string[] tafelnummer = new string[80];
        public int Reserveringsnummer1;
    }
}