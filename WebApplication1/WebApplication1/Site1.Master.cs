﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"].ToString().Equals(""))
            {
                Response.Redirect("LoginPage.aspx");
            }
        }

        public void logout(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["Password"] = "";
            Response.Redirect("LoginPage.aspx");
        }
    }
}