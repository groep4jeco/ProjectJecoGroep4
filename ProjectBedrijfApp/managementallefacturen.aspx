<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managementallefacturen.aspx.cs" Inherits="ProjectBedrijfApp.managementallefacturen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 304px;
        }
    </style>
</head>
<body style="height: 567px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblkalender" runat="server" Text="Selecteer een dag"></asp:Label>
            <asp:Calendar ID="calendarTest" runat="server" SelectedDate="05/05/2020 14:40:41"></asp:Calendar>
            <asp:Button ID="BtnZoek" runat="server" OnClick="BtnZoek_Click" Text="Zoek" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [Factuur] WHERE ([Factuurdatum] = @Factuurdatum)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="calendarTest" DbType="Date" Name="Factuurdatum" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Factuurnummer" DataSourceID="SqlDataSource1" OnLoad="GridView1_Load" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Factuurnummer" HeaderText="Factuurnummer" InsertVisible="False" ReadOnly="True" SortExpression="Factuurnummer" />
                        <asp:BoundField DataField="KlantenpasEmail" HeaderText="KlantenpasEmail" SortExpression="KlantenpasEmail" />
                        <asp:BoundField DataField="Factuurdatum" HeaderText="Factuurdatum" SortExpression="Factuurdatum" />
                        <asp:BoundField DataField="Totaalbedrag" HeaderText="Totaalbedrag" SortExpression="Totaalbedrag" />
                        <asp:BoundField DataField="Reserveringsnummer" HeaderText="Reserveringsnummer" SortExpression="Reserveringsnummer" />
                        <asp:BoundField DataField="KlantKlantID" HeaderText="KlantKlantID" SortExpression="KlantKlantID" />
                        <asp:BoundField DataField="ActieActienummer" HeaderText="ActieActienummer" SortExpression="ActieActienummer" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [omschrijving], [prijs], [hoeveelheid], [besteltijd], [rondenummer] FROM [listviewfactuur] WHERE ([Factuurnummer] = @Factuurnummer)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="Factuurnummer" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Panel ID="Panel2" runat="server" Height="546px">
                    <asp:Label ID="Label2" runat="server" Text="Bedankt dat u heeft gekozen om bij ons te komen eten."></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="omschrijving" HeaderText="omschrijving" SortExpression="omschrijving" />
                            <asp:BoundField DataField="prijs" HeaderText="prijs" SortExpression="prijs" />
                            <asp:BoundField DataField="hoeveelheid" HeaderText="hoeveelheid" SortExpression="hoeveelheid" />
                            <asp:BoundField DataField="besteltijd" HeaderText="besteltijd" SortExpression="besteltijd" />
                            <asp:BoundField DataField="rondenummer" HeaderText="rondenummer" ReadOnly="True" SortExpression="rondenummer" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                </asp:Panel>
                <asp:Button ID="btnSluit" runat="server" OnClick="Button1_Click" Text="Sluiten" />
                <br />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
