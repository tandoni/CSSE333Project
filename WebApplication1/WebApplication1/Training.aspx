<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Training.aspx.cs" Inherits="WebApplication1.Training" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Navigation Controls</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h2>Using SiteMapPath</h2>


            <h2>Using a Horizontal Menu</h2>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem Text="Register Organization" NavigateUrl="~/RegisterOrganization.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Add Event" NavigateUrl="~/EventPage.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Edit Organization" NavigateUrl="~/EditOrganization.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Edit Event" NavigateUrl="~/EditEventOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Remove Organization" NavigateUrl="~/RemoveOrganization.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Remove Event" NavigateUrl="~/RemoveEventOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Request Representation" NavigateUrl="~/RequestRepresentation.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Accept Request for Representation Event" NavigateUrl="~/AcceptRequestOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Request Membership" NavigateUrl="~/RequestMemberorgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Accept Membership Request" NavigateUrl="~/AcceptMemberRequestOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Host Event" NavigateUrl="~/HostOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Register Branch" NavigateUrl="~/BranchOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Endorse Organization" NavigateUrl="~/EndorsesOrgSelect.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Rate Event" NavigateUrl="~/Rates.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Attend Event" NavigateUrl="~/AttendsEvent.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Manage Event" NavigateUrl="~/ManageOrgSelect.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>

        </div>
    </form>
</body>
</html>
