using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            BgTatkoEntities context = new BgTatkoEntities();
            var threads = context.Threads.ToList();
            this.ListViewThreads.DataSource = threads;
            this.ListViewThreads.DataBind();
        }

        protected void LinkButtonThread_Command(object sender, CommandEventArgs e)
        {
            int threadId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Thread.aspx?threadId=" + threadId);
        }
    }
}