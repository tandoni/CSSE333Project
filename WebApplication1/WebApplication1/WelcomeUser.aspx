<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeUser.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>WELCOME <asp:Label runat="server" ID="userLabel"></asp:Label>... :) <a href="LoginPage.aspx" style="float:right">Logout</a></h1>
    <a href="RegisterOrganization.aspx">Register an Organization</a>
    <a href="EventPage.aspx">Add an Event</a>
    <a href="EditOrganization.aspx">Edit an Organization</a>
    <a href="EditEventOrgSelect.aspx">Edit an Event</a>
    <a href="RemoveOrganization.aspx">Remove an Organization</a>
    <a href="RemoveEventOrgSelect.aspx">Remove an Event</a>
    <a href="RequestRepresentation.aspx">Request Representation</a>
</body>
</html>
