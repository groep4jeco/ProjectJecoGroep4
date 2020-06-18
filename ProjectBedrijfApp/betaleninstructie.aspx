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
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            margin-top: 10px;
        }

        .body
        {
            background-color: lightslategray;
        }
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
            <table class="auto-style1">
                <tr>
                    <td>
                        tafelnummer:
                        <br />
                        <asp:TextBox ID="txtinvoeremail" runat="server" CssClass="auto-style4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" Height="147px" Width="405px">
                            <EditItemTemplate>
                                Totaalbedrag:
                                <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                                Factuurdatum:
                                <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                KlantenpasEmail:
                                <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                Totaalbedrag:
                                <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                                Factuurdatum:
                                <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                KlantenpasEmail:
                                <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                Totaalbedrag:
                                <asp:Label ID="TotaalbedragLabel" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                                Factuurdatum:
                                <asp:Label ID="FactuurdatumLabel" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                KlantenpasEmail:
                                <asp:Label ID="KlantenpasEmailLabel" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />

                            </ItemTemplate>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [Totaalbedrag], [Factuurdatum], [KlantenpasEmail] FROM [Factuur]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Korting:<br />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Betalen" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
