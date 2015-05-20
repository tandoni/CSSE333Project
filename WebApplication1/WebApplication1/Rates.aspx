<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="WebApplication1.Rates" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Rate an Event</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" onclick="work2()" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfl2" ControlToValidate="dropDownEvents" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
            <br />

            <label id="icon" for="name"><i class="icon-smile"></i></label>
            <asp:TextBox runat="server" ID="ratingText" placeholder="Enter a rating from 0 to 10"></asp:TextBox>
            <asp:RangeValidator ID="rangeVal" ControlToValidate="ratingText" runat="server" EnableClientScript="true" MinimumValue="0.0" MaximumValue="10.0" Type="Double" ErrorMessage="Please enter b/w 0.0-10.0"></asp:RangeValidator>
            <br />
            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc2" />

        </div>
        <asp:Button runat="server" OnClick="rateEventBtn" ID="rateEvent" CssClass="button" Text="Submit" />
        <asp:RegularExpressionValidator ID="rgv2" ResourceName="rgv"
            runat="server" ControlToValidate="editDesc2" ErrorMessage="Please enter valid webpage."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
    </div>
</asp:Content>
