<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventPage.aspx.cs" Inherits="WebApplication1.EventPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Add</title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="eventbox">
        <h1>Add an Event</h1>

        <form runat="server">
            <hr />
            <div id="eventAdd">
                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" ID="newEventName" placeholder="Event Name" />

                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox runat="server" ID="newDescription" placeholder="Description" />

                <asp:Calendar runat="server" ID="calender1"></asp:Calendar>
                <asp:DropDownList ID="hourTime" runat="server" AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="minuteTime" runat="server" AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="AMPM" runat="server">
                    <asp:ListItem Value="AM"></asp:ListItem>
                    <asp:ListItem Value="PM"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
                </asp:DropDownList>
                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                    <asp:ListItem Value="None" Text="None" Selected="True">
                    </asp:ListItem>
                </asp:DropDownList>

            </div>

            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" ValidationGroup="registerFields" OnClick="eventAdd" ID="registerButton" CssClass="button" Text="Register" />
            <a href="LoginPage.aspx">Go Back</a>
            <div>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Event Name" runat="server" ControlToValidate="newEventName">
                </asp:RequiredFieldValidator>
               <%-- <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Password" runat="server" ControlToValidate="newPassword">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Email" runat="server" ControlToValidate="newEmail">
                </asp:RequiredFieldValidator>--%>
            </div>
        </form>
    </div>
</body>
</html>
