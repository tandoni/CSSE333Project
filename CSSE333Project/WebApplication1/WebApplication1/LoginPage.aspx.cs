using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;

namespace WebApplication1
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void loginValidate(object sender, EventArgs e)
        {
            String cString = "Data Source=titan.cs.rose-hulman.edu;Initial Catalog=JHIT_Project43; User ID=" + username.Text + ";Password=" + password.Text + ";";
            SqlConnection conn = new SqlConnection(cString);
            try
            {
                conn.Open();
                uname.Text = "Connected to DATABASE";
                Thread.Sleep(100);
              
            }
            catch(Exception ex)
            {
                uname.Text = "NOT CONNECTED TO DATABASE.";
             //   ClientScript.RegisterClientScriptBlock(GetType(),"", "Database Error");//, null, false);
            }
        }
    }
}