<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bestellen.aspx.cs" Inherits="ProjectBedrijfApp.Bestellen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bestellen</title>
<style>
    #container{
        height: 550px;
        width: 910px;
    }


    /* topbalk */
    #topbalk {
        height: 25px;
        width: 900px;
        border: 1px;
        border-style: solid;
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
        width: 900px;
        border: 1px;
        border-top: 0px;
        border-style: solid;
    }

    #ddlMenulijst{
        margin: 1px;
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
        border: 1px;
        border-top: 0px;
        border-style: solid;
    }
    

    /* bestelvenster */
    #bestelvenster{
        float: left;
        width: 159px; 
        height: 475px;
        border-left-style: solid;
        border-left-color: inherit;
        border-left-width: 0px;
        border-right-style: solid;
        border-right-color: inherit;
        border-right-width: 1px;
        border-top-style: solid;
        border-top-color: inherit;
        border-top-width: 0px;
        border-bottom-style: solid;
        border-bottom-color: inherit;
        border-bottom-width: 1px;        
    }

    #bestelvenster2{
        width: 154px; 
        height: 470px;
        margin: 5px
    }

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
        <div>
            <div id="container">

                <!-- topbalk -->
                <div id="topbalk">
                    <div id="datum">
                        <asp:Label ID="lblDatum" runat="server" 
                            Text='<%# Eval("Date", "{0:d MMM yyyy HH:mm}") %>'>
                        </asp:Label>
                    </div>
                    <div id="ronde">
                        ronde</div>
                    <div id="tijd">
                        tijd</div>
                </div>

                <!-- menuselectie -->
                <div id="menuselectie">
                    <div id="menulijst">
                        <asp:DropDownList ID="ddlMenulijst" runat="server" Height="23px" Width="298px" OnSelectedIndexChanged="ddlMenulijst_SelectedIndexChanged">
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
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht1" runat="server" ImageUrl="https://www.dehippevegetarier.nl/wp-content/uploads/2018/10/APC_1350-1080x675.jpg" OnClick="imgbtnSoepgerecht1_Click" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht1" runat="server" Text="Overheerlijke tomatensoep vers gemaakt in de keuken."></asp:Label>
                    </div>
                   
                    <div class="gerecht" id="soepgerecht2">
                        <asp:ImageButton class= "gerechtimg" ID="imgbtnSoepgerecht2" runat="server" ImageUrl="https://i1.wp.com/nadiashealthyworld.com/wp-content/uploads/2019/06/groentensoep-1-2-1.jpg?fit=528%2C357&amp;ssl=1" OnClick="imgbtnSoepgerecht1_Click" />
                        <br/>
                        <asp:Label class= "gerechtlbl" ID="lblSoepgerecht2" runat="server" Text="Lekkere traditionele groentensoep"></asp:Label>
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
                    <div id="bestelvenster2">
                        <asp:Button ID="btnBestel" runat="server" Text="BESTEL" Height="50px" Width="150px" OnClick="btnBestel_Click" />                      
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd1" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus1" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus1" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal1" runat="server" Text="1"></asp:Label>
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd2" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus2" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus2" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal2" runat="server" Text="1"></asp:Label>
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd3" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus3" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus3" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal3" runat="server" Text="1"></asp:Label>
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd4" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus4" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus4" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal4" runat="server" Text="1"></asp:Label>
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd5" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus5" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus5" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal5" runat="server" Text="1"></asp:Label>
                        <br/>
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd6" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus6" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus6" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal6" runat="server" Text="1"></asp:Label>
                        <br />
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd7" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus7" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus7" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal7" runat="server" Text="1"></asp:Label>
                        <br />
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd8" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus8" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus8" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal8" runat="server" Text="1"></asp:Label>
                        <br />
                        <br/>
                        <asp:Label class="toegevoegd" ID="lblToegevoegd9" runat="server" Text="Gerecht1"></asp:Label>                        
                        <asp:Button class="plus" ID="btnPlus9" runat="server" Height="16px" Text="+" Width="16px" />
                        <asp:Button class="minus" ID="btnMinus9" runat="server" Height="16px" Text="-" Width="16px" />
                        <asp:Label class="aantal" ID="lblAantal9" runat="server" Text="1"></asp:Label>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
