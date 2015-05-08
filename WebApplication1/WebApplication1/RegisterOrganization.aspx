<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterOrganization.aspx.cs" Inherits="WebApplication1.RegisterOrganization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="testbox">
        <h1>Register Organization</h1>
        <form runat="server">
            <div>
                <hr />
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newOrgname" placeholder="Organization Name" />
                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox runat="server" ID="newWebsite" placeholder="Website" />
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newDescription" placeholder="Description" />
                <label id="icon" for="name" style="margin-top: 10px"><i class="">Select your Headquarter location?</i></label>
                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                    <asp:ListItem Value="None" Text="None" Selected="True">
                    </asp:ListItem>
                </asp:DropDownList>
            </div>
            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" ValidationGroup="registerFields" OnClick="registerOrganization" ID="registerButton" CssClass="button" Text="Register" />
            <div>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Name" runat="server" ControlToValidate="newOrgname">
                </asp:RequiredFieldValidator>
            </div>
        </form>
    </div>

</body>
</html>
