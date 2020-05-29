using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019";

        int v;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["TafelId"] = tafelID;
            }      
        }

        private void LoopButtons(ControlCollection controlCollection)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT[TafelTafelnummer] FROM[Tafel_Reservering]";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader drTafel = cmd.ExecuteReader();
                //string resulaat = drTafel.Read().ToString();
                while (drTafel.Read())
                {
                    foreach (Control control in controlCollection)
                    {
                        if (control is Button)
                        {
                            string id = control.ID;
                            string y = id.Trim('t');
                            System.Diagnostics.Debug.WriteLine(y);
                            if (y == drTafel["TafelTafelnummer"].ToString())
                            {
                                //System.Diagnostics.Debug.WriteLine("SomeText");
                                ((Button)control).BackColor = Color.Red;
                                ((Button)control).Enabled = false;
                            }
                        }

                        if (control.Controls != null)
                        {
                            LoopButtons(control.Controls);
                        }

                    }
                }
                drTafel.Close();
                con.Close();
            }
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
            Response.Redirect("~/ReserveringPagina.aspx");
        }

        public void SetReserverData(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string buttonId = button.Text;

            tafelID = (List<string>)Session["TafelId"];
            Session["TafelId"] = tafelID;

            foreach (var item in tafelID)
            {
                if (item.Contains(buttonId))
                {
                    ReserveerStatus = !ReserveerStatus;
                    System.Diagnostics.Debug.WriteLine(ReserveerStatus);
                    if (ReserveerStatus)
                    {
                        tafelID.Add(buttonId);
                        Session["TafelId"] = tafelID;
                        button.BackColor = Color.Green;
                    }
                    else if (!ReserveerStatus)
                    {
                        tafelID.Remove(buttonId);
                        button.BackColor = default(Color);
                        System.Diagnostics.Debug.WriteLine(tafelID.Count);

                    }
                }
            }
        }

        protected void btn_keuken_Click(object sender, EventArgs e)
        {
            Response.Redirect ("Keukenscherm.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            LoopButtons(Page.Controls);
        }
    }

    class Tafel2
    {
        public string[] tafelnummer = new string[80];
        public int Reserveringsnummer1;
    }
}