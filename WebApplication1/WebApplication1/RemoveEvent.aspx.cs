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
    public partial class RemoveEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropDownEvents.Items.Clear();
                populateEvents();
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
            string orgName = Session["EventList2"].ToString();

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

        public void selectEvent(object sender, EventArgs e)
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection con = new SqlConnection(connString);


                String commType2 = "removeEvent";
                SqlCommand cmd2 = new SqlCommand(commType2, con);
                cmd2.CommandType = CommandType.StoredProcedure;

                string userName = Session["UserName"].ToString();
                string password = Session["Password"].ToString();

                cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
                cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                cmd2.Parameters.Add("@eid", SqlDbType.VarChar).Value = dropDownEvents.SelectedItem.Value.ToString();
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You removed an event successfully');", true);


                dropDownEvents.Items.Clear();
                populateEvents();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}