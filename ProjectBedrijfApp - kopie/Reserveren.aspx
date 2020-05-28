<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ProjectBedrijfApp.Reserveren" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 189px;
        }
    </style>
</head>
<body style="height: 203px">
    <form id="form1" runat="server">
        <asp:ImageButton ID="IB1" runat="server" OnClick="SetReserverData" ImageUrl="C:\Users\herman\Pictures\Camera Roll\images.jpg" Width="147px" />
        <br />
        <asp:Button ID="ReserverenButton" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Reserveren" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
