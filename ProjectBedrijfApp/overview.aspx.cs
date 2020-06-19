using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Globalization;

namespace ProjectBedrijfApp
{
    public partial class overview1 : System.Web.UI.Page
    {
        public int SelectedTafelID;
        public bool ReserveerStatus;
        public List<string> tafelID = new List<string>();
        public List<string> results = new List<string>();
        string time;
        private bool statusCheck;
        string tijdvakdata;
        int tijdvaknummer;
        string tijden;

        string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019";

        int v;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["TafelId"] = tafelID;
                //Session["ReserveerStatus"] = ReserveerStatus;
            }

            CultureInfo dutch = new CultureInfo("nl-NL");
            DateTime dagvandaag = DateTime.Now;
            string dagen = dutch.DateTimeFormat.GetDayName(dagvandaag.DayOfWeek).ToString();

            TimeSpan startdeel1 = new TimeSpan(16, 50, 0);
            TimeSpan enddeel1 = new TimeSpan(19, 15, 0);
            //TimeSpan now = DateTime.Now.TimeOfDay;
            TimeSpan now = new TimeSpan(17, 30, 0);
            if (startdeel1 < enddeel1 && startdeel1 <= now && now <= enddeel1)
            {
                time = "17:00:00";
            }
            TimeSpan startdeel2 = new TimeSpan(19, 15, 0);
            TimeSpan enddeel2 = new TimeSpan(21, 30, 0);
            if (startdeel2 < enddeel2 && startdeel2 <= now && now <= enddeel2)
            {
                time = "19:30:00";
            }
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();
            string prequerie = "select Tijdvak.Nummer from Tijdvak where Begintijd = @tijd AND Dag = @dag";
            SqlCommand cmdtijdvak = new SqlCommand(prequerie, con);
            cmdtijdvak.Parameters.AddWithValue("@dag", dagen);
            cmdtijdvak.Parameters.AddWithValue("@tijd", time);
            object tijd = cmdtijdvak.ExecuteScalar();
            tijden = tijd.ToString();
            tijdvaknummer = int.Parse(tijden);
            Session["tijdvaknummer"] = tijdvaknummer;
            con.Close();
            LoopButtons(Page.Controls);

        }

        private void LoopButtons(ControlCollection controlCollection)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT[TafelTafelnummer] FROM[Tafelbezetting] where TijdvakNummer = @tijdvak";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@tijdvak", Session["tijdvaknummer"]);
                SqlDataReader drTafel = cmd.ExecuteReader();
                //string resulaat = drTafel.Read().ToString();

                while (drTafel.Read())
                {
                    results.Add(drTafel["TafelTafelnummer"].ToString());
                }
                    foreach (Control control in controlCollection)
                    {
                        if (control is Button)
                        {
                            string id = control.ID;
                            string y = id.Trim('t');
                            // System.Diagnostics.Debug.WriteLine(y);
                            foreach (var item in results)
                            {
                                if (results.Any(x => x.ToString() == y))
                                {
                                    //System.Diagnostics.Debug.WriteLine("SomeText");
                                    ((Button)control).BackColor = Color.Red;
                                    
                                }
                            }
                        }

                        if (control.Controls != null)
                        {
                            LoopButtons(control.Controls);
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
             Session["Reserveringsnummer"] = SelectedTafelID;
            Response.Redirect("~/ReserveringPagina.aspx");
        }

        public void SetReserverData(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string buttonId = button.Text.Trim();
            tafelID = (List<string>)Session["TafelId"];

            CheckStatus(buttonId, button);
            System.Diagnostics.Debug.WriteLine(statusCheck);


            if (!tafelID.Any(x => x.ToString() == buttonId))
            {
                ReserveerStatus = true;
                tafelID.Add(buttonId);
                Session["TafelId"] = tafelID;
            }
            else if (tafelID.Contains(buttonId))
            {
                ReserveerStatus = false;
            }


            if (!statusCheck)
            {
                if (ReserveerStatus)
                {
                    Buon83.Enabled = true;
                    button.BackColor = Color.Green;
                }
                if (!ReserveerStatus)
                {
                    tafelID.Remove(buttonId);
                    button.BackColor = Color.Red;
                    Buon83.Enabled = false;
                }
            }
        }
        private void CheckStatus(string BtnId, Button btn) 
        {
            foreach (var item in results)
            {
                if (results.Any(x => x.ToString() == BtnId))
                {
                    statusCheck = true;
                    Button2.Enabled = true;
                    Buon83.Enabled = false;
                    btn.BackColor = Color.Blue;
                }
                else 
                {
                    statusCheck = false;
                    Button2.Enabled = false;
                }
            }
        }


        protected void btn_keuken_Click(object sender, EventArgs e)
        {
            Response.Redirect("Keukenscherm.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Bestellen_drinken.aspx");
        } 
    }

    class Tafel2
    {
        public string[] tafelnummer = new string[80];
        public int Reserveringsnummer1;
    }
}