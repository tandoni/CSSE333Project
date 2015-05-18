<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemoveEventOrgSelect.aspx.cs" Inherits="WebApplication1.RemoveEventOrgSelect" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfl1" ValidationGroup="selectOrg" ControlToValidate="dropDownOrgs" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
            <br />
            <asp:Button runat="server" OnClick="selectOrg" ValidationGroup="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Submit" />

        </div>
    </div>
</asp:Content>
