<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Beginpagina.aspx.cs" Inherits="Bestellen.Beginpagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Voer het reserveringsnummer in:<br />
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="185px"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ga verder" Height="25px" Width="190px" />
        </div>
    </form>
</body>
</html>
