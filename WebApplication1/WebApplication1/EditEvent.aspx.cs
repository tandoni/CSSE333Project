using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EditEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                eventName.Text = Session["EditEventSelectText"].ToString();

                hourTime2.Items.Clear();
                minuteTime2.Items.Clear();
                dropDownLocations2.Items.Clear();

                populateLocations();
                populateMinuteAndHours();
                defaultOrgData();
            }

        }

        public void editEvent2(object sender, EventArgs e)
        {
            try
            {
                String date = calender2.SelectedDate.Day.ToString();
                String month = calender2.SelectedDate.Month.ToString();
                String year = calender2.SelectedDate.Year.ToString();
                String hour = hourTime2.SelectedItem.Value.ToString();
                String minute = minuteTime2.SelectedItem.Value.ToString();
                String ampm = AMPM2.SelectedItem.Value.ToString();

                String evName = eventName.Text;
                String evDesc = editDesc2.Text;


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
                cmd.Parameters.Add("@eid", SqlDbType.Int).Value = Convert.ToInt32(Session["EditEventSelectValue"].ToString());
                cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value = evName;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = evDesc;
                cmd.Parameters.Add("@time", SqlDbType.VarChar).Value = finalString;
                cmd.Parameters.Add("@lid", SqlDbType.Int).Value = Convert.ToInt32(dropDownLocations2.SelectedItem.Value);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                dropDownLocations2.Items.Clear();
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
                hourTime2.Items.Add(new ListItem(i.ToString(), i.ToString()));
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
                minuteTime2.Items.Add(new ListItem(temp, temp));
            }
        }

        public void populateLocations()
        {
            dropDownLocations2.Items.Add(new ListItem("--Keep Current Location--", "-2"));
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "locationNames";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownLocations2.DataSource = reader;
            dropDownLocations2.DataValueField = "lid";
            dropDownLocations2.DataTextField = "name";
            dropDownLocations2.DataBind();
            con.Close();
        }

        public void defaultOrgData()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "eventDatum";
            SqlCommand cmd2 = new SqlCommand(commType2, con);

            cmd2.Parameters.Add("@eid", SqlDbType.VarChar).Value = Session["EditEventSelectValue"].ToString();
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd2.ExecuteReader();

            //dropDownLocations.SelectedItem.Value = reader["lid"].ToString();
            //dropDownLocations.DataValueField = "lid";
            //dropDownLocations.DataTextField = "name";
            //dropDownLocations.DataBind();

            while (reader.Read())
            {

                editDesc2.Text = reader["description"].ToString();
                String editTime = reader["time"].ToString();
                String[] datee = editTime.Split(' ');
                String[] timee = datee[1].Split(':');
                hourTime2.SelectedValue = timee[0];
                minuteTime2.SelectedValue = timee[1];
                AMPM2.SelectedValue = datee[2];
                calender2.SelectedDate = Convert.ToDateTime(datee[0]);
            }
            con.Close();
        }
    }
}