﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="WebApplication1.RegisterUser" %>


<!DOCTYPE html>

<html>
<head>
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
</head>
<body>
    <div class="testbox">
        <h1>Register User</h1>

        <form runat="server">
            <hr>
            <%--<div class="accounttype">
                <asp:RadioButton runat="server" ID="radioOne"  />
                <label for="radioOne" class="radio">Personal</label>
                <asp:RadioButton runat="server" ID="radioTwo" />
                <label for="radioTwo" class="radio">Orgaion</label>
            </div>
            <hr>--%>
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox runat="server" ID="newUsername" placeholder="Username" />
            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <asp:TextBox runat="server" ID="newEmail" placeholder="Email" />
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox runat="server" ID="newName" placeholder="Name" />
            <label id="icon" for="name"><i class="icon-shield"></i></label>
            <asp:TextBox runat="server" TextMode="Password" ID="newPassword" placeholder="Password" />
            <%--<label id="icon" for="name"><i class="icon-shield"></i></label>
            <asp:TextBox runat="server" TextMode="Password" id="newConfirmPassword" placeholder="Confirm Password"  />--%>
            <%-- <div class="gender">
                <input type="radio" value="None" id="male" name="gender" checked />
                <label for="male" class="radio" chec>Male</label>
                <input type="radio" value="None" id="female" name="gender" />
                <label for="female" class="radio">Female</label>
            </div>--%>
            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" ValidationGroup="registerFields" OnClick="registerUser" ID="registerButton" CssClass="button" Text="Register" />
            <%--<a id="RegisterButton" href="#" class="button">Register</a>--%>
            
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
