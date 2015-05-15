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
    public partial class HostsEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownEvents.Items.Clear();
                dropDownOrgs.Items.Clear();
                populateEvents();
                populateOrgs();
            }
        }

        public void hostEvent(object sender, EventArgs e)
        {
            try
            {
                if (Session["EventList5"].ToString().Equals(dropDownOrgs.SelectedItem.Text.ToString()))
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You cannot host event form the same organization.\n Select a different one');", true);
                }
                else
                {
                    String userid = Session["UserName"].ToString();
                    String password = Session["Password"].ToString();

                    String connString = ConfigurationManager.AppSettings["connectionInfo"];
                    SqlConnection conn = new SqlConnection(connString);

                    String sp_add = "addHost";

                    SqlCommand cmd = new SqlCommand(sp_add, conn);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@uname", SqlDbType.VarChar).Value = userid;
                    cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = Session["EventList5"].ToString();
                    cmd.Parameters.Add("@name2", SqlDbType.VarChar).Value = dropDownOrgs.SelectedItem.Text.ToString();
                    cmd.Parameters.Add("@eid", SqlDbType.Int).Value = Convert.ToInt32(dropDownEvents.SelectedItem.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    dropDownOrgs.Items.Clear();
                    dropDownEvents.Items.Clear();
                    populateEvents();
                    populateOrgs();

                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You hosted an event successfully');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }

        public void populateEvents()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "myEvents";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            string userName = Session["UserName"].ToString();
            string password = Session["Password"].ToString();
            string orgName = Session["EventList5"].ToString();

            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
            cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = orgName;
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownEvents.DataSource = reader;
            dropDownEvents.DataTextField = "ename";
            dropDownEvents.DataValueField = "eid";
            dropDownEvents.DataBind();
            con.Close();
        }

        public void populateOrgs()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "myOrganizations";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            string userName = Session["UserName"].ToString();
            string password = Session["Password"].ToString();

            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownOrgs.DataSource = reader;
            dropDownOrgs.DataValueField = "name";
            dropDownOrgs.DataTextField = "name";
            dropDownOrgs.DataBind();
            con.Close();
        }
    }
}