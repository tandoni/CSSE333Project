<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AcceptMemberRequest.aspx.cs" Inherits="WebApplication1.AcceptMemberRequest" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="eventbox">
        <h1>Accept Requests</h1>
        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownNames" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ClientIDMode="Static" runat="server" OnClick="selectUsers" ID="userSelectBtn" CssClass="button" Text="Accept Request" />
            <a href="WelcomeUser.aspx" style="position: absolute; top: 250px">Go Back</a>
        </div>
    </div>
</asp:Content>
