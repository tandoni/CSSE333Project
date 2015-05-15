using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AcceptRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownNames.Items.Clear();
                populateNames();
            }
        }

        public void populateNames()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "myQuet";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            string userName = Session["UserName"].ToString();
            string password = Session["Password"].ToString();

            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
            cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = Session["EventList3"].ToString();
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownNames.DataSource = reader;
            dropDownNames.DataValueField = "uname";
            dropDownNames.DataTextField = "uname";
            dropDownNames.DataBind();
            con.Close();
        }

        public void selectUsers(object sender, EventArgs e)
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection conn = new SqlConnection(connString);
                String commType2 = "repApprove";
                SqlCommand cmd2 = new SqlCommand(commType2, conn);
                cmd2.CommandType = CommandType.StoredProcedure;

                string userName = Session["UserName"].ToString();
                string password = Session["Password"].ToString();

                cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
                cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = Session["EventList3"].ToString();
                cmd2.Parameters.Add("@rcvr", SqlDbType.VarChar).Value = dropDownNames.SelectedItem.Text.ToString();

                conn.Open();
                cmd2.ExecuteNonQuery();
                conn.Close();

                dropDownNames.Items.Clear();
                populateNames();
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You accepted successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}