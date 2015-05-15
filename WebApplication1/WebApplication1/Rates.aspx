<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="WebApplication1.Rates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Rate an Event</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList onclick="work()" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="rfl2" ControlToValidate="dropDownEvents" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
                <br />

                <label id="icon" for="name"><i class="icon-link"></i></label>
                <asp:TextBox runat="server" ValidationGroup="rates" ID="ratingText" placeholder="Enter a rating from 0 to 10"></asp:TextBox>
                <asp:RangeValidator ID="rangeVal" ValidationGroup="rates" ControlToValidate="ratingText" runat="server" EnableClientScript="true" MinimumValue="0.0" MaximumValue="10.0" Type="Double" ErrorMessage="Please enter b/w 0-10"></asp:RangeValidator>
                <br />
                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc2" />

            </div>

            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" ValidationGroup="rates" OnClick="rateEventBtn" ID="rateEvent" CssClass="button" Text="Submit" />
            <a href="WelcomeUser.aspx">Go Back</a>
        </form>
    </div>
</body>
</html>