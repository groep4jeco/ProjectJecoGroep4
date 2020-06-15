<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bestellen.aspx.cs" Inherits="ProjectBedrijfApp.Bestellen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            height: 30px;
            text-align: center;
        }

        /*buitenste container*/
        .auto-style6 {
            width: 1260px;
            height: 860px;
        }

        /*topbalk*/
        #datum {
            float: left;
            height: 30px;
            text-align: left;
            width: 420px;
        }

        #ronde {
            float: left;
            height: 30px;
            text-align: center;
            width: 420px;

        }
        #tijd {
            float: left;
            height: 30px;
            text-align: right;
            width: 420px;
            
        }

        /*infobalk*/

        #info{
            float: left;
            height: 30px;
            width: 1258px;
            text-align: center;
            border: 1px;
            border-style: solid;
        }

        /*Menu div*/
        #menu {
            float: left;
            width: 968px;
            height: 740px;
            overflow-y: auto;
            border-left-style: solid;
            border-left-color: inherit;
            border-left-width: 1px;
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

        /*Overzicht*/
        #overzicht{
            float: left;
            width: 289px;
            height: 740px;
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

        #overzicht2{
            width: 279px;
            height: 730px;
            margin: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container" class="auto-style6">

        <!--Topbalk-->
        <div id="datum">
            &nbsp;
            <asp:Label ID="lblDatum" runat="server" Font-Size="X-Large" Text="Datum"></asp:Label>
        </div>
        <div id="ronde">         
            <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Ronde"></asp:Label>
            &nbsp;<asp:Label ID="lblRonde" runat="server" Font-Size="X-Large" Text="1"></asp:Label>
            &nbsp;<asp:Label ID="Label9" runat="server" Font-Size="X-Large" Text="/"></asp:Label>
            &nbsp;<asp:Label ID="lblMaxRondes" runat="server" Font-Size="X-Large" Text=""></asp:Label>
            &nbsp;<asp:Label ID="lblWaarschuwing2" runat="server" Font-Size="X-Large" ForeColor="#FF3300"></asp:Label>
        </div>
        <div id="tijd" class="auto-style3">
            <asp:Label ID="lblAantalpersonen" runat="server" Font-Size="X-Large" Text="0"></asp:Label>
            &nbsp
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="personen"></asp:Label>

            <!--
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblTimer" runat="server" Font-Size="X-Large">150</asp:Label>
                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick1" Interval="1000">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            -->

        </div>
        
        <!--Info-->
        <div id="info">
           <asp:Label ID="lblInfo" runat="server" Font-Size="X-Large" Text="Vragen stellen of drinken bestellen? Daar is het personeel voor!"></asp:Label>
        </div>
         
        <!--Menu-->
        <div id="menu">
            <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyField="Gerechtnummer" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Both" Height="350px" OnItemCommand="DataList1_ItemCommand" RepeatColumns="4" RepeatDirection="Horizontal" Width="850px">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label4" runat="server" Text="Gerechtnummer:"></asp:Label>
                                &nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Eval("Gerechtnummer") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Omschrijving") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">€<asp:Label ID="Label7" runat="server" Text='<%# Eval("Prijs") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Gerechtnummer") %>' CommandName="addtocard" Height="200px" ImageUrl='<%# Eval("afb_pad") %>' Width="222px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="220px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [Gerecht]"></asp:SqlDataSource>           
            <br />
        </div>

        <div id="overzicht">
            <div id="overzicht2">
                <asp:Button ID="btnOverzicht" runat="server" Height="40px" Text="Overzicht" Width="279px" OnClick="btnOverzicht_Click" />

                <br />

                <asp:Label ID="Label2" runat="server" Text="Aantal gekozen gerechten:" Font-Size="Large"></asp:Label>
                &nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <br />
                <asp:Label ID="lblWaarschuwing" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="200px" OnRowDeleting="GridView2_RowDeleting" Width="279px" OnRowCommand="GridView2_RowCommand" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="sno" />
                        <asp:ImageField DataImageUrlField="afb_pad">
                            <ControlStyle Height="30px" Width="30px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Omschrijving" HeaderText="Gerecht">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hoeveelheid" HeaderText="Aantal">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="btnPlus" />
                        <asp:ButtonField CommandName="btnMinus" />
                        <asp:CommandField DeleteText="X" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <br />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
