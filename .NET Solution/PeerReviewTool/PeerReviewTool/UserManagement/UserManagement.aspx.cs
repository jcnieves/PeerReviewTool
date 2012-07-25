using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PRToolsLibrary;
using PRToolsLibrary.MVP.Views;

namespace PeerReviewTool.UserManagement
{
    public partial class UserManagement : System.Web.UI.Page       
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            PRToolDataContext db = new PRToolDataContext();

            Usert user = new Usert();
            user.UserName = txtUserName.Text;
            user.UserEmail = txtEmail.Text;
            user.SuperUserFlag = false;
            user.ActiveFlag = chkActive.Checked;

            db.Userts.InsertOnSubmit(user);
            db.SubmitChanges();

            grdUsers.DataBind();

        }
    }
}