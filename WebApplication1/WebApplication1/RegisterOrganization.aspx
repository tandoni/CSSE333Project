<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterOrganization.aspx.cs" Inherits="WebApplication1.RegisterOrganization" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="editOrgBox">
        <h1>Register Organization</h1>
        <div>
            <hr />
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox runat="server" ID="newOrgname" placeholder="Organization Name" />
            <br />
            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <asp:TextBox runat="server" ID="newWebsite" placeholder="Website" />
            <br />
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox runat="server" ID="newDescription" placeholder="Description" />
            <label id="icon" for="name" style="margin-top: 10px"><i class="">Select your Headquarter location?</i></label>
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                <asp:ListItem Value="None" Text="None" Selected="True">
                </asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button runat="server" ValidationGroup="registerFields" OnClick="registerOrganization" ID="registerButton" CssClass="button" Text="Register" />
        <div>
            <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Name" runat="server" ControlToValidate="newOrgname">
            </asp:RequiredFieldValidator>
        </div>
    </div>
</asp:Content>
