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
    public partial class SearchOrgResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            searchOrgResults();
        }

        public void searchOrgResults()
        {
            try
            {
                String connString = ConfigurationManager.AppSettings["connectionInfo"];
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                String commType2 = "searchOrgs";
                SqlCommand cmd2 = new SqlCommand(commType2, con);
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("@str", SqlDbType.VarChar).Value = Session["orgSearch"].ToString();
                SqlDataReader reader = cmd2.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Name", typeof(string));
                    dt.Columns.Add("Webpage", typeof(string));
                    dt.Columns.Add("Description", typeof(string));

                    while (reader.Read())
                    {
                        String name = reader["name"].ToString();
                        String webpage = reader["webpage"].ToString();
                        System.Uri uriResult;
                        String url;
                        bool result = Uri.TryCreate(webpage, UriKind.Absolute, out uriResult) && uriResult.Scheme == Uri.UriSchemeHttp;
                        if (result)
                        {
                            url = "<a target='_blank' href='" + webpage + "'>" + webpage + "</a>";
                        }
                        else
                        {
                            url = webpage;
                        }
                        String description = reader["description"].ToString();

                        dt.Rows.Add(name, url, description);
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
                 //   ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('results below. :)');", true);
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