<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PeerReviewTool._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label> : 
    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />
    <asp:CheckBox ID="chkSuperUser" runat="server" Text="Super user"></asp:CheckBox><br />
    <asp:CheckBox ID="chkActive" runat="server" Text="Active"></asp:CheckBox><br />
    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="Button1_Click" />
</asp:Content>
