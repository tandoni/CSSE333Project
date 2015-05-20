<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EventPage.aspx.cs" Inherits="WebApplication1.EventPage" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Add an Event</h1>

        <hr />
        <div id="eventAdd">
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <asp:TextBox runat="server" ID="newEventName" placeholder="Event Name" />
            <br />

            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <asp:TextBox runat="server" ID="newDescription" placeholder="Description" />

            <asp:Calendar ID="calender1" runat="server" Style="margin-left: 30px; margin-top: 10px; margin-bottom: 10px;"
                BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest"
                Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px"
                Width="250px" >
                
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
            <asp:DropDownList ClientIDMode="Static" ID="hourTime" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" ID="minuteTime" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" ID="AMPM" runat="server">
                <asp:ListItem Value="AM"></asp:ListItem>
                <asp:ListItem Value="PM"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
            </asp:DropDownList>

        </div>

       <asp:Button runat="server" ValidationGroup="registerFields" OnClick="eventAdd" ID="registerButton" CssClass="button" Text="Register" />
      
        <div>
            <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Event Name" runat="server" ControlToValidate="newEventName">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ResourceName="rgv"
            runat="server" ControlToValidate="newEventName" ErrorMessage="Please enter valid name."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
             <asp:RegularExpressionValidator  ID="descVal" ResourceName="rgv"
            runat="server" ControlToValidate="newDescription" ErrorMessage="Please enter valid description."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[ ]|[0-9]|[-]|[_])*"></asp:RegularExpressionValidator>
            <%-- <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Password" runat="server" ControlToValidate="newPassword">
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator EnableClientScript="true" ValidationGroup="registerFields" ErrorMessage="Enter Email" runat="server" ControlToValidate="newEmail">
                </asp:RequiredFieldValidator>--%>
        </div>

    </div>
</asp:Content>