<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemoveOrganization.aspx.cs" Inherits="WebApplication1.RemoveOrganization" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Remove an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Submit" />

        </div>
    </div>
</asp:Content>
