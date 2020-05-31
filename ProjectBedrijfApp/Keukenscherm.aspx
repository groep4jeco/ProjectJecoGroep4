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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [Bestelregel]" DeleteCommand="DELETE FROM [Bestelregel] WHERE [Bestelregelcode] = @Bestelregelcode" InsertCommand="INSERT INTO [Bestelregel] ([Hoeveelheid], [Besteltijd], [Reserveringsnummer], [menugerechtnummer], [RondeNummer], [Drankenartikelnummer], [bestelstatusID]) VALUES (@Hoeveelheid, @Besteltijd, @Reserveringsnummer, @menugerechtnummer, @RondeNummer, @Drankenartikelnummer, @bestelstatusID)" UpdateCommand="UPDATE [Bestelregel] SET [Hoeveelheid] = @Hoeveelheid, [Besteltijd] = @Besteltijd, [Reserveringsnummer] = @Reserveringsnummer, [menugerechtnummer] = @menugerechtnummer, [RondeNummer] = @RondeNummer, [Drankenartikelnummer] = @Drankenartikelnummer, [bestelstatusID] = @bestelstatusID WHERE [Bestelregelcode] = @Bestelregelcode">
            <DeleteParameters>
                <asp:Parameter Name="Bestelregelcode" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Hoeveelheid" Type="Single" />
                <asp:Parameter DbType="Time" Name="Besteltijd" />
                <asp:Parameter Name="Reserveringsnummer" Type="Int32" />
                <asp:Parameter Name="menugerechtnummer" Type="Int32" />
                <asp:Parameter Name="RondeNummer" Type="Int32" />
                <asp:Parameter Name="Drankenartikelnummer" Type="Int32" />
                <asp:Parameter Name="bestelstatusID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Hoeveelheid" Type="Single" />
                <asp:Parameter DbType="Time" Name="Besteltijd" />
                <asp:Parameter Name="Reserveringsnummer" Type="Int32" />
                <asp:Parameter Name="menugerechtnummer" Type="Int32" />
                <asp:Parameter Name="RondeNummer" Type="Int32" />
                <asp:Parameter Name="Drankenartikelnummer" Type="Int32" />
                <asp:Parameter Name="bestelstatusID" Type="Int32" />
                <asp:Parameter Name="Bestelregelcode" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemDeleted="ListView1_ItemDeleted" DataKeyNames="Bestelregelcode">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">Bestelregelcode:
                    <asp:Label ID="BestelregelcodeLabel" runat="server" Text='<%# Eval("Bestelregelcode") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    RondeNummer:
                    <asp:Label ID="RondeNummerLabel" runat="server" Text='<%# Eval("RondeNummer") %>' />
                    <br />
                    Drankenartikelnummer:
                    <asp:Label ID="DrankenartikelnummerLabel" runat="server" Text='<%# Eval("Drankenartikelnummer") %>' />
                    <br />
                    bestelstatusID:
                    <asp:Label ID="bestelstatusIDLabel" runat="server" Text='<%# Eval("bestelstatusID") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Bestelregelcode:
                    <asp:Label ID="BestelregelcodeLabel1" runat="server" Text='<%# Eval("Bestelregelcode") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Besteltijd:
                    <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    <br />
                    RondeNummer:
                    <asp:TextBox ID="RondeNummerTextBox" runat="server" Text='<%# Bind("RondeNummer") %>' />
                    <br />
                    Drankenartikelnummer:
                    <asp:TextBox ID="DrankenartikelnummerTextBox" runat="server" Text='<%# Bind("Drankenartikelnummer") %>' />
                    <br />
                    bestelstatusID:
                    <asp:TextBox ID="bestelstatusIDTextBox" runat="server" Text='<%# Bind("bestelstatusID") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Besteltijd:
                    <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    <br />
                    RondeNummer:
                    <asp:TextBox ID="RondeNummerTextBox" runat="server" Text='<%# Bind("RondeNummer") %>' />
                    <br />
                    Drankenartikelnummer:
                    <asp:TextBox ID="DrankenartikelnummerTextBox" runat="server" Text='<%# Bind("Drankenartikelnummer") %>' />
                    <br />
                    bestelstatusID:
                    <asp:TextBox ID="bestelstatusIDTextBox" runat="server" Text='<%# Bind("bestelstatusID") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">Bestelregelcode:
                    <asp:Label ID="BestelregelcodeLabel" runat="server" Text='<%# Eval("Bestelregelcode") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    RondeNummer:
                    <asp:Label ID="RondeNummerLabel" runat="server" Text='<%# Eval("RondeNummer") %>' />
                    <br />
                    Drankenartikelnummer:
                    <asp:Label ID="DrankenartikelnummerLabel" runat="server" Text='<%# Eval("Drankenartikelnummer") %>' />
                    <br />
                    bestelstatusID:
                    <asp:Label ID="bestelstatusIDLabel" runat="server" Text='<%# Eval("bestelstatusID") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr runat="server" id="itemPlaceholderContainer">
                        <td runat="server" id="itemPlaceholder">
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Bestelregelcode:
                    <asp:Label ID="BestelregelcodeLabel" runat="server" Text='<%# Eval("Bestelregelcode") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    RondeNummer:
                    <asp:Label ID="RondeNummerLabel" runat="server" Text='<%# Eval("RondeNummer") %>' />
                    <br />
                    Drankenartikelnummer:
                    <asp:Label ID="DrankenartikelnummerLabel" runat="server" Text='<%# Eval("Drankenartikelnummer") %>' />
                    <br />
                    bestelstatusID:
                    <asp:Label ID="bestelstatusIDLabel" runat="server" Text='<%# Eval("bestelstatusID") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [listviewonline]" InsertCommand="INSERT INTO [listviewonline] ([Tijd], [Besteltijd], [Reserveringsnummer], [KlantKlantID], [menugerechtnummer], [Omschrijving], [Prijs], [Hoeveelheid], [Email], [regelprijs], [OrderstatusOrderstatusID]) VALUES (@Tijd, @Besteltijd, @Reserveringsnummer, @KlantKlantID, @menugerechtnummer, @Omschrijving, @Prijs, @Hoeveelheid, @Email, @regelprijs, @OrderstatusOrderstatusID)">
            <InsertParameters>
                <asp:Parameter DbType="Time" Name="Tijd" />
                <asp:Parameter DbType="Time" Name="Besteltijd" />
                <asp:Parameter Name="Reserveringsnummer" Type="Int32" />
                <asp:Parameter Name="KlantKlantID" Type="Int32" />
                <asp:Parameter Name="menugerechtnummer" Type="Int32" />
                <asp:Parameter Name="Omschrijving" Type="String" />
                <asp:Parameter Name="Prijs" Type="Single" />
                <asp:Parameter Name="Hoeveelheid" Type="Single" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="regelprijs" Type="Decimal" />
                <asp:Parameter Name="OrderstatusOrderstatusID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">Tijd:
                    <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    Prijs:
                    <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    <br />
                    regelprijs:
                    <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    <br />
                    OrderstatusOrderstatusID:
                    <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Tijd:
                    <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    <br />
                    Besteltijd:
                    <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:TextBox ID="KlantKlantIDTextBox" runat="server" Text='<%# Bind("KlantKlantID") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    <br />
                    Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />
                    Prijs:
                    <asp:TextBox ID="PrijsTextBox" runat="server" Text='<%# Bind("Prijs") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    regelprijs:
                    <asp:TextBox ID="regelprijsTextBox" runat="server" Text='<%# Bind("regelprijs") %>' />
                    <br />
                    OrderstatusOrderstatusID:
                    <asp:TextBox ID="OrderstatusOrderstatusIDTextBox" runat="server" Text='<%# Bind("OrderstatusOrderstatusID") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Tijd:
                    <asp:TextBox ID="TijdTextBox" runat="server" Text='<%# Bind("Tijd") %>' />
                    <br />
                    Besteltijd:
                    <asp:TextBox ID="BesteltijdTextBox" runat="server" Text='<%# Bind("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:TextBox ID="ReserveringsnummerTextBox" runat="server" Text='<%# Bind("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:TextBox ID="KlantKlantIDTextBox" runat="server" Text='<%# Bind("KlantKlantID") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:TextBox ID="menugerechtnummerTextBox" runat="server" Text='<%# Bind("menugerechtnummer") %>' />
                    <br />
                    Omschrijving:
                    <asp:TextBox ID="OmschrijvingTextBox" runat="server" Text='<%# Bind("Omschrijving") %>' />
                    <br />
                    Prijs:
                    <asp:TextBox ID="PrijsTextBox" runat="server" Text='<%# Bind("Prijs") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:TextBox ID="HoeveelheidTextBox" runat="server" Text='<%# Bind("Hoeveelheid") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    regelprijs:
                    <asp:TextBox ID="regelprijsTextBox" runat="server" Text='<%# Bind("regelprijs") %>' />
                    <br />
                    OrderstatusOrderstatusID:
                    <asp:TextBox ID="OrderstatusOrderstatusIDTextBox" runat="server" Text='<%# Bind("OrderstatusOrderstatusID") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">Tijd:
                    <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    Prijs:
                    <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    <br />
                    regelprijs:
                    <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    <br />
                    OrderstatusOrderstatusID:
                    <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr runat="server" id="itemPlaceholderContainer">
                        <td runat="server" id="itemPlaceholder">
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Tijd:
                    <asp:Label ID="TijdLabel" runat="server" Text='<%# Eval("Tijd") %>' />
                    <br />
                    Besteltijd:
                    <asp:Label ID="BesteltijdLabel" runat="server" Text='<%# Eval("Besteltijd") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    <br />
                    menugerechtnummer:
                    <asp:Label ID="menugerechtnummerLabel" runat="server" Text='<%# Eval("menugerechtnummer") %>' />
                    <br />
                    Omschrijving:
                    <asp:Label ID="OmschrijvingLabel" runat="server" Text='<%# Eval("Omschrijving") %>' />
                    <br />
                    Prijs:
                    <asp:Label ID="PrijsLabel" runat="server" Text='<%# Eval("Prijs") %>' />
                    <br />
                    Hoeveelheid:
                    <asp:Label ID="HoeveelheidLabel" runat="server" Text='<%# Eval("Hoeveelheid") %>' />
                    <br />
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    <br />
                    regelprijs:
                    <asp:Label ID="regelprijsLabel" runat="server" Text='<%# Eval("regelprijs") %>' />
                    <br />
                    OrderstatusOrderstatusID:
                    <asp:Label ID="OrderstatusOrderstatusIDLabel" runat="server" Text='<%# Eval("OrderstatusOrderstatusID") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
