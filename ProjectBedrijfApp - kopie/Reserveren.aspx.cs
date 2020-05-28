using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class Reserveren : System.Web.UI.Page
    {
        public int SelectedTafelID;
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        public void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReserveringPagina.aspx?TafelID=" + SelectedTafelID.ToString());
        }

        private void SettingReserverData(int ResNummer, int TafelNummer )
        {
            Tafel Tafel1 = new Tafel();
            Tafel1.Reserveringsnummer = ResNummer;
            SelectedTafelID = TafelNummer;

            for (int i = 0; i < 5; i++)
            {
                Tafel1.tafelID[i] = TafelNummer;
                if (Tafel1.tafelID[i] == TafelNummer)
                {
                    Label1.Text = SelectedTafelID.ToString(); //Tafel1.tafelID[i].ToString();

                    IB1.ImageUrl = "";
                }
            }
        }

        protected void SetReserverData(object sender, ImageClickEventArgs e)
        {
            SettingReserverData(1, 5);
        }
    }

    class Tafel 
    {
        public int[] tafelID = new int[5];
        public int Reserveringsnummer;
    }
}