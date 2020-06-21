<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApartBestellen_overzicht.aspx.cs" Inherits="ProjectBedrijfApp.ApartBestellen_overzicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        #btnTerug {
            margin-right: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Aantal producten:" Font-Size="X-Large"></asp:Label>
&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="X-Large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="363px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Width="700px" DataKeyNames="Hoeveelheid,Gerechtnummer,Prijs">
                <Columns>
                    <asp:BoundField DataField="sno" />
                    <asp:ImageField DataImageUrlField="afb_pad">
                        <ControlStyle Height="50px" Width="50px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Gerechtnummer" HeaderText="Nummer">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Omschrijving" HeaderText="Gerecht">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Prijs" HeaderText="Prijs">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Hoeveelheid" HeaderText="Hoeveelheid">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="totalprice" HeaderText="Totale Prijs">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="Verwijder" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Height="50px" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:Button ID="btnTerug" runat="server" Font-Size="Large" Height="50px" Text="Terug" Width="200px" OnClick="btnTerug_Click" />
            <asp:Button ID="btnBevestig" runat="server" Font-Bold="True" Font-Size="Large" Height="50px" Text="Bevestig" Width="349px" OnClick="btnBevestig_Click" />
        </div>
    </form>
</body>
</html>
