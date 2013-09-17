using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class Thread : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var threadIdString = Request.Params["threadId"];
            int threadId;

            if (int.TryParse(threadIdString, out threadId) && threadId > 0)
            {
                BgTatkoEntities context = new BgTatkoEntities();
                var thread = context.Threads.Include("Posts").Where(t => t.ThreadId == threadId).ToList();
                if (thread != null)
                {
                    this.FormViewThread.DataSource = thread;
                    this.DataBind();
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}