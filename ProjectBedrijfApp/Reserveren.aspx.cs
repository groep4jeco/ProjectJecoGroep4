using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ProjectBedrijfApp
{
    public partial class Reserveren : System.Web.UI.Page
    {
        public string SelectedTafelID;
        int index = 0;
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
            Response.Redirect("~/ReserveringPagina.aspx?TafelID=" + SelectedTafelID);
        }

        private void SettingReserverData(string TafelNummer)
        {
            Tafel Tafel = new Tafel();
            Tafel.Reserveringsnummer++;
            SelectedTafelID = TafelNummer;
        }

        public void SetReserverData(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string buttonId = button.ID;

            tafelID = (List<string>)Session["TafelId"];
            
                tafelID.Add(buttonId);
                Session["TafelId"] = tafelID;
                Label1.Text = tafelID.Count.ToString();
            
               
            foreach (var item in tafelID) 
            {
                System.Diagnostics.Debug.WriteLine(item);
            }
        }
    }

    class Tafel 
    {
        public string[] tafelnummer = new string[80]; 
        public int Reserveringsnummer;
    }
}