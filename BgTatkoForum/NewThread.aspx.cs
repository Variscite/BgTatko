﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BgTatkoForum.Models;

namespace BgTatkoForum
{
    public partial class NewThread : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!this.User.Identity.IsAuthenticated)
	        {
                this.Response.Redirect("Account/Login.aspx");
	        }
            else
            {
                BgTatkoEntities context = new BgTatkoEntities();
                var categories = context.Categories.ToList();
                this.DropDownListCategory.DataSource = categories;
                this.DropDownListCategory.SelectedIndex = 0;
                this.DropDownListCategory.DataBind();
                
            }
            
        }

        protected void LinkButtonSaveThread_Click(object sender, EventArgs e)
        {
            BgTatkoEntities context = new BgTatkoEntities();
            BgTatkoForum.Models.Thread thread = new BgTatkoForum.Models.Thread();
            thread.Content = this.TextBoxContent.Text;
            thread.Title = this.TextBoxTitle.Text;
            thread.DateCreated = DateTime.Now;
            thread.CategoryId = this.DropDownListCategory.SelectedIndex + 1;
            var user = context.Users.Where(u => u.UserName == this.User.Identity.Name).FirstOrDefault();
            thread.Category = context.Categories.Find(thread.CategoryId);
            thread.User = user;
            thread.UserId = user.Id;
            context.Threads.Add(thread);
            user.Threads.Add(thread);
            context.SaveChanges();
            this.Response.Redirect("Thread/Thread?threadId=" + thread.ThreadId);
        }
    }
}