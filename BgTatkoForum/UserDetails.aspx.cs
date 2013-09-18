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
            var user = new BgTatkoEntities().UserDetails.Include("User").Where(use => use.UserId == id).ToList();
            this.FormViewUserDetails.DataSource = user;
            this.DataBind();
        }
    }
}