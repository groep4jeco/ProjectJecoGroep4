﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Bestellen
{
    public partial class Beginpagina : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int reserveringsnummer = int.Parse(TextBox1.Text);

            Session["reservering"] = reserveringsnummer;
            

            Response.Redirect("~/Bestellen.aspx");
        }
    }
}