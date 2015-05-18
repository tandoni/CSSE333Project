<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HostsEvent.aspx.cs" Inherits="WebApplication1.HostsEvent" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Select an event to host</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="hostEvent" ID="host" CssClass="button" Text="Host this event" />
        </div>
    </div>
</asp:Content>
