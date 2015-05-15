using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SearchEventsEventSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void searchEvents(object sender, EventArgs e)
        {
            Session["eventSearch"] = searchBar.Text;
            Response.Redirect("SearchEventResults.aspx");
        }
    }
}