<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Keukenscherm.aspx.cs" Inherits="ProjectBedrijfApp.Keukenscherm" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd
 
FROM bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

Where tafeltafelnummer =

 (SELECT tafeltafelnummer

from bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

GROUP BY tafeltafelnummer, besteltijd
ORDER BY besteltijd ASC

OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)

GROUP BY tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd
ORDER BY besteltijd ASC"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">tafeltafelnummer</th>
                                    <th runat="server">Hoeveelheid</th>
                                    <th runat="server">Omschrijving</th>
                                    <th runat="server">besteltijd</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 2" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, bestelstatusid
 
FROM bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

WHERE bestelstatusID =1
AND tafeltafelnummer =

 (SELECT tafeltafelnummer

from bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

GROUP BY tafeltafelnummer, besteltijd
ORDER BY besteltijd ASC

OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)

GROUP BY tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, bestelstatusid
ORDER BY besteltijd ASC" UpdateCommand="UPDATE bestelregel
SET bestelstatus = 2
where tafeltafelnummer = 1"></asp:SqlDataSource>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="bestelstatusidLabel" runat="server" Text='<%# Eval("bestelstatusid") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="bestelstatusidTextBox" runat="server" Text='<%# Bind("bestelstatusid") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="bestelstatusidTextBox" runat="server" Text='<%# Bind("bestelstatusid") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="bestelstatusidLabel" runat="server" Text='<%# Eval("bestelstatusid") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">tafeltafelnummer</th>
                                    <th runat="server">Hoeveelheid</th>
                                    <th runat="server">Omschrijving</th>
                                    <th runat="server">besteltijd</th>
                                    <th runat="server">bestelstatusid</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="bestelstatusidLabel" runat="server" Text='<%# Eval("bestelstatusid") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" Visible="False">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">tafeltafelnummer</th>
                                    <th runat="server">Hoeveelheid</th>
                                    <th runat="server">Omschrijving</th>
                                    <th runat="server">besteltijd</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="DELETE *
 
FROM bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

Where tafeltafelnummer =

 (SELECT tafeltafelnummer

from bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

GROUP BY tafeltafelnummer, besteltijd
ORDER BY besteltijd ASC

OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)

GROUP BY tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd
ORDER BY besteltijd ASC" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd
 
FROM bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

Where tafeltafelnummer =

 (SELECT tafeltafelnummer

from bestelregel

INNER JOIN gerecht 
ON bestelregel.menugerechtnummer = gerecht.gerechtnummer

INNER JOIN reservering
ON bestelregel.reserveringsnummer = reservering.reserveringsnummer

INNER JOIN in_restaurant
ON reservering.reserveringsnummer = in_restaurant.reserveringsnummer

INNER JOIN Tafel_Reservering 
ON in_restaurant.reserveringsnummer = Tafel_Reservering.reserveringsnummer

GROUP BY tafeltafelnummer, besteltijd
ORDER BY besteltijd ASC

OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)

GROUP BY tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd
ORDER BY besteltijd ASC"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
