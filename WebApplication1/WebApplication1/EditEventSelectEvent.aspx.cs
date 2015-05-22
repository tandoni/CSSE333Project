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
    public partial class EditEventSelectEvent : System.Web.UI.Page
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
            string orgName = Session["EventList"].ToString();

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
            Session["EditEventSelectText"] = dropDownEvents.SelectedItem.Text.ToString();
            Session["EditEventSelectValue"] = dropDownEvents.SelectedItem.Value.ToString();
            Response.Redirect("EditEvent.aspx");
        }
    }
}