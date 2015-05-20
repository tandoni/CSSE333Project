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
    public partial class AttendsEvent : System.Web.UI.Page
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
            String commType2 = "allEvents";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownEvents.DataSource = reader;
            dropDownEvents.DataTextField = "name";
            dropDownEvents.DataValueField = "eid";
            dropDownEvents.DataBind();
            con.Close();
        }

        public void attendEvent(object sender, EventArgs e)
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection con = new SqlConnection(connString);

                String commType2 = "addAttends";
                SqlCommand cmd2 = new SqlCommand(commType2, con);
                cmd2.CommandType = CommandType.StoredProcedure;

                string userName = Session["UserName"].ToString();
                string password = Session["Password"].ToString();

                cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = userName;
                cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                cmd2.Parameters.Add("@eid", SqlDbType.Int).Value = Convert.ToInt32(dropDownEvents.SelectedItem.Value);
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You marked as an attendee successfully');", true);

                dropDownEvents.Items.Clear();
                populateEvents();
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You are either already marked for this event or an error occured.');", true);
            }
        }
    }
}