<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEventResults.aspx.cs" Inherits="WebApplication1.SearchEventResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        <div style="position:absolute; margin-left:100px; top:200px;">
            <asp:DataGrid ID="gridView1" runat="server"></asp:DataGrid>
        </div>
    </form>
</body>
</html>
