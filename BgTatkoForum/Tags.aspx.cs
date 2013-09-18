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
           
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Tag> GridViewTags_GetData()
        {
            BgTatkoEntities context = new BgTatkoEntities();
            return context.Tags.Include("Threads").OrderByDescending(t=> t.Threads.Count);
        }

        protected void LinkButtonTag_Command(object sender, CommandEventArgs e)
        {
            int tagId = Convert.ToInt32(e.CommandArgument);
            this.Response.Redirect("Threads.aspx?tagId=" + tagId);
        }
    }
}