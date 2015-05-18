<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="WebApplication1.RegisterUser" %>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="testbox">
        <h1>Register User</h1>

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
                
           <asp:Button runat="server" ValidationGroup="registerFields" OnClick="registerUser" ID="registerButton" CssClass="button" Text="Register" />
            <div>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Username" runat="server" ControlToValidate="newUsername">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Password" runat="server" ControlToValidate="newPassword">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Email" runat="server" ControlToValidate="newEmail">
                </asp:RequiredFieldValidator>
            </div>
    </div>
    </asp:Content>