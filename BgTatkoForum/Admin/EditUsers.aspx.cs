using BgTatkoForum.Models;
using Error_Handler_Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BgTatkoForum.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.User.IsInRole("Admin"))
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

        }

        private IQueryable<BgTatkoForum.Models.User> threads =
            new BgTatkoEntities().Users.Include("UserDetails").OrderBy(u => u.UserName);

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BgTatkoForum.Models.User> GridViewUsers_GetData()
        {
            return this.threads;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewUsers_UpdateItem(string id)
        {
            try
            {
                BgTatkoEntities context = new BgTatkoEntities();
                BgTatkoForum.Models.User item = context.Users.Find(id);
                // Load the item here, e.g. item = MyDataLayer.Find(id);
                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                    return;
                }
                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    // Save changes here, e.g. MyDataLayer.SaveChanges();
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex);
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewUsers_DeleteItem(int id)
        {
            try
            {
                BgTatkoEntities context = new BgTatkoEntities();
                BgTatkoForum.Models.User item = context.Users.Find(id);
                // Load the item here, e.g. item = MyDataLayer.Find(id);
                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                    return;
                }
                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    // Save changes here, e.g. MyDataLayer.SaveChanges();
                    context.Users.Remove(item);
                    
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex);
            }
        }
    }
}