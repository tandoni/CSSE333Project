<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditOrganization.aspx.cs" Inherits="WebApplication1.EditOrganization" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='Content/RegisterSheet.css' rel='stylesheet' type='text/css' />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet" />
    
    <script type="text/javascript">
        function work() {
            var e = document.getElementById("dropDownOrgs");
            var strUser = e.options[e.selectedIndex].text;
            var e1 = document.getElementById("orgName");
            e1.innerText = strUser;
        };
    </script>
</head>
<body>
    <div class="eventbox">
        <h1>Edit an Organization</h1>

        <form runat="server">
            <hr />
            <div id="editOrgBox">
                <asp:DropDownList onclick="work()" AppendDataBoundItems="true" ID="dropDownOrgs" runat="server">
                   
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ID="rfl1" ControlToValidate="dropDownOrgs" ErrorMessage="Please select an Organization" InitialValue="--Select an Organization--"></asp:RequiredFieldValidator>
                <br />
                <%--<label id="icon" for="name"><i class="icon-user"></i></label>--%>
                <%--<asp:Label BackColor="Gray" runat="server" ID="orgName" placeholder="Organiazation Name" />--%>
                <label style="text-align:center; display:block;" id="orgName">None</label>
                
                <label id="icon" for="name"><i class="icon-link"></i></label>
                <asp:TextBox placeholder="Edit Webpage" runat="server" ID="editUrl" />

                <label id="icon" for="name"><i class="icon-pencil"></i></label>
                <asp:TextBox placeholder="Edit Description" runat="server" ID="editDesc" />

                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownLocations" runat="server">
                    
                </asp:DropDownList>

                <asp:DropDownList AppendDataBoundItems="true" ID="dropDownPartOfOther" runat="server">
                </asp:DropDownList>

            </div>

            <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
            <asp:Button runat="server" OnClick="editOrganization" ID="editOrgBtn" CssClass="button" Text="Sumbit" />
            <a href="LoginPage.aspx">Go Back</a>
        </form>
    </div>
</body>
</html>
