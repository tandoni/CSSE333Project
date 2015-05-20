<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RequestRepresentation.aspx.cs" Inherits="WebApplication1.RequestRepresentation" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectOrg" ID="orgSelectBtn" CssClass="button" Text="Request Representation" />
        </div>
    </div>
</asp:Content>
