﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProjectBedrijfApp.overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          body {
            background-color:lightslategray;
        }

        #form1 {
            background-color: seashell;
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
            margin-left: 170px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo">
            <img src="images/loginlogo%202.png" style="height: 156px" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [Personeelsnummer], [Wachtwoord], [Voornaam], [Is manager] AS Is_manager FROM [Personeel] WHERE (([Personeelsnummer] = @Personeelsnummer) AND ([Wachtwoord] = @Wachtwoord))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Personeelsnummer" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Wachtwoord" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
            <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
