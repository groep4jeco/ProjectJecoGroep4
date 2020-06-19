<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Extra.aspx.cs" Inherits="ProjectBedrijfApp.Extra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Extra</title>
</head>
<style>
    body{
        background-color: aqua;
        font-family: Arial, 'Times New Roman';
    }

    #container {
        margin: auto;
        padding: 30px;
        background-color: white;
        width: 1000px;
        height: 400px;
        text-align: center;
    }

    #topbar {
        margin: auto;
        background-color: black;
        width: 1000px;
        height: 156px;
        padding-left: 30px;
        padding-right: 30px;
        text-align: center;
    }

    #btnLogin {
        width: 100px;
        height: 50px;
        position: absolute;
        left: 20px;
        top: 20px;
    }

</style>
<body>
    <form id="form1" runat="server">
        <div id="topbar">
            <img src="images/logo bedrijf.png" style="height: 156px" />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
        <div id="container" dir="auto">

            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="Bent u klaar met eten? Zo ja, hopen wij dat u genoten heeft!"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Wilt u eventueel nog extra bij bestellen, dan kan dat hier onder."></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Maak uw keuze"></asp:Label>
            <br />

            <asp:Button ID="btnExtraRondes" runat="server" Font-Size="Large" Height="50px" Text="Extra Rondes" Width="150px" OnClick="btnExtraRondes_Click" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnApartBestellen" runat="server" Font-Size="Large" Height="50px" Text="Apart Bestellen" Width="150px" OnClick="btnApartBestellen_Click" />

            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbAantal" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red">Je moet wat invullen!</asp:RequiredFieldValidator>
            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txbAantal" ErrorMessage="RangeValidator" Font-Size="Large" ForeColor="Red" MaximumValue="100" MinimumValue="1" Type="Integer">Je moet minimaal 1 ronde bij bestellen!</asp:RangeValidator>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Aantal rondes:"></asp:Label>
            <asp:TextBox ID="txbAantal" runat="server" Font-Size="Large" Font-Underline="False" Width="80px" TextMode="Number">1</asp:TextBox>
            <asp:DropDownList ID="ddlfruit" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <br />

            <asp:Button ID="btnDoorgaan" runat="server" Font-Size="Large" Height="50px" Text="Doorgaan" Width="200px" OnClick="btnDoorgaan_Click" />

        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
