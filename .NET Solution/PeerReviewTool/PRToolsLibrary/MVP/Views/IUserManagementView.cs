using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace PRToolsLibrary.MVP.Views
{
    interface IUserManagementView
    {
        string UserName
        {
            get;
            set;
        }

        string UserEmail
        {
            get;
            set;
        }

        bool IsActive
        {
            get;
            set;
        }

        void refreshUsersGrid();              
    }
}
