<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="WebApplication1.RegisterUser" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />

</head>
<body>

    <div class="testbox">
        <h1>Register User</h1>
        <form runat="server">
            <hr />
            <div id="personReg">
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newUsername" placeholder="Username" />
                <br />

                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox runat="server" ID="newEmail" placeholder="Email" />
                <br />

                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newName" placeholder="Name" />
                <br />

                <label id="icon" for="name"><i class="icon-shield"></i></label>
                <asp:TextBox runat="server" TextMode="Password" ID="newPassword" placeholder="Password" />
            </div>

            <asp:Button runat="server" OnClick="registerUser" ID="registerButton" CssClass="button" Text="Register" />
            <div>
                <asp:RequiredFieldValidator EnableClientScript="true" ErrorMessage="Enter Username" runat="server" ControlToValidate="newUsername">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ErrorMessage="Enter Password" runat="server" ControlToValidate="newPassword">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ErrorMessage="Enter Email" runat="server" ControlToValidate="newEmail">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="rgv2" ResourceName="rgv"
                    runat="server" ControlToValidate="newUsername" ErrorMessage="Please enter valid username."
                    ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ResourceName="rgv"
                    runat="server" ControlToValidate="newEmail" ErrorMessage="Please enter valid email."
                    ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ResourceName="rgv"
                    runat="server" ControlToValidate="newname" ErrorMessage="Please enter valid name."
                    ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ResourceName="rgv"
                    runat="server" ControlToValidate="newPassword" ErrorMessage="Please enter valid password."
                    ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
            </div>
        </form>
    </div>
</body>
</html>
