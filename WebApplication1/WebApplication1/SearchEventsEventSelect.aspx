<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEventsEventSelect.aspx.cs" Inherits="WebApplication1.SearchEventsEventSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/LoginPage.aspx">Universal Planner</a>
                </div>
            </div>
        </div>
        <div class="eventbox" style="top: 100px;">
            <h1>Search Events</h1>
            <hr />
            <div id="editOrgBox">
                <asp:TextBox Style="margin-left: 20px;" runat="server" ID="searchBar" placeholder="Search here..."></asp:TextBox>
                <br />
                <asp:Button runat="server" OnClick="searchEvents" ID="eventSearchBtn" CssClass="button" Text="Search" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ResourceName="rgv"
                    runat="server" ControlToValidate="searchBar" ErrorMessage="Please enter valid characters."
                    ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>

            </div>
        </div>
    </form>
</body>
</html>
