<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EndorsesOtherOrg.aspx.cs" Inherits="WebApplication1.EndorsesOtherOrg" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <br />
            <asp:TextBox ID="endDesc" runat="server" placeholder="Description"></asp:TextBox>
            <br />
            <asp:Button runat="server" OnClick="endorse" ID="orgSelectBtn" CssClass="button" Text="Endorse This!" />
            <a href="WelcomeUser.aspx">Go Back</a>
        </div>
    </div>
</asp:Content>
