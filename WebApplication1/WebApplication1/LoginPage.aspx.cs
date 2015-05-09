using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;

namespace WebApplication1
{
    public partial class LoginPage : System.Web.UI.Page
    {

        public String logUname;
        String logPass;
        public String hashedPassword;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void loginValidate(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection conn = new SqlConnection(connString);
            Session["SQLConnection"] = conn;
            try
            {
                String commType = "validateUser";
                logUname = username.Text;
                logPass = password.Text;

                var data = Encoding.ASCII.GetBytes(logPass);
                var sha1 = new SHA1CryptoServiceProvider();
                var sha1data = sha1.ComputeHash(data);

                hashedPassword = Encoding.ASCII.GetString(sha1data);

                Session["UserName"] = logUname;
                Session["Password"] = hashedPassword;

                conn.Open();

                SqlCommand cmd = new SqlCommand(commType, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@uname", SqlDbType.NVarChar).Value = logUname;
                cmd.Parameters.Add("@pwd", SqlDbType.NVarChar).Value = hashedPassword;

                cmd.Parameters.Add("@returnVal", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                String result = cmd.Parameters["@returnVal"].Value.ToString();
                if (result.Equals("1"))
                {
                    Response.Redirect("WelcomeUser.aspx");
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Database WORKS!');", true);
                }
                else
                {
                    errorLogin.Text = "Username and Password do not match! Please try again!";
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Database ERROR!');", true);
            }
        }
    }
}