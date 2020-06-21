<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Serveerscherm.aspx.cs" Inherits="ProjectBedrijfApp.Serveerscherm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer

 
FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 0 ROWS
 FETCH NEXT 1 ROWS ONLY)

 AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 0 ROWS 
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />
                    rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="bestelling Gereed" />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />
                    besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />
                    rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>Alle bestellingen zijn verwerkt</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />
                    besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />
                    rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />
                    rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />
                    rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel

INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer

INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer

INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid

 ORDER BY besteltijd asc

OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer

 
FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 1 ROWS
 FETCH NEXT 1 ROWS ONLY)

 AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel

INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer

INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer

INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid

 ORDER BY besteltijd asc

OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 

FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY 
besteltijd asc

OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)
"></asp:SqlDataSource>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel

INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer

INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer

INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid

 ORDER BY besteltijd asc

OFFSET 3 ROWS 
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 

FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY 
besteltijd asc

OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)
"></asp:SqlDataSource>
        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellin gereed" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellin gereed" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel

INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer

INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer

INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid

 ORDER BY besteltijd asc

OFFSET 1 ROWS 
FETCH NEXT 4 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 

FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY 
besteltijd asc

OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)
"></asp:SqlDataSource>
        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource7" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellin gereed" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellin gereed" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellingen gereed" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 3
from bestelregel

INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer

INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer

INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, besteltijd, bestelstatusid

 ORDER BY besteltijd asc

OFFSET 5 ROWS 
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 

FROM serveer


Where tafeltafelnummer=

 (select tafeltafelnummer from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY 
besteltijd asc

OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)


AND besteltijd = (select besteltijd from serveertafels
 group by tafeltafelnummer, bestelstatusid, besteltijd

ORDER BY besteltijd asc

OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)
"></asp:SqlDataSource>
        <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource8" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">tafeltafelnummer:
                    <asp:TextBox ID="tafeltafelnummerTextBox" runat="server" Text='<%# Bind("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:TextBox ID="besteltijdTextBox" runat="server" Text='<%# Bind("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestellin gereed" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">tafeltafelnummer:
                    <asp:Label ID="tafeltafelnummerLabel" runat="server" Text='<%# Eval("tafeltafelnummer") %>' />
                    <br />Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />besteltijd:
                    <asp:Label ID="besteltijdLabel" runat="server" Text='<%# Eval("besteltijd") %>' />
                    <br />rondenummer:
                    <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
