using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EditOrganization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateLocations();
            populateOrgs();
            populatePartOfOrgs();
        }

        public void populateOrgs()
        {
            dropDownOrgs.Items.Add(new ListItem("--Select an Organization--", "\0", true));
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

            //ListItem itemToRemove = dropDownPartOfOther.Items.FindByValue("")

            con.Close();
        }

        public void populatePartOfOrgs()
        {
            dropDownPartOfOther.Items.Add(new ListItem("--Select a Parent Organization--", "\0", true));
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

            dropDownPartOfOther.DataSource = reader;
            dropDownPartOfOther.DataValueField = "name";
            dropDownPartOfOther.DataTextField = "name";
            dropDownPartOfOther.DataBind();

            //ListItem itemToRemove = dropDownPartOfOther.Items.FindByValue("")

            con.Close();
        }

        public void populateLocations()
        {
            dropDownLocations.Items.Add(new ListItem("--Select a new Headquarter--", "\0", true));
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

        public void editOrganization(object sender, EventArgs e)
        {
            try
            {
                if (dropDownOrgs.SelectedItem.Text.ToString().Equals(dropDownPartOfOther.SelectedItem.Text.ToString()))
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Error: Organization cannot be part of itself.');", true);
                }
                else
                {
                    String connString = ConfigurationManager.AppSettings["connectionInfo"];
                    SqlConnection con = new SqlConnection(connString);

                    String editedWebpage = editUrl.Text;
                    String editedDesc = editDesc.Text;

                    String commType2 = "editOrganization";
                    SqlCommand cmd2 = new SqlCommand(commType2, con);
                    cmd2.CommandType = CommandType.StoredProcedure;

                    string userName = Session["UserName"].ToString();
                    string password = Session["Password"].ToString();

                    cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
                    cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                    cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = dropDownOrgs.SelectedItem.Value.ToString();
                    cmd2.Parameters.Add("@webpage", SqlDbType.VarChar).Value = editedWebpage;
                    cmd2.Parameters.Add("@description", SqlDbType.VarChar).Value = editedDesc;
                    cmd2.Parameters.Add("@lid", SqlDbType.Int).Value = Convert.ToInt32(dropDownLocations.SelectedItem.Value);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You edited an organization successfully');", true);
                }
                dropDownLocations.Items.Clear();
                dropDownOrgs.Items.Clear();
                dropDownPartOfOther.Items.Clear();
                populateLocations();
                populateOrgs();
                populatePartOfOrgs();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }

        }

        public void defaultOrgData(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "orgData";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            string userName = Session["UserName"].ToString();
            string password = Session["Password"].ToString();

            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
            cmd2.Parameters.Add("@name", SqlDbType.VarChar).Value = dropDownOrgs.SelectedItem.Value.ToString();
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd2.ExecuteReader();

            //dropDownLocations.SelectedItem.Value = reader["lid"].ToString();
            //dropDownLocations.DataValueField = "lid";
            //dropDownLocations.DataTextField = "name";
            //dropDownLocations.DataBind();
            editDesc.Text = reader["description"].ToString();
            editUrl.Text = reader["webpage"].ToString();
            con.Close();
        }
    }
}