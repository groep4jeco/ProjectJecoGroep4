<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="betalen.aspx.cs" Inherits="ProjectBedrijfApp.betalen2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        @media print {
            @page {  margin: 0;}
        }
         body  { margin: 1.6cm;
          height: auto;
          overflow: hidden;
          position: fixed;
     

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
    }
        .auto-style1 {
            width: 268px;
            height: 295px;
        }
        .auto-style2 {
            width: 268px;
            height: 103px;
        }
        .auto-style3 {
            width: 140px;
            height: 103px;
        }
        .auto-style4 {
            width: 1136px;
            height: 295px;
        }
        .auto-style5 {
            width: 90px;
            height: 83px;
        }
        .auto-style6 {
            width: 32px;
            height: 29px;
        }
        .auto-style7 {
            width: 29px;
            height: 31px;
        }
        .auto-style8 {
            width: 130px;
            height: 87px;
        }
        .auto-style9 {
            width: 89px;
            height: 64px;
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
            &nbsp;<asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1" runat="server">

                    &nbsp;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style5" src="images/image%20cash.jpg" />
                    <br />
                    <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" CssClass="auto-style2" DataSourceID="SqlDataSource1" Height="240px" margin-left="auto" margin-right="auto" Width="342px">
                        <EditItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbetaalbedrag:
                            <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="LightSlateGray" Font-Bold="True" ForeColor="#E7E7FF" />
                        <InsertItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbetaalbedrag:
                            <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                            Totaalbetaalbedrag:
                            <asp:Label ID="TotaalbetaalbedragLabel" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
                            <br />
                        </ItemTemplate>
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    </asp:FormView>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand= "SELECT [KlantenpasEmail], [Factuurdatum], CAST(sum(Totaalbedrag - ISNULL(Betaaldbedrag, 0)) AS decimal(7,2)) AS Totaalbetaalbedrag FROM Factuur WHERE ([Factuurnummer] = @Factuurnummer)
group by KlantenpasEmail, Factuurdatum">
                        <SelectParameters>
                            <asp:SessionParameter Name="Factuurnummer" SessionField="factuurnummer" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Terug" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [Factuurnummer] FROM [Factuur] WHERE ([Factuurnummer] = @Factuurnummer)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Factuurnummer" SessionField="factuurnummer" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style7" src="images/euro%20teken.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="BtnCash1" runat="server" Text="Betalen" OnClick="BtnCash1_Click" Width="159px" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    &nbsp;<div class="auto-style4">
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img alt="" class="auto-style9" src="images/meastro%20teken.png" />
                        <br />
                        <br />
                        <asp:FormView ID="FormView2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" CssClass="auto-style3" DataSourceID="SqlDataSource1" Height="240px" Width="343px">
                            <EditItemTemplate>
                                KlantenpasEmail:
                                <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                                <br />
                                Factuurdatum:
                                <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                                <br />
                                Totaalbetaalbedrag:
                                <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                                Totaalbetaalbedrag:
                                <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                                Totaalbetaalbedrag:
                                <asp:Label ID="TotaalbetaalbedragLabel" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Terug" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" class="auto-style6" src="images/euro%20teken.png" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Width="127px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnMaestro" runat="server" Text="Betalen" Width="159px" OnClick="btnMaestro_Click" />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    &nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style8" src="images/mastercard-casinos-750x400.jpg" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:FormView ID="FormView3" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" CssClass="auto-style3" DataSourceID="SqlDataSource1" Height="240px" Width="341px">
                        <EditItemTemplate>
                            KlantenpasEmail:
                            <asp:TextBox ID="KlantenpasEmailTextBox" runat="server" Text='<%# Bind("KlantenpasEmail") %>' />
                            <br />
                            Factuurdatum:
                            <asp:TextBox ID="FactuurdatumTextBox" runat="server" Text='<%# Bind("Factuurdatum") %>' />
                            <br />
                            Totaalbetaalbedrag:
                            <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                            Totaalbetaalbedrag:
                            <asp:TextBox ID="TotaalbetaalbedragTextBox" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
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
                            Totaalbetaalbedrag:
                            <asp:Label ID="TotaalbetaalbedragLabel" runat="server" Text='<%# Bind("Totaalbetaalbedrag") %>' />
                            <br />
                        </ItemTemplate>
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    </asp:FormView>
                    <br />
                    <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Terug" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <img alt="" class="auto-style7" src="images/euro%20teken.png" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    &nbsp;
                     <asp:Button ID="BtnbetaalMC" runat="server" Text="Betalen" Height="26px" Width="159px" OnClick="btnMaestro_Click" />
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </asp:View>


            </asp:MultiView>
        </div>

    </form>
</body>
</html>
