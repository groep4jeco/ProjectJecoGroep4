using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;

namespace ProjectBedrijfApp
{
    public partial class Keukenscherm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection("Data Source=SQL.BIM.OSOX.NL;Initial Catalog=2020-BIM01A-P4-Sushi;User ID=BIM01A2019;Password=BIM01A2019");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Page.Response.Redirect(Page.Request.Url.ToString(), true);


        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

            
               
            
        }

        protected void ListView2_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}