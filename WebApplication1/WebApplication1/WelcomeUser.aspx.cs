using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userLabel.Text = Session["UserName"].ToString();
        }

        public void logout(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["Password"] = "";
            Response.Redirect("LoginPage.aspx");
        }
    }
}