<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebApplication1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Universal Planner</title>
    <link rel="stylesheet" type="text/css" href="Content/LoginSheet.css" />
</head>
<body>
    <div class="container">
        <section id="content">
            <form id="loginForm" runat="server">
                <div>
                    <h1>Login/Sign Up</h1>
                    <div>
                        <asp:TextBox type="text" placeholder="username" required="" ID="username" runat="server" />
                    </div>
                    <div>
                        <asp:TextBox type="password" placeholder="Password" required="" ID="password" runat="server" />
                    </div>
                    <div>
                        <asp:Button ID="loginBtn" OnClick="loginValidate" Text="Log in" runat="server" />
                        <!--<input type="submit" value="Log in" /> -->
                        <a href="#">Lost your password?</a>
                        <a href="RegisterUser.aspx" >Register</a>
                    </div>
                </div>
            </form>
            <div>
                <asp:Label ID="errorLogin" runat="server"></asp:Label>
            </div>
        </section>
    </div>
</body>
</html>
