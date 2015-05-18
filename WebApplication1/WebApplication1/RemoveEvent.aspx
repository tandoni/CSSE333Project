<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemoveEvent.aspx.cs" Inherits="WebApplication1.RemoveEvent" %>


<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Remove an Event</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectEvent" ID="eventSelectBtn" CssClass="button" Text="Submit" />

        </div>
    </div>
</asp:Content>
