using BgTatkoForum.Models;
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
                        select new { FullName = user.FirstName + " " + user.LastName, Id = user.UserId, Avatar = user.Avatar,
                        DisplayName = user.User.UserName};
            

            if (!Page.IsPostBack)
            {
                this.GridViewUsers.DataSource = users;
                this.DataBind();
            }
        }
    }
}