<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bestellen.aspx.cs" Inherits="ProjectBedrijfApp.Bestellen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bestellen</title>
<style>
    #container{
        height: 550px;
        width: 900px;
    }


    /* topbalk */
    #topbalk {
        height: 25px;
        width: 900px;
    }
    #datum {
        height: 25px;
        width: 300px;
        float: left;
    }
    #ronde {
        height: 25px;
        width: 300px;
        float: left;
    }
    #tijd {
        height: 25px;
        width: 300px;
        float: left;
    }
    

    /* menuselectie */
    #infotekst {
        width: 600px;
        height: 25px;
        float: left;
    }
    #menulijst {
        height: 25px;
        width: 300px;
        float: left;
    }    
    #menuselectie {
        height: 25px;
    }

    /* menu's */
    .gerechtimg{
        height: 150px;
        width: 150px;
        margin: 10px 10px 0px 10px;
        border: 2px;
        border-style: solid;        
    }
    .gerechtlbl{
        
    }
    .gerecht {
        width: 175px;
        height: 200px;
        float: left;
        margin: 0px 5px 5px 5px
    }


    .menus {
        height: 475px;
        width: 740px;
        float: left;
    }
    

    /* bestelvenster */
    #bestelvenster{
        float: left;
        width: 160px; 
        height: 475px;
    }
    
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="container">

                <!-- topbalk -->
                <div id="topbalk">
                    <div id="datum">
                        datum</div>
                     <div id="ronde">
                        ronde</div>
                     <div id="tijd">
                        tijd</div>
                </div>

                <!-- menuselectie -->
                <div id="menuselectie">
                    <div id="menulijst">
                        <asp:DropDownList ID="ddlMenulijst" runat="server" Height="25px" Width="300px">
                            <asp:ListItem>Soepen</asp:ListItem>
                            <asp:ListItem>Sushi</asp:ListItem>
                            <asp:ListItem>Vlees</asp:ListItem>
                            <asp:ListItem>Vis</asp:ListItem>
                            <asp:ListItem>Kip</asp:ListItem>
                            <asp:ListItem>Bijgerechten</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="infotekst">
                        Vragen stellen of drinken bestellen? Daar is het personeel voor!</div>
                </div>

                <!-- Alle menu's -->
                <div class="menus" id="soepen">
                    <div class="gerecht" id="soepgerecht1">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht1" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht1" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht2">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht2" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht2" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht3">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht3" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht3" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht4">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht4" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht4" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht5">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht5" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht5" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht6">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht6" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht6" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht7">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht7" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht7" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                    <div class="gerecht" id="soepgerecht8">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht8" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht8" runat="server" Text="Overheerlijke tomatensoep vergemaakt in de keuken."></asp:Label>
                    </div>
                </div>
                <!-- Tijdelijk uitgeschakeld
                <div id="sushi">
                </div>
                <div id="vlees">
                </div>
                <div id="vis">
                </div>
                <div id="kip">
                </div>
                <div id="bijgerechten">
                </div>
                -->

                <!-- bestelvenster -->
                <div id="bestelvenster">
                    <asp:Button ID="btnBestel" runat="server" Text="BESTEL" Height="50px" Width="160px" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
