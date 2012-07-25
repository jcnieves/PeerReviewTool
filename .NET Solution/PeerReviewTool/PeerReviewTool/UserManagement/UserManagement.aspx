<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="PeerReviewTool.UserManagement.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 260px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        User Management</p>
    <asp:Panel ID="pnlAddNewUser" runat="server" GroupingText="Add new user">
    <table>
    <tr>
       <td>
       email:
       </td>
       <td class="style1"><asp:TextBox ID="txtEmail" runat="server" 
               ValidationGroup="NewUserGroup" Width="249px"></asp:TextBox>
       </td>
       <td>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="txtEmail" ErrorMessage="e-mail is a required field" 
               ValidationGroup="NewUserGroup">*</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
               ControlToValidate="txtEmail" ErrorMessage="Enter a valid email address" 
               ForeColor="Red" 
               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
               ValidationGroup="NewUserGroup">*</asp:RegularExpressionValidator>
       </td>
      </tr>
      <tr>
       <td>
       Full name: 
       </td>
       <td class="style1">
         <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="NewUserGroup" 
               Width="249px"></asp:TextBox> 
       </td>
       <td>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ControlToValidate="txtUserName" ErrorMessage="Full name is required" 
               ValidationGroup="NewUserGroup">*</asp:RequiredFieldValidator>
       </td>
      </tr>
       <tr>
       <td>
           &nbsp;</td>
       <td class="style1">
           <asp:CheckBox ID="chkActive" runat="server" Text="Active" Checked="True" />
          <br />
       </td>
      </tr>
    </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ForeColor="#FF3300" ValidationGroup="NewUserGroup" />
    <br />
        <asp:Button ID="btnAddUser" runat="server" Text="Add user" 
            onclick="btnAddUser_Click" ValidationGroup="NewUserGroup" />
    </asp:Panel>
    <asp:Panel ID="pnlManageUsers" runat="server" GroupingText="Current users">
        <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" AllowPaging="True" AllowSorting="True" 
            DataSourceID="LinqDataSourceUsers" DataKeyNames="IDUser"  >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="IDUser" HeaderText="IDUser" ReadOnly="True" 
                    SortExpression="IDUser" />
                <asp:TemplateField HeaderText="User name" SortExpression="UserName">
                    <EditItemTemplate>                        
                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="e-mail" SortExpression="UserEmail">
                    <EditItemTemplate>                        
                        <asp:TextBox ID="txtUserEmail" runat="server" Text='<%# Bind("UserEmail") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserEmail") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Super user" SortExpression="SuperUserFlag">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("SuperUserFlag") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active" SortExpression="ActiveFlag">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("ActiveFlag") %>' 
                            Enabled="false" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkActive" runat="server" 
                            Checked='<%# Bind("ActiveFlag") %>' Enabled="true" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ButtonType="Image" 
                    CancelImageUrl="~/images/action_stop.gif" DeleteImageUrl="~/images/delete.png" 
                    EditImageUrl="~/images/edit.gif" UpdateImageUrl="~/images/icon_accept.gif" />
                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                    DeleteImageUrl="~/images/delete.png" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>     
        
       
        <asp:LinqDataSource ID="LinqDataSourceUsers" runat="server" 
            ContextTypeName="PRToolsLibrary.PRToolDataContext" EntityTypeName="" 
            OrderBy="UserName"             
            TableName="Userts" EnableDelete="True" EnableInsert="True" 
            EnableUpdate="True">
        </asp:LinqDataSource>
       
        
       
    </asp:Panel>
</asp:Content>
