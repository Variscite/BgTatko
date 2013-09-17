using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            BgTatkoEntities context = new BgTatkoEntities();
            var categories = context.Categories.ToList();
            this.ListViewCategories.DataSource = categories;
            this.DataBind();
        }
    }
}