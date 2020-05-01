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

 

(select CAST(SUM(regelprijs)AS decimal (10,2)) from listview111

Where tafeltafelnummer =

 

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY)),

 

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
set Totaalbedrag = Totaalbedrag + (select CAST(SUM(regelprijs)AS decimal (10,2)) 
from listview111
Where tafeltafelnummer =

 (select tafeltafelnummer from Listview4
 group by tafeltafelnummer, besteltijd, bestelstatusid
 ORDER BY besteltijd asc
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY))
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
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
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
    </form>
</body>
</html>
