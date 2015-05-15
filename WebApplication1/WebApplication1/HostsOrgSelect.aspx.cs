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
    public partial class HostsOrgSelect : System.Web.UI.Page
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

        public void selectOrg(object sender, EventArgs e)
        {
            Session["EventList5"] = dropDownOrgs.SelectedItem.Text.ToString();
            Response.Redirect("HostsEvent.aspx");
        }
    }
}