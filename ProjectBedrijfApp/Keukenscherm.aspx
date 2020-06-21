<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Keukenscherm.aspx.cs" Inherits="ProjectBedrijfApp.Keukenscherm" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style> 
        .body
        {
            background-color:seashell;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Terug" />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemDeleted="ListView1_ItemDeleted" GroupItemCount="3">
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Bestelling gereed" />
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
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;" runat="server">
                    <tr>
                        <td>Alle bestellingen zijn gereed.</td>
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
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </td>
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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = '2'
then  0.00
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select actienummer from actie where actienummer =1))

END 

ELSE
begin
UPDATE Factuur
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111) 
from Factuur
inner join Reservering on Factuur.Reserveringsnummer = Reservering.Reserveringsnummer 
inner join in_restaurant on in_restaurant.Reserveringsnummer = Reservering.Reserveringsnummer
inner join  Tafel_Reservering on Tafel_Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
inner join Bestelregel on Bestelregel.Reserveringsnummer = Bestelregel.Reserveringsnummer
inner join Gerecht on Gerecht.Gerechtnummer = Bestelregel.menugerechtnummer
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY);

commit;" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = '2'
then  0.00
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select actienummer from actie where actienummer =1))

END 

ELSE
begin
UPDATE Factuur
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111) 
from Factuur
inner join Reservering on Factuur.Reserveringsnummer = Reservering.Reserveringsnummer 
inner join in_restaurant on in_restaurant.Reserveringsnummer = Reservering.Reserveringsnummer
inner join  Tafel_Reservering on Tafel_Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
inner join Bestelregel on Bestelregel.Reserveringsnummer = Bestelregel.Reserveringsnummer
inner join Gerecht on Gerecht.Gerechtnummer = Bestelregel.menugerechtnummer
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY);

commit;" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = '2'
then  0.00
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select actienummer from actie where actienummer =1))

END 

ELSE
begin
UPDATE Factuur
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111) 
from Factuur
inner join Reservering on Factuur.Reserveringsnummer = Reservering.Reserveringsnummer 
inner join in_restaurant on in_restaurant.Reserveringsnummer = Reservering.Reserveringsnummer
inner join  Tafel_Reservering on Tafel_Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
inner join Bestelregel on Bestelregel.Reserveringsnummer = Bestelregel.Reserveringsnummer
inner join Gerecht on Gerecht.Gerechtnummer = Bestelregel.menugerechtnummer
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY);

commit;" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = '2'
then  0.00
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select actienummer from actie where actienummer =1))

END 

ELSE
begin
UPDATE Factuur
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111) 
from Factuur
inner join Reservering on Factuur.Reserveringsnummer = Reservering.Reserveringsnummer 
inner join in_restaurant on in_restaurant.Reserveringsnummer = Reservering.Reserveringsnummer
inner join  Tafel_Reservering on Tafel_Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
inner join Bestelregel on Bestelregel.Reserveringsnummer = Bestelregel.Reserveringsnummer
inner join Gerecht on Gerecht.Gerechtnummer = Bestelregel.menugerechtnummer
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY);

commit;" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 4 ROWS
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5" GroupItemCount="3">
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = '2'
then  0.00
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select actienummer from actie where actienummer =1))

END 

ELSE
begin
UPDATE Factuur
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111) 
from Factuur
inner join Reservering on Factuur.Reserveringsnummer = Reservering.Reserveringsnummer 
inner join in_restaurant on in_restaurant.Reserveringsnummer = Reservering.Reserveringsnummer
inner join  Tafel_Reservering on Tafel_Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
inner join Bestelregel on Bestelregel.Reserveringsnummer = Bestelregel.Reserveringsnummer
inner join Gerecht on Gerecht.Gerechtnummer = Bestelregel.menugerechtnummer
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusID = 2
from bestelregel
INNER JOIN Reservering ON Bestelregel.Reserveringsnummer = Reservering.Reserveringsnummer
INNER JOIN in_restaurant ON Reservering.Reserveringsnummer = in_restaurant.Reserveringsnummer
INNER JOIN Tafel_Reservering ON in_restaurant.Reserveringsnummer = Tafel_Reservering.Reserveringsnummer
Where tafeltafelnummer =
 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY);

commit;" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
FROM Listview11

Where tafeltafelnummer=

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)

AND besteltijd = (select besteltijd from Listview4
 group by tafeltafelnummer, bestelstatusid, besteltijd
ORDER BY besteltijd asc
OFFSET 5 ROWS
FETCH NEXT 1 ROWS ONLY)"></asp:SqlDataSource>
        <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource6" GroupItemCount="3">
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
