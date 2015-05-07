<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="WebApplication1.RegisterUser" %>


<!DOCTYPE html>

<html>
<head>
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">

    <script type="text/javascript">
      //  $('#element').click(function () {
            if ($('#radioOne').is(':checked')) {
                $('#personReg').show();
                $('#orgReg').hide();
            }
            if ($('#radioTwo').is(':checked')) {
                $("#personReg").hide();
                $("#orgReg").show();
            }
      //  });
    </script>

</head>
<body>
    <div class="testbox">
        <h1>Register User</h1>

        <form runat="server">
            <div class="accounttype">
                <asp:RadioButton  GroupName="orgGrp" runat="server" id="radioOne" />
                <label for="radioOne" class="radio">Personal</label>
                <asp:RadioButton GroupName="orgGrp" runat="server" id="radioTwo" />
                <label for="radioTwo" class="radio">Organization</label>
            </div>
            <hr />
            <div id="personReg">
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newUsername" placeholder="Username" />
                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox runat="server" ID="newEmail" placeholder="Email" />
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newName" placeholder="Name" />
                <label id="icon" for="name"><i class="icon-shield"></i></label>
                <asp:TextBox runat="server" TextMode="Password" ID="newPassword" placeholder="Password" />
            </div>
                
            <div id="orgReg">
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newOrgname" placeholder="Name" />
                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox runat="server" ID="newWebsite" placeholder="Website" />
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newDescription" placeholder="Description" />
                <label id="icon" for="name"><i class="icon-shield"></i></label>
                <asp:TextBox runat="server" ID="newHeadquarter" placeholder="Headquarter" />
            </div>

            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" ValidationGroup="registerFields" OnClick="registerUser" ID="registerButton" CssClass="button" Text="Register" />

            <div>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Username" runat="server" ControlToValidate="newUsername">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Password" runat="server" ControlToValidate="newPassword">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Email" runat="server" ControlToValidate="newEmail">
                </asp:RequiredFieldValidator>
            </div>
        </form>
    </div>
</body>
</html>
