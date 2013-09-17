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

        }

        protected void LinkButtonThread_Command(object sender, CommandEventArgs e)
        {
            int threadId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Thread.aspx?threadId=" + threadId);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BgTatkoForum.Models.Thread> GridThreads_GetData()
        {
            BgTatkoEntities context = new BgTatkoEntities();
            var threads = context.Threads.AsQueryable();

            if (this.Request.Params["categoryId"] != null)
            {
                int categoryId = Convert.ToInt32(this.Request.Params["categoryId"]);
                threads = threads.Where(t => t.CategoryId == categoryId);
            }

            if (this.Request.Params["tagId"] != null)
            {
                int tagId = Convert.ToInt32(this.Request.Params["tagId"]);
                threads =
                    from thr in threads
                    from tag in thr.Tags
                    where tag.TagId == tagId
                    select thr;
            }

            return threads.OrderByDescending(t => t.DateCreated);
        }

        protected void SortByDate_Command(object sender, CommandEventArgs e)
        {

        }

        protected void SortByVotes_Command(object sender, CommandEventArgs e)
        {

        }

        protected void SortByPosts_Command(object sender, CommandEventArgs e)
        {

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
            this.GridThreads.DataBind();
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
            this.GridThreads.DataBind();
        }
    }
}