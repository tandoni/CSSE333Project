<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditEventSelectEvent.aspx.cs" Inherits="WebApplication1.EditEventSelectEvent" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="eventbox">
        <h1>Select Event</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectEvent" ID="eventSelectBtn" CssClass="button" Text="Select this Event" />
        </div>
    </div>
</asp:Content>
