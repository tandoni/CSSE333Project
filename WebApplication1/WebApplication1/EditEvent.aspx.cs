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
    public partial class EditEvent : System.Web.UI.Page
    {
        public String date;
        public String month;
        public String year;
        public String hour;
        public String minute;
        public String ampm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                date = calender1.SelectedDate.Day.ToString();
                month = calender1.SelectedDate.Month.ToString();
                year = calender1.SelectedDate.Year.ToString();
                hour = hourTime.SelectedItem.Value.ToString();
                minute = minuteTime.SelectedItem.Value.ToString();
                ampm = AMPM.SelectedItem.Value.ToString();

                dropDownEvents.Items.Clear();
                hourTime.Items.Clear();
                minuteTime.Items.Clear();
                dropDownLocations.Items.Clear();
            }

            populateEvents();
            populateLocations();
            populateMinuteAndHours();
        }

        public void editEvent(object sender, EventArgs e)
        {
            try
            {
                String evName = eventName.Text;
                String evDesc = editDesc.Text;
               

                String finalString = month.Trim() + "/" + date.Trim() + "/" + year.Trim()
                   + " " + hour.Trim() + ":" + minute.Trim() + " " + ampm.Trim();

                String userid = Session["UserName"].ToString();
                String password = Session["Password"].ToString();

                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection conn = new SqlConnection(connString);

                String sp_add = "editEvent";

                SqlCommand cmd = new SqlCommand(sp_add, conn);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@uname", SqlDbType.VarChar).Value = userid;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@eid", SqlDbType.Int).Value = Convert.ToInt32(dropDownEvents.SelectedItem.Value.ToString());
                cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value = evName;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = evDesc;
                cmd.Parameters.Add("@time", SqlDbType.VarChar).Value = finalString;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                dropDownEvents.Items.Clear();
                dropDownLocations.Items.Clear();
                populateEvents();
                populateLocations();
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You edited an event successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }

        public void populateMinuteAndHours()
        {
            for (int i = 1; i < 13; i++)
            {
                hourTime.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            for (int j = 0; j < 60; j++)
            {
                String temp;
                if (j < 10)
                {
                    temp = "0" + j.ToString();
                }
                else
                {
                    temp = j.ToString();
                }
                minuteTime.Items.Add(new ListItem(temp, temp));
            }
        }

        public void populateLocations()
        {
            dropDownLocations.Items.Add(new ListItem("None", "-1"));
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
    }
}