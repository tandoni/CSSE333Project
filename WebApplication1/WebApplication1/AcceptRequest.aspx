﻿<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AcceptRequest.aspx.cs" Inherits="WebApplication1.AcceptRequest" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Accept Requests</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownNames" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button runat="server" OnClick="selectUsers" ID="userSelectBtn" CssClass="button" Text="Accept Request" />
        </div>
    </div>
</asp:Content>
