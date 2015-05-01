using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;

namespace WebApplication1
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void registerUser(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection conn = new SqlConnection(connString);
            try
            {
                String commType = "addPerson";
                String regUname = newUsername.Text ;
                String regPass = newPassword.Text;
                String regName = newName.Text;
                String regEmail = newEmail.Text;

                //String queryText = "exec addPerson " + regUname + " " +
                //    regPass + " " + regName + " " + regEmail;

                var data = Encoding.ASCII.GetBytes(regPass);
                var sha1 = new SHA1CryptoServiceProvider();
                var sha1data = sha1.ComputeHash(data);

                String hashedPassword = Encoding.ASCII.GetString(sha1data);


                SqlCommand cmd = new SqlCommand(commType, conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@uname", SqlDbType.NVarChar).Value = regUname;
                cmd.Parameters.Add("@pwd", SqlDbType.NVarChar).Value = hashedPassword;
                cmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = regName;
                cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = regEmail;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('You registered sucessfully!');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Database ERROR!');", true);
            }
        }
    }
}