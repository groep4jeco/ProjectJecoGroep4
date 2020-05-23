﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    
    public partial class overview : System.Web.UI.Page
    {
        string connetionString;
        SqlConnection cnn;
        SqlDataReader dr;
        private int IsManager;

        protected void Page_Load(object sender, EventArgs e)
        {
            connetionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019";
            cnn = new SqlConnection(connetionString);

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                cnn.Open();

                string query = "SELECT[Personeelsnummer], [Wachtwoord], [Voornaam], [Functie] FROM[Personeel] WHERE(([Personeelsnummer] = @Personeelsnummer) AND([Wachtwoord] = @Wachtwoord))";



                string Id = TextBox1.Text;
                string password = TextBox2.Text;

                SqlCommand cmdSchedule = new SqlCommand(query, cnn);

                cmdSchedule.Parameters.AddWithValue("@Personeelsnummer", Id);
                cmdSchedule.Parameters.AddWithValue("@Wachtwoord", password);

                dr = cmdSchedule.ExecuteReader();
                string resulaat = dr.Read().ToString();

                if (dr["Personeelsnummer"].ToString() == Id && dr["Wachtwoord"].ToString() == password)
                {

                    string ismanager = dr["Functie"].ToString();
                    System.Diagnostics.Debug.WriteLine(ismanager);
                    if (ismanager == "True")
                    {
                        Session["Id"] = dr["Personeelsnummer"];
                        Session["Naam"] = dr["Voornaam"];
                        Session["Functie"] = ismanager;
                        Response.Redirect("tabletkeuze.aspx");
                    }
                    else
                    {
                        Session["Id"] = dr["Personeelsnummer"];
                        Session["Naam"] = dr["Voornaam"];
                        Response.Redirect("tabletkeuze.aspx");
                    }
                        
                } 
            }

            catch
            {
                Label3.Text = "inloggen mislukt";
            }
            finally
            {
                dr.Close();
                cnn.Close();
            }
        }
    }
}
