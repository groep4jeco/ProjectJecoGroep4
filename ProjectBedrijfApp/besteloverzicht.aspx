<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="besteloverzicht.aspx.cs" Inherits="ProjectBedrijfApp.besteloverzicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .toegevoegd{
        float: left;
        margin: 0px
        }

        .aantal{
        float: right;
        }

        .plus{
        float: right;
        }

        .minus{
        float: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 300px; width: 269px">

            Gerechten:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Aantal:
            <br/>
            <br/>
            <asp:Label class="toegevoegd" ID="lblGerecht1" runat="server"></asp:Label>                        
            <asp:Button class="plus" ID="btnPlus1" runat="server" Height="16px" Text="+" Width="16px" OnClick="btnPlus1_Click" />
            <asp:Button class="minus" ID="btnMinus1" runat="server" Height="16px" Text="-" Width="16px" OnClick="btnMinus1_Click" />
            <asp:Label class="aantal" ID="lblAantal1" runat="server" Text="0"></asp:Label> 
            <br/>
            <br/>
        </div>
    </form>
</body>
</html>
