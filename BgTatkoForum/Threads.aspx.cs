using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class Threads : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

        }

        protected void LinkButtonThread_Command(object sender, CommandEventArgs e)
        {
            int threadId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Thread.aspx?threadId=" + threadId);
        }

        private IQueryable<BgTatkoForum.Models.Thread> threads =
            new BgTatkoEntities().Threads.OrderBy(t => t.DateCreated);

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BgTatkoForum.Models.Thread> GridThreads_GetData()
        {

            if (this.Request.Params["categoryId"] != null)
            {
                int categoryId = Convert.ToInt32(this.Request.Params["categoryId"]);
                this.threads = this.threads.Where(t => t.CategoryId == categoryId);
            }

            if (this.Request.Params["tagId"] != null)
            {
                int tagId = Convert.ToInt32(this.Request.Params["tagId"]);
                this.threads = this.threads.Where(t => t.Tags.Any(tg => tg.TagId == tagId));
            }

            return this.threads;
        }

        protected void SortByDate_Command(object sender, CommandEventArgs e)
        {
            this.threads = this.threads.OrderByDescending(t => t.DateCreated);
            this.GridThreads.DataBind();
        }

        protected void SortByVotes_Command(object sender, CommandEventArgs e)
        {
            this.threads = this.threads
                .OrderByDescending(t => t.ThreadVotes.Sum(v => v.Value))
                .ThenByDescending(t => t.DateCreated);
            this.GridThreads.DataBind();
        }

        protected void SortByPosts_Command(object sender, CommandEventArgs e)
        {
            this.threads = this.threads.OrderByDescending(t => t.Posts.Count);
            this.GridThreads.DataBind();
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
                this.GridThreads.DataBind();
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
                this.GridThreads.DataBind();
            }
            else
            {
                //throw new Exception();
            }
        }

        protected void SelectCategory_Command(object sender, CommandEventArgs e)
        {
            int categoryId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Threads.aspx?categoryId=" + categoryId);
        }

        protected void SelectTag_Command(object sender, CommandEventArgs e)
        {
            int tagId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Threads.aspx?tagId=" + tagId);
        }
    }
}