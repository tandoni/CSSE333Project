<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HostsOrgSelect.aspx.cs" Inherits="WebApplication1.HostsOrgSelect" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Select Organization" />
        </div>
    </div>
</asp:Content>
