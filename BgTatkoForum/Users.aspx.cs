﻿using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var users = from user in new BgTatkoEntities().UserDetails.Include("User").ToList()
                        select new { 
                            FullName = user.FirstName + " " + user.LastName, 
                            Id = user.UserId, 
                            Avatar = user.Avatar,
                            DisplayName = user.User.UserName, 
                            Score = (user.User.Threads.Count + user.User.ThreadVotes.Count)*10 + 
                                    (user.User.Posts.Count + user.User.PostVotes.Count)*5 + 
                                    (user.User.Comments.Count) * 1};
            

            if (!Page.IsPostBack)
            {
                this.GridViewUsers.DataSource = users;
                this.DataBind();
            }
        }

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        /*
        public IQueryable<UserDetail> GridViewUsers_GetData()
        {
            BgTatkoEntities context = new BgTatkoEntities();
            var users = from user in new BgTatkoEntities().UserDetails.Include("User")
                        select new
                        {
                            FullName = user.FirstName + " " + user.LastName,
                            Id = user.UserId,
                            Avatar = user.Avatar,
                            DisplayName = user.User.UserName,
                            Score = (user.User.Threads.Count + user.User.ThreadVotes.Count) * 10 +
                                    (user.User.Posts.Count + user.User.PostVotes.Count) * 5 +
                                    (user.User.Comments.Count) * 1
                        };
            return (IQueryable<UserDetail>)(users.OrderBy(us => us.Score));
        }
        */


    }
}