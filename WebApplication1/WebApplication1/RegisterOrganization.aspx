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
            <label id="icon" for="name" style="margin-top: 10px; margin-left:50px;"><i class="">Select your Headquarter location?</i></label>
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                
            </asp:DropDownList>
        </div>
        <asp:Button runat="server" OnClick="registerOrganization" ID="registerButton" CssClass="button" Text="Register" />
            <asp:RequiredFieldValidator EnableClientScript="true" ErrorMessage="Enter Name" runat="server" ControlToValidate="newOrgname">
            </asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="rgv2" ResourceName="rgv"
            runat="server" ControlToValidate="newOrgName" ErrorMessage="Please enter valid name."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ResourceName="rgv"
            runat="server" ControlToValidate="newWebsite" ErrorMessage="Please enter valid webpage."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ResourceName="rgv"
            runat="server" ControlToValidate="newDescription" ErrorMessage="Please enter valid description."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
        </div>
</asp:Content>
