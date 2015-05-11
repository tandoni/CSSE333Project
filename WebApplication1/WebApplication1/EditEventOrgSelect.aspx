<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEventOrgSelect.aspx.cs" Inherits="WebApplication1.EditEventOrgSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Edit an Event</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList onclick="work()" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="rfl1" ValidationGroup="selectOrg" ControlToValidate="dropDownOrgs" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
                <br />
                <asp:Button runat="server" OnClick="selectOrg" ValidationGroup="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Submit" />
            
            </div>
        </form>
    </div>
</body>
</html>
