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
            <asp:Calendar ID="calender2" runat="server" Style="margin-left: 30px; margin-top: 10px; margin-bottom: 10px;"
                BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest"
                Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px"
                Width="250px">

                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <WeekendDayStyle BackColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC"
                    BorderWidth="1px" Font-Bold="True"
                    Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            </asp:Calendar>
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


        <asp:RegularExpressionValidator ID="rgv" ResourceName="rgv"
            runat="server" ControlToValidate="eventName" ErrorMessage="Please enter valid name."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="rgv2" ResourceName="rgv"
            runat="server" ControlToValidate="editDesc2" ErrorMessage="Please enter valid description."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
    </div>
</asp:Content>
