using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace ProjectBedrijfApp
{
    public partial class Bestellen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBestel_Click(object sender, EventArgs e)
        {

        }

        protected void ddlMenulijst_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMenulijst.SelectedItem.Text == "Soepen")
            {
                soepen.Visible = true;
            }
            else
            {
                soepen.Visible = false;
            }
        }

        protected void imgbtnSoepgerecht1_Click(object sender, ImageClickEventArgs e)
        {
            if (lblToegevoegd1.Text == "")
            {
                lblToegevoegd1.Text = "tomatensoep";
            }
            else if (lblToegevoegd1.Text == "tomatensoep")
            {
                
            }
            else if (lblToegevoegd2.Text == "")
            {
                lblToegevoegd2.Text = "tomatensoep";
            }
            else if (lblToegevoegd2.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd3.Text == "")
            {
                lblToegevoegd3.Text = "tomatensoep";
            }
            else if (lblToegevoegd3.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd4.Text == "")
            {
                lblToegevoegd4.Text = "tomatensoep";
            }
            else if (lblToegevoegd4.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd5.Text == "")
            {
                lblToegevoegd5.Text = "tomatensoep";
            }
            else if (lblToegevoegd5.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd6.Text == "")
            {
                lblToegevoegd6.Text = "tomatensoep";
            }
            else if (lblToegevoegd6.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd7.Text == "")
            {
                lblToegevoegd7.Text = "tomatensoep";
            }
            else if (lblToegevoegd7.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd8.Text == "")
            {
                lblToegevoegd8.Text = "tomatensoep";
            }
            else if (lblToegevoegd8.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd9.Text == "")
            {
                lblToegevoegd9.Text = "tomatensoep";
            }
            else if (lblToegevoegd9.Text == "tomatensoep")
            {

            }
            else if (lblToegevoegd10.Text == "")
            {
                lblToegevoegd10.Text = "tomatensoep";
            }
            else if (lblToegevoegd10.Text == "tomatensoep")
            {

            }

        }

        protected void imgbtnSoepgerecht2_Click(object sender, ImageClickEventArgs e)
        {
            if (lblToegevoegd1.Text == "")
            {
                lblToegevoegd1.Text = "groentesoep";
            }
            else if (lblToegevoegd1.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd2.Text == "")
            {
                lblToegevoegd2.Text = "groentesoep";
            }
            else if (lblToegevoegd2.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd3.Text == "")
            {
                lblToegevoegd3.Text = "groentesoep";
            }
            else if (lblToegevoegd3.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd4.Text == "")
            {
                lblToegevoegd4.Text = "groentesoep";
            }
            else if (lblToegevoegd4.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd5.Text == "")
            {
                lblToegevoegd5.Text = "groentesoep";
            }
            else if (lblToegevoegd5.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd6.Text == "")
            {
                lblToegevoegd6.Text = "groentesoep";
            }
            else if (lblToegevoegd6.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd7.Text == "")
            {
                lblToegevoegd7.Text = "groentesoep";
            }
            else if (lblToegevoegd7.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd8.Text == "")
            {
                lblToegevoegd8.Text = "groentesoep";
            }
            else if (lblToegevoegd8.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd9.Text == "")
            {
                lblToegevoegd9.Text = "groentesoep";
            }
            else if (lblToegevoegd9.Text == "groentesoep")
            {

            }
            else if (lblToegevoegd10.Text == "")
            {
                lblToegevoegd10.Text = "groentesoep";
            }
            else if (lblToegevoegd10.Text == "groentesoep")
            {

            }
        }

        protected void imgbtnSoepgerecht3_Click(object sender, ImageClickEventArgs e)
        {
            if (lblToegevoegd1.Text == "")
            {
                lblToegevoegd1.Text = "erwtensoep";
            }
            else if (lblToegevoegd1.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd2.Text == "")
            {
                lblToegevoegd2.Text = "erwtensoep";
            }
            else if (lblToegevoegd2.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd3.Text == "")
            {
                lblToegevoegd3.Text = "erwtensoep";
            }
            else if (lblToegevoegd3.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd4.Text == "")
            {
                lblToegevoegd4.Text = "erwtensoep";
            }
            else if (lblToegevoegd4.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd5.Text == "")
            {
                lblToegevoegd5.Text = "erwtensoep";
            }
            else if (lblToegevoegd5.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd6.Text == "")
            {
                lblToegevoegd6.Text = "erwtensoep";
            }
            else if (lblToegevoegd6.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd7.Text == "")
            {
                lblToegevoegd7.Text = "erwtensoep";
            }
            else if (lblToegevoegd7.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd8.Text == "")
            {
                lblToegevoegd8.Text = "erwtensoep";
            }
            else if (lblToegevoegd8.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd9.Text == "")
            {
                lblToegevoegd9.Text = "erwtensoep";
            }
            else if (lblToegevoegd9.Text == "erwtensoep")
            {

            }
            else if (lblToegevoegd10.Text == "")
            {
                lblToegevoegd10.Text = "erwtensoep";
            }
            else if (lblToegevoegd10.Text == "erwtensoep")
            {

            }
        }

        protected void btnVerwijderLaatste_Click(object sender, EventArgs e)
        {
            if (lblToegevoegd10.Text != "")
            {
                lblToegevoegd10.Text = "";
                lblAantal10.Text = "0";
            }
            else if (lblToegevoegd9.Text != "")
            {
                lblToegevoegd9.Text = "";
                lblAantal9.Text = "0";
            }
            else if (lblToegevoegd8.Text != "")
            {
                lblToegevoegd8.Text = "";
                lblAantal8.Text = "0";
            }
            else if (lblToegevoegd7.Text != "")
            {
                lblToegevoegd7.Text = "";
                lblAantal7.Text = "0";
            }
            else if (lblToegevoegd6.Text != "")
            {
                lblToegevoegd6.Text = "";
                lblAantal6.Text = "0";
            }
            else if (lblToegevoegd5.Text != "")
            {
                lblToegevoegd5.Text = "";
                lblAantal5.Text = "0";
            }
            else if (lblToegevoegd4.Text != "")
            {
                lblToegevoegd4.Text = "";
                lblAantal4.Text = "0";
            }
            else if (lblToegevoegd3.Text != "")
            {
                lblToegevoegd3.Text = "";
                lblAantal3.Text = "0";
            }
            else if (lblToegevoegd2.Text != "")
            {
                lblToegevoegd2.Text = "";
                lblAantal2.Text = "0";
            }
            else if (lblToegevoegd1.Text != "")
            {
                lblToegevoegd1.Text = "";
                lblAantal1.Text = "0";
            }
        }

        protected void btnPlus1_Click(object sender, EventArgs e)
        {
            int Aantal1 = int.Parse(lblAantal1.Text) + 1;
            lblAantal1.Text = Aantal1.ToString();
        }

        protected void btnMinus1_Click(object sender, EventArgs e)
        {
            int Aantal1 = int.Parse(lblAantal1.Text) - 1;
            lblAantal1.Text = Aantal1.ToString();
        }

        protected void btnPlus2_Click(object sender, EventArgs e)
        {
            int Aantal2 = int.Parse(lblAantal2.Text) + 1;
            lblAantal2.Text = Aantal2.ToString();
        }

        protected void btnMinus2_Click(object sender, EventArgs e)
        {
            int Aantal2 = int.Parse(lblAantal2.Text) - 1;
            lblAantal2.Text = Aantal2.ToString();
        }

        protected void btnPlus3_Click(object sender, EventArgs e)
        {
            int Aantal3 = int.Parse(lblAantal3.Text) + 1;
            lblAantal3.Text = Aantal3.ToString();
        }

        protected void btnMinus3_Click(object sender, EventArgs e)
        {
            int Aantal3 = int.Parse(lblAantal3.Text) - 1;
            lblAantal3.Text = Aantal3.ToString();
        }
    }
}