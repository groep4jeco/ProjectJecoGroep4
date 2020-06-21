<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="betaleninstructie.aspx.cs" Inherits="ProjectBedrijfApp.betaleninstructie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 32%;
            height: 369px;
            margin-left: 428px;
        }
        .auto-style2 {
            height: 97px;
            background-color: seashell;
        }
        .auto-style3 {
            text-align: center;
            background-color:lightslategray;
        }
        .auto-style4 {
            margin-top: 10px;
        }

        .body
        {
            background-color: lightslategray;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style8 {
            width: 113px;
        }
        .auto-style9 {
            width: 223px;
        }
        .auto-style10 {
            width: 157px;
        }
        .
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Betalen"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" BackColor="White" Font-Size="X-Large" Text="Betaal pagina Jeco Sushi"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table class="auto-style1">
                <tr>
                    <td>
                        tafelnummer:
                        <asp:TextBox ID="txttafelnummer" runat="server" CssClass="auto-style4" OnTextChanged="txttafelnummer_TextChanged"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttafelnummer" ErrorMessage="Vul een geldig tafelnummer in"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblValidator" runat="server" Enabled="False" Text="Deze tafel is niet gereserveerd" Visible="False"></asp:Label>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnzoekfactuur" runat="server" Text="zoek factuur" OnClick="btnzoekfactuur_Click" BackColor="#FFCCCC" />
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Selecteer factuur" BackColor="#FF9999" BorderColor="#FF5050" Width="113px" />
                        <br />
                        <asp:Label ID="lblSelecteer" runat="server" Text="Zoek eerst een factuur op"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" role="document">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Factuurnummer,Restaurant ID,KlantKlantID" DataSourceID="SqlDataSource1" Height="171px" Width="430px">
                            <Columns>
                                <asp:BoundField DataField="Factuurnummer" HeaderText="Factuurnummer" SortExpression="Factuurnummer" />
                                <asp:BoundField DataField="KlantenpasEmail" HeaderText="KlantenpasEmail" SortExpression="KlantenpasEmail" />
                                <asp:BoundField DataField="Factuurdatum" HeaderText="Factuurdatum" SortExpression="Factuurdatum" />
                                <asp:BoundField DataField="Totaalbedrag" HeaderText="Totaalbedrag" SortExpression="Totaalbedrag" />
                                <asp:BoundField DataField="Reserveringsnummer" HeaderText="Reserveringsnummer" SortExpression="Reserveringsnummer" />
                                <asp:BoundField DataField="KlantKlantID" HeaderText="KlantKlantID" SortExpression="KlantKlantID" />
                                <asp:BoundField DataField="Restaurant ID" HeaderText="Restaurant ID" SortExpression="Restaurant ID" />
                                <asp:BoundField DataField="Restaurant ID" HeaderText="Restaurant ID" SortExpression="Restaurant ID" Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style10">Volwassene</td>
                                <td class="auto-style8">
                                    <asp:Label ID="lblAantalVolw" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotVolw" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Kind</td>
                                <td class="auto-style8">
                                    <asp:Label ID="LblAantalKind" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotKind" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="prijs,hoeveelheid" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="omschrijving" HeaderText="omschrijving" SortExpression="omschrijving" />
                                <asp:BoundField DataField="hoeveelheid" HeaderText="hoeveelheid" SortExpression="hoeveelheid" />
                                <asp:BoundField DataField="prijs" HeaderText="prijs" SortExpression="prijs" />
                                <asp:BoundField DataField="rondenummer" HeaderText="rondenummer" ReadOnly="True" SortExpression="rondenummer" />
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="hoeveelheid,Prijs" DataSourceID="drankenfactureren" Width="334px">
                            <Columns>
                                <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
                                <asp:BoundField DataField="hoeveelheid" HeaderText="hoeveelheid" SortExpression="hoeveelheid" />
                                <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style9">Factuurtotaal exclusief btw</td>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">btw bedrag</td>
                                <td>
                                    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">factuurtotaal inclusief btw</td>
                                <td>
                                    <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [omschrijving], [hoeveelheid], [prijs], [rondenummer] FROM [listviewfactuur] WHERE ([Factuurnummer] = @Factuurnummer)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Factuurnummer" SessionField="factuurnummer" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                <asp:SqlDataSource ID="drankenfactureren" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [Omschrijving], [hoeveelheid], [Prijs] FROM [factuurdrank] WHERE ([Factuurnummer] = @Factuurnummer)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Factuurnummer" SessionField="factuurnummer" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [listviewGeenidee] WHERE ([Reserveringsnummer] = @Reserveringsnummer)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Reserveringsnummer" SessionField="Tafel" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td role="article">Korting:<br />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnkorting" runat="server" OnClick="Button3_Click" Text="Kortings code toevoegen" BackColor="#669999" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Betalen" BackColor="#669999" BorderColor="#006666" BorderStyle="Outset" Width="246px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
