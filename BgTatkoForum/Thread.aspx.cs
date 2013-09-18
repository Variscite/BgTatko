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
                    var posts = thread[0].Posts;
                    this.FormViewPosts.DataSource = posts.ToList();

                    this.DataBind();
                }
                else
                {
                    Response.Redirect("~/");
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }

        protected void VoteUp_Command(object sender, CommandEventArgs e)
        {
            var ids = e.CommandArgument.ToString().Split(',');
            int threadId = Convert.ToInt32(ids[0]);
            string userId = ids[1];
            BgTatkoEntities context = new BgTatkoEntities();

            var vote = context.ThreadVotes.FirstOrDefault(v => v.ThreadId == threadId && v.UserId == userId);
            if (vote == null)
            {
                vote = new ThreadVote()
                {
                    UserId = userId,
                    ThreadId = threadId,
                    Value = 1
                };
                context.ThreadVotes.Add(vote);
                context.SaveChanges();
                this.FormViewThread.DataBind();
            }
            else
            {
                //throw new Exception();
            }
        }

        protected void VoteDown_Command(object sender, CommandEventArgs e)
        {
            var ids = e.CommandArgument.ToString().Split(',');
            int threadId = Convert.ToInt32(ids[0]);
            string userId = ids[1];
            BgTatkoEntities context = new BgTatkoEntities();

            var vote = context.ThreadVotes.FirstOrDefault(v => v.ThreadId == threadId && v.UserId == userId);
            if (vote == null)
            {
                vote = new ThreadVote()
                {
                    UserId = userId,
                    ThreadId = threadId,
                    Value = -1
                };
                context.ThreadVotes.Add(vote);
                context.SaveChanges();
                this.FormViewThread.DataBind();
            }
            else
            {
                //throw new Exception();
            }
        }

        protected void LinkButtonCreateNewPost_Click(object sender, EventArgs e)
        {
            if (!this.User.Identity.IsAuthenticated)
            {
                this.Response.Redirect("Account/Login.aspx");
            }
            this.sectionCreatePost.Visible = true;
        }

        protected void LinkButtonSavePost_Click(object sender, CommandEventArgs e)
        {
            var content = this.TextBoxPostContent.Text;
            var threadId = Convert.ToInt32(e.CommandArgument.ToString());

            BgTatkoEntities context = new BgTatkoEntities();
            var thread = context.Threads.Find(threadId);

            if (thread != null)
            {
                User user = context.Users.First(u => u.UserName == this.User.Identity.Name);
                Post post = new Post { Content = content, User = user };

                thread.Posts.Add(post);
                context.SaveChanges();
                Response.Redirect("~/Thread?threadId=" + threadId);
            }
            else
            {
                // Report error!
            }
        }

    }
}