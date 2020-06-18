<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="regristratiepagina.aspx.cs" Inherits="ProjectBedrijfApp.regristratiepagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #form1 {
            background-color: lightslategray;
            height: 940px;
        }
        .invoering {
            position: center;
            width: 1201px;
            margin-left: auto;
            margin-right: auto;
            background-color: seashell;
            
        }
        .knoppen {
            position: center;
            text-align:center;
        }
        .label
        {
            text-align:center;
            margin-left: 80px;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="invoering">
            <div class="auto-style1">
                <br />
                <asp:Label ID="Label2" runat="server" Font-Size="XX-Large" Text="Welkom bij JeCo Sushi!"></asp:Label>
                <br />
            <br />
            <br />
            <br />
                <asp:Label ID="Label3" runat="server" Text="Voer het reserveringsnummer in:" Font-Size="Large"></asp:Label>
            <br />
            <br />
          
                <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="185px" Font-Size="Large"></asp:TextBox>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RangeValidator" Font-Size="Large" ForeColor="Red" MaximumValue="9999" MinimumValue="1">Reserveringsnummers beginnen vanaf 1!</asp:RangeValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red">Je moet iets invullen!</asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ga verder" Height="46px" Width="235px" BackColor="Silver" Font-Size="Large" />
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>