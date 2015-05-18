<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditEvent.aspx.cs" Inherits="WebApplication1.EditEvent" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Edit an Event</h1>
        <hr>
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" onclick="work1()" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfl2" ControlToValidate="dropDownEvents" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
            <br />

            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox ClientIDMode="Static" runat="server" placeholder="Edit Event Name" ID="eventName"></asp:TextBox>
            <br />
            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc2" />
            <br />
            <asp:Calendar runat="server" ID="calender2"></asp:Calendar>
            <asp:DropDownList ClientIDMode="Static" ID="hourTime2" runat="server" AppendDataBoundItems="true">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" ID="minuteTime2" runat="server" AppendDataBoundItems="true">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" ID="AMPM2" runat="server">
                <asp:ListItem Value="AM"></asp:ListItem>
                <asp:ListItem Value="PM"></asp:ListItem>
            </asp:DropDownList>
            <br />

            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations2" runat="server">
            </asp:DropDownList>

        </div>

        <asp:Button runat="server" OnClick="editEvent2" ID="editEventBtn2" CssClass="button" Text="Submit" />

    </div>
</asp:Content>
