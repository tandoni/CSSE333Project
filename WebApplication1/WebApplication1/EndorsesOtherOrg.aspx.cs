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
    public partial class EndorsesOtherOrg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownOrgs.Items.Clear();
                populateOrgs();
            }
        }


        public void populateOrgs()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "endorseOrganizations";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            string userName = Session["UserName"].ToString();
            string password = Session["Password"].ToString();

            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
            cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = Session["EventList7"].ToString();
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownOrgs.DataSource = reader;
            dropDownOrgs.DataValueField = "name";
            dropDownOrgs.DataTextField = "name";
            dropDownOrgs.DataBind();
            con.Close();
        }

        public void endorse(object sender, EventArgs e)
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection con = new SqlConnection(connString);
                
                String editedDesc = endDesc.Text;

                String commType2 = "addEndorsement";
                SqlCommand cmd2 = new SqlCommand(commType2, con);
                cmd2.CommandType = CommandType.StoredProcedure;

                string userName = Session["UserName"].ToString();
                string password = Session["Password"].ToString();

                cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
                cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = Session["EventList7"].ToString();
                cmd2.Parameters.Add("@name2", SqlDbType.VarChar).Value = dropDownOrgs.SelectedItem.Text.ToString();
                cmd2.Parameters.Add("@text", SqlDbType.VarChar).Value = editedDesc;
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You endorsed an organization successfully');", true);

                dropDownOrgs.Items.Clear();
                populateOrgs();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}