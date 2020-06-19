<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="betalen.aspx.cs" Inherits="ProjectBedrijfApp.betalen2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        @page print 

        {
            margin: 0;
        }

     

        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            margin-left: 512px;
        }

        .auto-style3 {
            margin-left: 511px;
        }

        .auto-style4 {
            width: 104px;
            height: 55px;
        }

        .auto-style5 {
            width: 104px;
            height: 51px;
        }

        .auto-style6 {
            width: 112px;
            height: 51px;
        }

        .auto-style7 {
            width: 22px;
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="39px" Width="234px">
                <asp:ListItem Value="0">Cash</asp:ListItem>
                <asp:ListItem Value="1">Maestro</asp:ListItem>
                <asp:ListItem Value="2">Mastercard</asp:ListItem>

            </asp:DropDownList>
            <asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1" runat="server">
                    <asp:Label ID="lblfactuurCash" runat="server" Text="Label"></asp:Label>

                    &nbsp;<br />
                    <br />
                    <img alt="" class="auto-style5" src="images/image%20cash.jpg" />
                    <br />
                    <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" margin-left="auto" margin-right="auto" CssClass="auto-style2" Height="240px" Width="342px">
                        <EditItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />

                        <InsertItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            KlantenpasEmail:
                            <asp:Label ID="KlantenpasEmailLabel" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:Label ID="FactuurdatumLabel" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:Label ID="TotaalbedragLabel" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                        </ItemTemplate>
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    </asp:FormView>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [KlantenpasEmail], [Factuurdatum], [Totaalbedrag] FROM [Factuur]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button ID="btnprint" runat="server" Text="Bon printen " />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style7" src="images/euro%20teken.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="BtnCash1" runat="server" Text="Betalen" OnClick="BtnCash1_Click" Width="159px" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:Label ID="lblfactuurMaestro" runat="server" Text="Label"></asp:Label>
                    &nbsp;<div class="auto-style1">
                        <br />
                        <br />
                        <img alt="" class="auto-style4" src="images/meastro%20teken.png" />
                        <br />
                        <asp:FormView ID="FormView2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" Width="343px" CssClass="auto-style3" Height="240px">
                            <EditItemTemplate>
                                KlantenpasEmail:
                                <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                Factuurdatum:
                                <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                Totaalbedrag:
                                <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <InsertItemTemplate>
                                KlantenpasEmail:
                                <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                Factuurdatum:
                                <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                Totaalbedrag:
                                <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                KlantenpasEmail:
                                <asp:Label ID="KlantenpasEmailLabel" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                Factuurdatum:
                                <asp:Label ID="FactuurdatumLabel" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                Totaalbedrag:
                                <asp:Label ID="TotaalbedragLabel" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                                <br />
                            </ItemTemplate>
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        </asp:FormView>
                        &nbsp;
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Button ID="btnprinten" runat="server" Text="Bon Printen" />
                    &nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style7" src="images/euro%20teken.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnMaestro" runat="server" Text="Betalen" Width="159px" />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:Label ID="lblfactuurMC" runat="server" Text="Label"></asp:Label>
                    &nbsp;<br />
                    <img alt="" class="auto-style6" src="images/mastercard-casinos-750x400.jpg" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:FormView ID="FormView3" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" Height="240px" Width="341px" CssClass="auto-style3">
                        <EditItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <InsertItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:TextBox ID="TotaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            KlantenpasEmail:
                            <asp:Label ID="KlantenpasEmailLabel" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:Label ID="FactuurdatumLabel" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbedrag:
                            <asp:Label ID="TotaalbedragLabel" runat="server" Text='<%# Bind("Totaalbedrag") %>' />
                            <br />
                        </ItemTemplate>
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    </asp:FormView>
                    <br />
                    <br />
                    <asp:Button ID="btnmcprinten" runat="server" Text="Bon printen" OnClientClick="window.print()" OnClick="btnmcprinten_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style7" src="images/euro%20teken.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    &nbsp;
                     <asp:Button ID="BtnbetaalMC" runat="server" Text="Betalen" Height="26px" Width="159px" />
                </asp:View>


            </asp:MultiView>
        </div>

    </form>
</body>
</html>
