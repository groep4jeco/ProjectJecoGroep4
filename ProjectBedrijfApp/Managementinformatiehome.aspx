<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Managementinformatiehome.aspx.cs" Inherits="ProjectBedrijfApp.Managementinformatiehome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblwelkom" runat="server" Text="Welkom "></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [Voornaam] FROM [Personeel]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="btnOmzet" runat="server" Text="Omzet" />
            <br />
            <asp:Button ID="BtnLoonkosten" runat="server" OnClick="Button1_Click" Text="Loonkosten" />
            <br />
            <asp:Button ID="btnInkoop" runat="server" Text="Inkoop" />
            <br />
            <asp:Button ID="btnVoorraad" runat="server" Text="Voorraad" />
            <br />
            <asp:Button ID="btnFacturen" runat="server" Text="Overzicht facturen" />
        </div>
    </form>
</body>
</html>
