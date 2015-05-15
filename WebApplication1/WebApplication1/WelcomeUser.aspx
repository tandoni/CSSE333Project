<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeUser.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <form runat="server">
        <asp:Button CssClass="button" Text="Logout" runat="server" ID="logoutBtn" OnClick="logout" style="float: right" />
    </form>
</head>
<body>
    <h1>WELCOME
        <asp:Label runat="server" ID="userLabel"></asp:Label>... :)</h1>
    <table border="1">
        <tr>
            <td><a href="RegisterOrganization.aspx">Register an Organization</a></td>
            <td><a href="EventPage.aspx">Add an Event</a></td>
            <td><a href="EditOrganization.aspx">Edit an Organization</a></td>
        </tr>
        <tr>
            <td><a href="EditEventOrgSelect.aspx">Edit an Event</a></td>
            <td><a href="RemoveOrganization.aspx">Remove an Organization</a></td>
            <td><a href="RemoveEventOrgSelect.aspx">Remove an Event</a></td>
        </tr>
        <tr>
            <td><a href="RequestRepresentation.aspx">Request Representation</a></td>
            <td><a href="AcceptRequestOrgSelect.aspx">Accept Request for Representation</a></td>
            <td><a href="RequestMemberOrgSelect.aspx">Request Membership</a></td>
        </tr>
        <tr>
            <td><a href="AcceptMemberRequestOrgSelect.aspx">Accept Request for Membership</a></td>
            <td><a href="HostsOrgSelect.aspx">Host an Event</a></td>
            <td><a href="BranchOrgSelect.aspx">Register a Branch</a></td>
        </tr>
        <tr>
            <td><a href="EndorsesSelectOrg.aspx">Endorse an Organization</a></td>
            <td><a href="Rates.aspx">Rate an Event</a></td>
            <td><a href="AttendsEvent.aspx">Attend an Event</a></td>
        </tr>
        <tr>
            <td><a href="ManageOrgSelect.aspx">Manage an Event</a></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</body>
</html>
