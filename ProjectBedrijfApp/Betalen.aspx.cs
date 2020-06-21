using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBedrijfApp
{
    public partial class betalen2 : System.Web.UI.Page
    {
        string connectionString = "Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = "1";
            }

            MultiView1.ActiveViewIndex = Convert.ToInt32(DropDownList1.SelectedValue);


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = Convert.ToInt32(DropDownList1.SelectedValue);
        }


        protected void BtnCash1_Click(object sender, EventArgs e)
        {
            ClickBetalen();

        }

        private void ClickBetalen()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string queriefactuur = "SELECT [Totaalbedrag] FROM [Factuur] WHERE [Factuurnummer] = @Factuurnummer";
                SqlCommand cmdfactuur = new SqlCommand(queriefactuur, con);
                cmdfactuur.Parameters.AddWithValue("@Factuurnummer", (int)Session["factuurnummer"]);
                SqlDataReader drfactuur = cmdfactuur.ExecuteReader();
                string resultaatfactuur = drfactuur.Read().ToString();
                string factuurtotaal = drfactuur["Totaalbedrag"].ToString();
                double probeer = double.Parse(factuurtotaal);
                con.Close();

                string controle = DropDownList1.SelectedValue.ToString();


                if (DropDownList1.SelectedValue.ToString() == "2")

                {
                    con.Open();
                    double prijs = double.Parse(TextBox2.Text);

                    string optellen = "Update factuur set Betaalmethode = @betaal, Betaaldbedrag = isnull([Betaaldbedrag], 0) + @payment where Factuurnummer = @factuur";
                    SqlDataAdapter adapter4 = new SqlDataAdapter();
                    adapter4.UpdateCommand = new SqlCommand(optellen, con);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@betaal", "Maestro");
                    adapter4.UpdateCommand.Parameters.AddWithValue("@payment", prijs);
                    int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                    con.Close();

                    if (prijs < probeer)
                    {
                        double tekort = probeer - prijs;
                        Label1.Text = "U moet nog" + tekort + "betalen.";
                    }


                }
                if (DropDownList1.SelectedValue.ToString() == "3")

                {
                    double prijs = double.Parse(TextBox3.Text);
                    con.Open();
                    string optellen = "Update factuur set Betaalmethode = @betaal, Betaaldbedrag = isnull([Betaaldbedrag], 0) + @payment where Factuurnummer = @factuur";
                    SqlDataAdapter adapter4 = new SqlDataAdapter();
                    adapter4.UpdateCommand = new SqlCommand(optellen, con);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@betaal", "MasterCard");
                    adapter4.UpdateCommand.Parameters.AddWithValue("@payment", prijs);
                    int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                    con.Close();

                }
                if (DropDownList1.SelectedValue.ToString() == "1")

                {
                    double prijs = double.Parse(TextBox1.Text);
                    con.Open();
                    string optellen = "Update factuur set Betaalmethode = @betaal, Betaaldbedrag = isnull([Betaaldbedrag], 0) + @payment where Factuurnummer = @factuur";
                    SqlDataAdapter adapter4 = new SqlDataAdapter();
                    adapter4.UpdateCommand = new SqlCommand(optellen, con);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@factuur", (int)Session["factuurnummer"]);
                    adapter4.UpdateCommand.Parameters.AddWithValue("@betaal", "Cash");
                    adapter4.UpdateCommand.Parameters.AddWithValue("@payment", prijs);
                    int doehet = adapter4.UpdateCommand.ExecuteNonQuery();
                    con.Close();
                }
                con.Close();
                Response.Redirect("~/betalen.aspx");
            }

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {


        }

        protected void btnPrint_Click1(object sender, EventArgs e)
        {

        }

        protected void btnmcprinten_Click(object sender, EventArgs e)
        {

        }

        protected void btnMaestro_Click(object sender, EventArgs e)
        {
            ClickBetalen();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

        }

        protected void ClickBetalen(object sender, EventArgs e)
        {
            ClickBetalen();
        }
    }
}