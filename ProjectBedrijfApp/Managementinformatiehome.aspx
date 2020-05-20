<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Managementinformatiehome.aspx.cs" Inherits="ProjectBedrijfApp.Managementinformatiehome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Managers Overzicht</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
&nbsp;<br />
            <br />
            <asp:Button ID="btnOmzet" runat="server" Text="Omzet" OnClick="btnOmzet_Click" Width="150px" />
            <br />
            <asp:Button ID="BtnLoonkosten" runat="server" OnClick="Button1_Click" Text="Loonkosten" Width="150px" />
            <br />
            <asp:Button ID="btnInkoop" runat="server" Text="Inkoop" Width="150px" />
            <br />
            <asp:Button ID="btnVoorraad" runat="server" Text="Voorraad" Width="150px" />
            <br />
            <asp:Button ID="btnFacturen" runat="server" Text="Overzicht facturen" Width="150px" />
        </div>
    </form>
</body>
</html>
