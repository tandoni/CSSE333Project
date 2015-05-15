<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptRequestOrgSelect.aspx.cs" Inherits="WebApplication1.AcceptRequestOrgSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Select Organization</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Button runat="server" OnClick="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Select this Organization" />
                <a href="WelcomeUser.aspx">Go Back</a>
            </div>
        </form>
    </div>
</body>
</html>
