﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography.X509Certificates;
using System.Xml.Schema;
using System.Security.Principal;
using System.Drawing.Printing;

namespace ProjectBedrijfApp
{
    public partial class managementallefacturen : System.Web.UI.Page
    {
        DateTime kalender = DateTime.Today;
        protected void Page_Load(object sender, EventArgs e)
        {
            kalender = calendarTest.SelectedDate;
            Panel2.Visible = false;
        }
        [System.ComponentModel.Browsable(false)]
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void BtnZoek_Click(object sender, EventArgs e)
        {
            string datum = calendarTest.SelectedDate.ToString("yyyy-MM-dd");
            DateTime test = DateTime.Parse(datum);
            
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)

        {
            kalender = calendarTest.SelectedDate;
            Panel2.Visible = true;
         int resultaat = (int)GridView1.DataKeys[GridView1.SelectedIndex]["Restaurant ID"];
            SqlConnection con = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
        con.Open();
        string querie = "SELECT[Naam], [Adres], [Plaats] FROM[Restaurant] WHERE [Restaurant ID] = @ID";
        SqlCommand cmd = new SqlCommand(querie, con);
            cmd.Parameters.AddWithValue("@ID", resultaat);
        SqlDataReader dr = cmd.ExecuteReader();
        string resultaat2 = dr.Read().ToString();
        Label3.Text = dr["Naam"].ToString();
        Label4.Text = dr["Adres"].ToString();
        Label5.Text = dr["Plaats"].ToString();
            dr.Close();
            int resultaatklant = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            string querieklant = "SELECT [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE [Klantid] = @IDKLANT";
            SqlCommand cmdklant = new SqlCommand(querieklant, con);
            cmdklant.Parameters.AddWithValue("@IDKLANT", resultaatklant);
            SqlDataReader drklant = cmdklant.ExecuteReader();
            string resultaatklant2 = drklant.Read().ToString();
            Label6.Text = drklant["Voornaam"].ToString() + ' ' +  drklant["Achternaam"].ToString();
            Label7.Text = drklant["Email"].ToString();
            Label8.Text = drklant["Telefoonnummer"].ToString();

            drklant.Close();

            int resultaatadres = (int)GridView1.DataKeys[GridView1.SelectedIndex]["KlantKlantID"];
            string querieadres = "SELECT Online_bestellen.AdresHuisnummer, Online_bestellen.AdresPostcode, adres.Straatnaam, adres.Plaats FROM [Klant] INNER JOIN Adres on adres.KlantKlantID = klant.KlantID inner join Online_bestellen on Adres.Postcode = Online_bestellen.AdresPostcode  WHERE [KlantKlantID] = @IDKLANT";
            SqlCommand cmdadres = new SqlCommand(querieadres, con);
            cmdadres.Parameters.AddWithValue("@IDKLANT", resultaatadres);
            SqlDataReader dradres = cmdadres.ExecuteReader();

            try
            {

                Label9.Visible = true;
                Label10.Visible = true;
                Label11.Visible = true;

                string resultaatadres2 = dradres.Read().ToString();
                Label9.Text = dradres["Straatnaam"].ToString() + ' ' + dradres["AdresHuisnummer"].ToString();
                Label10.Text = dradres["AdresPostcode"].ToString() + ' ' + dradres["Plaats"].ToString();
                Label11.Text = dradres["Straatnaam"].ToString();
                
            }
            catch
            {
                Label9.Visible = false;
                Label10.Visible = false;
                Label11.Visible = false;
               
            }
            finally
            {
                
            }
            dradres.Close();
            int resultaattotaal = (int)GridView1.DataKeys[GridView1.SelectedIndex]["Factuurnummer"];
            string queriefactuur = "SELECT [Totaalbedrag] FROM [Factuur] WHERE [Factuurnummer] = @Factuurnummer";
            SqlCommand cmdfactuur = new SqlCommand(queriefactuur, con);
            cmdfactuur.Parameters.AddWithValue("@Factuurnummer", resultaattotaal);
            SqlDataReader drfactuur = cmdfactuur.ExecuteReader();
            string resultaatfactuur = drfactuur.Read().ToString();
            string factuurtotaal = drfactuur["Totaalbedrag"].ToString();
            double probeer = double.Parse(factuurtotaal);
            double label12 = probeer / 1.09;
            double label13 = probeer / 109 * 9;
            Label14.Text = drfactuur["Totaalbedrag"].ToString();
            Label12.Text = label12.ToString("0.00");
            Label13.Text = label13.ToString("0.00");
             
            drfactuur.Close();
            con.Close();


        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex =-1;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void calendarTest_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "panel2.print()", true);
        }
    }
}