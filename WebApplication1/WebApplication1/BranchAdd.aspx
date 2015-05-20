<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BranchAdd.aspx.cs" Inherits="WebApplication1.BranchAdd" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>New Branch</h1>

            <hr />
            <div id="editOrgBox">
                <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Button runat="server" OnClick="selectLoc" ID="locSelectBtn" CssClass="button" Text="Register a Branch" />
            </div>
    </div>
    </asp:Content>