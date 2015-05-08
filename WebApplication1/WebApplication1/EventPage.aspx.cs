using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EventPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateMinuteAndHours();
            populateOrgs();
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

        public void populateOrgs()
        {
            String connString = ConfigurationManager.AppSettings["connectionInfo"];
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String commType2 = "myOrganizations";
            SqlCommand cmd2 = new SqlCommand(commType2, con);
            cmd2.CommandType = CommandType.StoredProcedure;

            var data = Encoding.ASCII.GetBytes("123");
            var sha1 = new SHA1CryptoServiceProvider();
            var sha1data = sha1.ComputeHash(data);

            String hashedPassword = Encoding.ASCII.GetString(sha1data);


            cmd2.Parameters.Add("@uname", SqlDbType.VarChar).Value = "123";
            cmd2.Parameters.Add("@pwd", SqlDbType.VarChar).Value = hashedPassword;
            SqlDataReader reader = cmd2.ExecuteReader();

            dropDownOrgs.DataSource = reader;
            dropDownOrgs.DataValueField = "name";
            dropDownOrgs.DataTextField = "name";
            dropDownOrgs.DataBind();
            con.Close();
        }

        public void eventAdd(object sender, EventArgs e)
        {
            try {
                String evName = newEventName.Text;
                String eventDescription = newDescription.Text;
                String dateHour = hourTime.SelectedValue.ToString();
                String dateMinute = minuteTime.SelectedItem.Value;
                String ampm = AMPM.SelectedItem.Value.ToString();
                String year = calender1.SelectedDate.Year.ToString();
                String month = calender1.SelectedDate.Month.ToString();
                String date = calender1.SelectedDate.Day.ToString();

                String finalString = month.Trim() + "/" + date.Trim() + "/" + year.Trim()
                    + " " + dateHour.Trim() + ":" + dateMinute.Trim() + " " + ampm.Trim();

                var data = Encoding.ASCII.GetBytes("123");
                var sha1 = new SHA1CryptoServiceProvider();
                var sha1data = sha1.ComputeHash(data);

                String hashedPassword = Encoding.ASCII.GetString(sha1data);


                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection conn = new SqlConnection(connString);

                String sp_add = "addEvent";

                SqlCommand cmd = new SqlCommand(sp_add, conn);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@uname", SqlDbType.VarChar).Value = "123";
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar).Value = hashedPassword;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = dropDownOrgs.SelectedItem.Value;
                cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value = evName;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = eventDescription;
                cmd.Parameters.Add("@time", SqlDbType.VarChar).Value = finalString;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('You added an event successfully');", true);
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}