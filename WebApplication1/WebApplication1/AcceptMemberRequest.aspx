<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptMemberRequest.aspx.cs" Inherits="WebApplication1.AcceptMemberRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Accept Requests</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownNames" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Button runat="server" OnClick="selectUsers" ID="userSelectBtn" CssClass="button" Text="Accept Request" />
                <a href="WelcomeUser.aspx" style="position:absolute; top: 250px">Go Back</a>
            </div>
        </form>
    </div>
</body>
</html>
