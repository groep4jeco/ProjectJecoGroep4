<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bestellen.aspx.cs" Inherits="ProjectBedrijfApp.Bestellen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <div style="height: 628px; width: 1040px">
    <form id="form1" runat="server">
    <div style="height: 21px; width: 1040px;">
        <asp:Label ID="lblDatum" runat="server" Text="DD/MM/JJJJ"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblRonde" runat="server" Text="Ronde"></asp:Label>
    </div>
        <div style="width: 1040px; height: 29px; margin-bottom: 0px;">
            <asp:DropDownList ID="ddlMenus" runat="server" Height="16px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="328px">
                <asp:ListItem Selected="True">Menu Overzicht</asp:ListItem>
                <asp:ListItem>Soepen</asp:ListItem>
                <asp:ListItem>Sushi</asp:ListItem>
                <asp:ListItem>Vlees</asp:ListItem>
                <asp:ListItem>Vis</asp:ListItem>
                <asp:ListItem>Kip</asp:ListItem>
                <asp:ListItem>Bij gerechten</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; Vragen stellen of drinken bestellen? Daar is het personeel voor!<div style="height: 543px; width: 1003px">
                <asp:CheckBox ID="ckbGerecht1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image1" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht2" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image2" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht3" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image3" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht4" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image4" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht5" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image5" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht6" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image6" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht7" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image7" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht8" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image8" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht9" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image9" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht10" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image10" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht11" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image11" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht12" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image12" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht13" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image13" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht14" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image14" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht15" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image15" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht16" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image16" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht17" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image17" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht18" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image18" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht19" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image19" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht20" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image20" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht21" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image21" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht22" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image22" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht23" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image23" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
                <asp:CheckBox ID="ckbGerecht24" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="shushi" />
                <asp:Image ID="Image24" runat="server" BorderStyle="Double" Height="53px" ImageUrl="https://www.lekkervanbijons.be/sites/default/files/styles/recipe_detail/public/recipe_image/sushi-rijst_sushi-azijn?itok=R0iedE24" Width="60px" />
            </div>
        </div>
    </form>
  </div>
</body>
</html>
