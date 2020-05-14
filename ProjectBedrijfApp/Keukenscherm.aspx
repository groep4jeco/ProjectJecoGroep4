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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT tafeltafelnummer, Hoeveelheid, Omschrijving, besteltijd, rondenummer
 
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
FETCH NEXT 1 ROWS ONLY)" DeleteCommand="BEGIN TRANSACTION;


IF (select DISTINCT Reserveringsnummer from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)) not in (select factuur.reserveringsnummer from Factuur)

BEGIN 
INSERT INTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer, klantklantid, actieactienummer) 

values( (select DISTINCT email from listview111

Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(SELECT CONVERT (date, GETDATE())),

 

(select 
CASE 
WHEN [All you can eat] = 0x0001
then CAST(SUM([Prijs volwassenen] * [Aantal personen] + [Aantal personen] * EXTRARONDES * 5)AS decimal (10,2))
ELSE
CAST(SUM(regelprijs)AS decimal (10,2))
end as Totaalbedrag
from listview111
Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)

group by [All you can eat]),

 

(select DISTINCT reserveringsnummer from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

(select DISTINCT klantklantid from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
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
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)
end

UPDATE bestelregel
SET bestelstatusid = 2
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
FETCH NEXT 1 ROWS ONLY);

commit;"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemDeleted="ListView1_ItemDeleted">
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
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
                        <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
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
                        <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
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
                                    <th runat="server">rondenummer</th>
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
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

 

(select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

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
SET bestelstatusid = 2
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
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" OnItemDeleted="ListView2_ItemDeleted">
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
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
                        <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
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
                        <asp:TextBox ID="rondenummerTextBox" runat="server" Text='<%# Bind("rondenummer") %>' />
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
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
                                    <th runat="server">rondenummer</th>
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
                        <asp:Label ID="rondenummerLabel" runat="server" Text='<%# Eval("rondenummer") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" DeleteCommand="BEGIN TRANSACTION;
use [2020-BIM01A-P4-Sushi]

INSERT inTO factuur (klantenpasemail, factuurdatum, totaalbedrag, reserveringsnummer,klantklantid)
values ((select DISTINCT email from listviewonline where reserveringsnumer = (select reserveringsnumer from listviewonline 
group by reserveringsnummer, tijd order by tijd asc OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

(SELECT CONVERT (date, GETDATE())),

(select CAST(SUM(regelprijs)AS decimal (10,2)) from listviewonline where reserveringnummer = (select Reserveringsnummer from listviewonline 
group by reserveringsnummer, tijd order by tijd asc OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select distinct reserveringnummer from listviewonline where reserveringnummer = (select Reserveringsnummer from listviewonline 
group by reserveringsnummer, tijd order by tijd asc OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)),

(select distinct klantklantid from listviewonline where reserveringnummer = (select Reserveringsnummer from listviewonline 
group by reserveringsnummer, tijd order by tijd asc OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY)))

commit;" SelectCommand="select * from listviewonline"></asp:SqlDataSource>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
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
                        <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="KlantKlantIDTextBox" runat="server" Text='<%# Bind("KlantKlantID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PrijsTextBox" runat="server" Text='<%# Bind("Prijs") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="regelprijsTextBox" runat="server" Text='<%# Bind("regelprijs") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderstatusOrderstatusIDTextBox" runat="server" Text='<%# Bind("OrderstatusOrderstatusID") %>' />
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
                        <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="KlantKlantIDTextBox" runat="server" Text='<%# Bind("KlantKlantID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PrijsTextBox" runat="server" Text='<%# Bind("Prijs") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="regelprijsTextBox" runat="server" Text='<%# Bind("regelprijs") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderstatusOrderstatusIDTextBox" runat="server" Text='<%# Bind("OrderstatusOrderstatusID") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
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
                                    <th runat="server">Tijd</th>
                                    <th runat="server">Besteltijd</th>
                                    <th runat="server">Reserveringsnummer</th>
                                    <th runat="server">KlantKlantID</th>
                                    <th runat="server">menugerechtnummer</th>
                                    <th runat="server">Omschrijving</th>
                                    <th runat="server">Prijs</th>
                                    <th runat="server">Hoeveelheid</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">regelprijs</th>
                                    <th runat="server">OrderstatusOrderstatusID</th>
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
                        <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
