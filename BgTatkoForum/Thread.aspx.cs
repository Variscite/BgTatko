using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
                    this.FormViewPosts.DataSource = thread[0].Posts;
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

        protected void VoteUp_Command(object sender, CommandEventArgs e)
        {
            var ids = e.CommandArgument.ToString().Split(',');
            int threadId = Convert.ToInt32(ids[0]);
            string userId = ids[1];
            BgTatkoEntities context = new BgTatkoEntities();

            //TODO: validation
            context.ThreadVotes.Add(new ThreadVote()
            {
                UserId = userId,
                ThreadId = threadId,
                Value = 1
            });

            context.SaveChanges();
            this.FormViewThread.DataBind();
        }

        protected void VoteDown_Command(object sender, CommandEventArgs e)
        {
            var ids = e.CommandArgument.ToString().Split(',');
            int threadId = Convert.ToInt32(ids[0]);
            string userId = ids[1];
            BgTatkoEntities context = new BgTatkoEntities();

            //TODO: validation
            context.ThreadVotes.Add(new ThreadVote()
            {
                UserId = userId,
                ThreadId = threadId,
                Value = -1
            });

            context.SaveChanges();
            this.FormViewThread.DataBind();
        }

    }
}