<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEventsEventSelect.aspx.cs" Inherits="WebApplication1.SearchEventsEventSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Search Events</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:TextBox runat="server" ID="searchBar" placeholder="Search here..."></asp:TextBox>
                <br />
                <asp:Button runat="server" OnClick="searchEvents" ID="eventSearchBtn" CssClass="button" Text="Search" />
                <a href="LoginPage.aspx">Go Back</a>
            </div>
        </form>
    </div>
</body>
</html>