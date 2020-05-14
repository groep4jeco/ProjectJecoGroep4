<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ProjectBedrijfApp.Reserveren" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KEKW</title>
    <style type="text/css">
        #form1 {
            height: 189px;
        }
        .Reserveren {
            float: right;
        }
    </style>
</head>
<body style="height: 203px">
    <form id="form1" runat="server">
        <div id ="Reserveren">
        <asp:Button ID="Tafel1" runat="server" OnClick="SetReserverData" Text="Tafel 1"  />
        <asp:Button ID="Tafel2" runat="server" OnClick="SetReserverData" Text="Tafel2" />
        <asp:Button ID="Button4" runat="server" OnClick="SetReserverData" Text="Button" />
        <asp:Button ID="Button3" runat="server" OnClick="SetReserverData" Text="Button" />
        <br />
        <asp:Button ID="ReserverenButton" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Reserveren" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [Actie]"></asp:SqlDataSource>
            <asp:TextBox ID="TextBox1" runat="server" Height="137px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
