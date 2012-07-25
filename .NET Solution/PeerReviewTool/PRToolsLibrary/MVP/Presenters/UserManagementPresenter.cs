using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PRToolsLibrary.MVP.Views;

namespace PRToolsLibrary.MVP.Presenters
{
    class UserManagementPresenter
    {
        private IUserManagementView _view;

        public UserManagementPresenter(IUserManagementView view)
        {
            _view = view;
        }

        public void addNewUser()
        {
            PRToolDataContext db = new PRToolDataContext();

            Usert user = new Usert();
            user.UserName = _view.UserName;
            user.UserEmail = _view.UserEmail;
            user.SuperUserFlag = false;
            user.ActiveFlag = _view.IsActive;

            db.Userts.InsertOnSubmit(user);
            db.SubmitChanges();            
        }

        public void refreshUsers()
        {
            _view.refreshUsersGrid();
        }
    }
}
