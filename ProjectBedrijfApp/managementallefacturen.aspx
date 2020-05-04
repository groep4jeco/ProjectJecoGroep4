<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managementallefacturen.aspx.cs" Inherits="ProjectBedrijfApp.managementallefacturen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblkalender" runat="server" Text="Selecteer een dag"></asp:Label>
            <asp:Calendar ID="calendarTest" runat="server"></asp:Calendar>
            <asp:Button ID="BtnZoek" runat="server" OnClick="BtnZoek_Click" Text="Zoek" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="Factuurnummer" DataSourceID="SqlDataSource1" Enabled="False" ForeColor="#333333" OnLoad="DataList1_Load">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <ItemTemplate>
                    Factuurnummer:
                    <asp:Label ID="FactuurnummerLabel" runat="server" Text='<%# Eval("Factuurnummer") %>' />
                    <br />
                    KlantenpasEmail:
                    <asp:Label ID="KlantenpasEmailLabel" runat="server" Text='<%# Eval("KlantenpasEmail") %>' />
                    <br />
                    Factuurdatum:
                    <asp:Label ID="FactuurdatumLabel" runat="server" Text='<%# Eval("Factuurdatum") %>' />
                    <br />
                    Totaalbedrag:
                    <asp:Label ID="TotaalbedragLabel" runat="server" Text='<%# Eval("Totaalbedrag") %>' />
                    <br />
                    Reserveringsnummer:
                    <asp:Label ID="ReserveringsnummerLabel" runat="server" Text='<%# Eval("Reserveringsnummer") %>' />
                    <br />
                    KlantKlantID:
                    <asp:Label ID="KlantKlantIDLabel" runat="server" Text='<%# Eval("KlantKlantID") %>' />
                    <br />
                    ActieActienummer:
                    <asp:Label ID="ActieActienummerLabel" runat="server" Text='<%# Eval("ActieActienummer") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="select * from factuur where factuurdatum = '&quot; + test + &quot;'"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
