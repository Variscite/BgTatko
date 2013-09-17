using BgTatkoForum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum
{
    public partial class Tags : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BgTatkoEntities context = new BgTatkoEntities();
            var tags = context.Tags.ToList();
            this.ListViewTags.DataSource = tags;
            this.DataBind();
        }
    }
}