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
    public partial class SearchEventResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            searchEventResults();
        }

        public void searchEventResults()
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                String commType2 = "searchEvents";
                SqlCommand cmd2 = new SqlCommand(commType2, con);
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("@str", SqlDbType.VarChar).Value = Session["eventSearch"].ToString();
                SqlDataReader reader = cmd2.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Name", typeof(string));
                    dt.Columns.Add("Description", typeof(string));
                    dt.Columns.Add("Time", typeof(string));
                    dt.Columns.Add("Locate me!", typeof(string));

                    while (reader.Read())
                    {
                        String name = reader["name"].ToString();
                        String desc = reader["description"].ToString();
                        String time = reader["time"].ToString();
                        String lat = reader["latitude"].ToString();
                        String lon = reader["longitude"].ToString();
                        String finalLocString;

                        if (lat.Equals("") || lon.Equals(""))
                        {
                            finalLocString = "No Location Specified!";
                        }
                        else
                        {
                            finalLocString = "<a href=\"http://maps.google.com/maps?q=" + lat + "," + lon + "\">Locate Me!</a>";
                        }
                        dt.Rows.Add(name, desc, time, finalLocString);
                    }

                    gridView1.DataSource = dt;
                    gridView1.DataBind();
                }
                con.Close();
                if (gridView1.Items.Count == 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('no results found. :(');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('results below. :)');", true);
                }
                reader.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}