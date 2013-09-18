using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["userId"];
            var tatko = new BgTatkoEntities().UserDetails.Include("User")
                            .FirstOrDefault(use => use.UserId == id);
            UserDisplayModel userDetails = new UserDisplayModel()
            {
                FullName = tatko.FirstName + " " + tatko.LastName,
                Id = tatko.UserId,
                Member = (DateTime.Now - tatko.DateRegistered).Days,
                Avatar = tatko.Avatar,
                DisplayName = tatko.User.UserName,
                UserDetails = new UserDetail()
                {
                    WebSite = tatko.WebSite,
                    About = tatko.About
                },
                User = new User()
                {
                    Threads = tatko.User.Threads,
                    Comments = tatko.User.Comments,
                    Posts = tatko.User.Posts
                },
                Score = (tatko.User.Threads.Count + tatko.User.ThreadVotes.Count) * 10 +
                        (tatko.User.Posts.Count + tatko.User.PostVotes.Count) * 5 +
                        (tatko.User.Comments.Count) * 1
            };
            this.FormViewUserDetails.DataSource = new List<UserDisplayModel>() { userDetails };

            this.ListViewPosts.DataSource = tatko.User.Posts.ToList();
            this.DataBind();
        }

        protected void Avatar_PreRender(object sender, EventArgs e)
        {
            var image = (Image)sender;
            var userId = this.Request.Params["userId"];
            image.ImageUrl = "~/ImageHandler.ashx?userId=" + userId; //new BgTatkoEntities().UserDetails.Include("Users").
        }

        protected void Thread_Command(object sender, CommandEventArgs e)
        {
            int threadId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("~/Thread.aspx?threadId=" + threadId);
        }
        
        protected void Thread_Command(object sender, CommandEventArgs e)
        {
            int categoryId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("~/Thread.aspx?categoryId=" + categoryId);
        }
    }
}