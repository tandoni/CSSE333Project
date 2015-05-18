<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditOrganization.aspx.cs" Inherits="WebApplication1.EditOrganization" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="eventbox">
        <h1>Edit an Organization</h1>

        <hr />
        <div id="editOrgBox">
            <asp:DropDownList ClientIDMode="Static" onclick="work2()" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfl1" ControlToValidate="dropDownOrgs" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
            <br />
            <%--<label id="icon" for="name"><i class="icon-user"></i></label>--%>
            <%--<asp:Label BackColor="Gray" runat="server" ID="orgName" placeholder="Organiazation Name" />--%>
            <label style="text-align: center; display: block;" id="orgName">None</label>

            <label id="icon" for="name"><i class="icon-link"></i></label>
            <asp:TextBox placeholder="Edit Webpage" runat="server" ID="editUrl" />
            <br />

            <label id="icon" for="name"><i class="icon-pencil"></i></label>
            <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc" />

            <asp:DropDownList style="margin-left:30px;" ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
            </asp:DropDownList>

            <asp:DropDownList ClientIDMode="Static" AppendDataBoundItems="true" ID="dropDownPartOfOther" runat="server">
            </asp:DropDownList>

        </div>

        <asp:Button runat="server" OnClick="editOrganization" ID="editOrgBtn" CssClass="button" Text="Sumbit" />

    </div>
</asp:Content>
