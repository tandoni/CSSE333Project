<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BranchOrgSelect.aspx.cs" Inherits="WebApplication1.BranchOrgSelect" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select Organization</h1>

            <hr />
            <div id="editOrgBox">
                <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Button runat="server" OnClick="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Select this Organization" />
                <a href="WelcomeUser.aspx">Go Back</a>
            </div>
    </div>
    </asp:Content>