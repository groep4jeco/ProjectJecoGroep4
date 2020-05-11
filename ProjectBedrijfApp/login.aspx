﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProjectBedrijfApp.overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          body {
            background-color: #a1f2f7;
        }

        #form1 {
            background-color: #7cc5f6;
            width: 500px;
            height: 448px;
            margin-top: 120px;
            margin-left: auto;
            margin-right: auto;
        }

        .container {
            margin-left: 50px;
            height: 282px;
            width: 402px;
        }

        .logo {
            margin-left: 170px;<
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo">
            <img src="images/loginlogo%202.png" style="height: 156px" />
        </div>
        <div class="container">
            <div style="text-align: center;">
                <asp:Label ID="Label1" runat="server" Text="PERSONEELS ID" Width="393px" Font-Bold="True"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="36px" Width="391px" BorderColor="Blue"></asp:TextBox>
            <br />
             <div style="text-align: center;">
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="WACHTWOORD" Font-Bold="True"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" Height="36px" Width="391px" BorderColor="#0033CC"></asp:TextBox>
            <br />
            <br />
            <br />
             <asp:Button ID="Button1" runat="server" Text="INLOGGEN" Width="397px" BackColor="#669999" BorderColor="#003366" BorderStyle="Outset" Font-Bold="True" Font-Size="Larger" Height="35px" OnClick="Button1_Click" />

            <br />
            <br />
        </div>
    </form>
</body>
</html>