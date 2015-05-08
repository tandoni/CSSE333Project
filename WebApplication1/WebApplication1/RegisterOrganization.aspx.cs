using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1
{
    public partial class RegisterOrganization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populate1();
        }

        public void populate1()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "locationNames";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownLocations.DataSource = reader;
            dropDownLocations.DataValueField = "lid";
            dropDownLocations.DataTextField = "name";
            dropDownLocations.DataBind();
            con.Close();
        }
        public void registerOrganization(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection conn = new SqlConnection(connString);
            try
            {
                String regUname = newOrgname.Text;
                String regWebpage = newWebsite.Text;
                String regDesc = newDescription.Text;
                LoginPage logged = new LoginPage();
                String uName = logged.logUname;
                String password = logged.hashedPassword;

                var data = Encoding.ASCII.GetBytes("123");
                var sha1 = new SHA1CryptoServiceProvider();
                var sha1data = sha1.ComputeHash(data);

                String hashedPassword = Encoding.ASCII.GetString(sha1data);

                String commType = "addOrganization";

                SqlCommand cmd = new SqlCommand(commType, conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@uname", SqlDbType.VarChar).Value = "123";
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = hashedPassword;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = regUname;
                cmd.Parameters.Add("@webpage", SqlDbType.VarChar).Value = regWebpage;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = regDesc;
                cmd.Parameters.Add("@lid", SqlDbType.Int).Value = dropDownLocations.SelectedItem.Value.ToString().Equals("None") ? -1 : Convert.ToInt32(dropDownLocations.SelectedItem.Value);


               

                conn.Open();
                int num = cmd.ExecuteNonQuery();
                conn.Close();
                if (num == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('No rows Affected');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('"+num+" rows were affected!');", true);

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('"+ex.Message+"');", true);
            }
        }
    }
}