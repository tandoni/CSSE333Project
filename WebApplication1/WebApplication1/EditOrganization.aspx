<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditOrganization.aspx.cs" Inherits="WebApplication1.EditOrganization" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Edit an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <br />
            <%--<label id="icon" for="name"><i class="icon-user"></i></label>--%>
            <%--<asp:Label BackColor="Gray" runat="server" ID="orgName" placeholder="Organiazation Name" />--%>
            <b><asp:Label style="text-align: center; display: block;" runat="server" ID="orgName">--Select an Organization--</asp:Label></b>

            <label id="icon" for="name"><i class="icon-link"></i></label>
            <asp:TextBox placeholder="Edit Webpage" runat="server" ID="editUrl" />
            <br />

            <label id="icon" for="name"><i class="icon-pencil"></i></label>
            <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc" />

            <asp:DropDownList Style="margin-left: 30px;" ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
            </asp:DropDownList>

            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownPartOfOther" runat="server">
            </asp:DropDownList>

        </div>

        <asp:Button runat="server" OnClick="editOrganization" ID="editOrgBtn" CssClass="button" Text="Sumbit" />

        <asp:RegularExpressionValidator ID="rgv2" ResourceName="rgv"
            runat="server" ControlToValidate="editUrl" ErrorMessage="Please enter valid webpage."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ResourceName="rgv"
            runat="server" ControlToValidate="editDesc" ErrorMessage="Please enter valid description."
            ValidationExpression="([a-z]|[A-Z]|[@]|[.]|[0-9]|[ ]|[-]|[_])*"></asp:RegularExpressionValidator>

    </div>
</asp:Content>
