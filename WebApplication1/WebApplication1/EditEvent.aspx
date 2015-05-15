<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEvent.aspx.cs" Inherits="WebApplication1.EditEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
    <script type="text/javascript">
        function work() {
            var e = document.getElementById("dropDownEvents");
            var strUser = e.options[e.selectedIndex].text;
            var e1 = document.getElementById("eventName");
            e1.value = strUser;
        };
    </script>
</head>
<body>
    <div class="eventbox">
        <h1>Edit an Event</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList onclick="work()" AppendDataBoundItems="true" ID="dropDownEvents" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="rfl2" ControlToValidate="dropDownEvents" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
                <br />

                <label id="icon" for="name"><i class="icon-user"></i></label>
                <asp:TextBox runat="server" placeholder="Edit Event Name" ID="eventName"></asp:TextBox>

                <label id="icon" for="name"><i class="icon-envelope"></i></label>
                <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc2" />

                <asp:Calendar runat="server" ID="calender2"></asp:Calendar>
                <asp:DropDownList ID="hourTime2" runat="server" AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="minuteTime2" runat="server" AppendDataBoundItems="true">
                </asp:DropDownList>
                <asp:DropDownList ID="AMPM2" runat="server">
                    <asp:ListItem Value="AM"></asp:ListItem>
                    <asp:ListItem Value="PM"></asp:ListItem>
                </asp:DropDownList>
                <br />

                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownLocations2" runat="server">
                </asp:DropDownList>

            </div>

            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" OnClick="editEvent2" ID="editEventBtn2" CssClass="button" Text="Submit" />
            <a href="WelcomeUser.aspx">Go Back</a>
        </form>
    </div>
</body>
</html>
