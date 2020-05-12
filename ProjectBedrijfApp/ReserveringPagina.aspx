﻿ <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveringPagina.aspx.cs" Inherits="ProjectBedrijfApp.ReserveringPagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 137px">
            <asp:Label ID="Label1" runat="server" Text="Tijdvlak"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton1_CheckedChanged" Text="17:00-19:30" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton2_CheckedChanged" Text="19:30-22:00" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Aantal Personen"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ReserverTafel" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
        <asp:CheckBox ID="cbAlles" runat="server" Text="All you can Eat" />
        <br />
        <asp:TextBox ID="txtRondes" runat="server">Aantal rondes</asp:TextBox>
        <asp:Label ID="lbldatum" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
