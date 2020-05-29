<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Betalen.aspx.cs" Inherits="ProjectBedrijfApp.Betalen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Drinken"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Aantal Personen"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Label ID="Label4" runat="server" Text="Totaal bedrag"></asp:Label>
        <br />
    </form>
</body>
</html>
