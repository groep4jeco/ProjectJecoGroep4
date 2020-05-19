 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveringPagina.aspx.cs" Inherits="ProjectBedrijfApp.ReserveringPagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 137px">
            <asp:Label ID="Label1" runat="server" Text="Tijdvlak"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton1_CheckedChanged" Text="17:00-19:30" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton2_CheckedChanged" Text="19:30-22:00" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Aantal Personen"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ReserverTafel" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
        <asp:CheckBox ID="cbAlles" runat="server" Text="All you can Eat" />
        <br />
        <asp:TextBox ID="txtRondes" runat="server" Visible="False">Aantal rondes</asp:TextBox>
        <asp:RangeValidator ID="RvRondes" runat="server" ControlToValidate="txtRondes" ErrorMessage="RangeValidator" MaximumValue=" 0" MinimumValue="10" Type="Integer"></asp:RangeValidator>
        <asp:Label ID="lbldatum" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblVoornaam" runat="server" Text="Voornaam"></asp:Label>
        <br />
        <asp:TextBox ID="txtVoornaam" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblAchternaam" runat="server" Text="Achternaam"></asp:Label>
        <br />
        <asp:TextBox ID="txtAchternaam" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="BtnZoek" runat="server" OnClick="BtnZoek_Click" Text="Zoek klant" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="KlantID" DataSourceID="sqlKlant" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="KlantID" HeaderText="KlantID" InsertVisible="False" ReadOnly="True" SortExpression="KlantID" />
                <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sqlKlant" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [KlantID], [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE (([Voornaam] = @Voornaam) AND ([Achternaam] = @Achternaam))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtVoornaam" Name="Voornaam" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtAchternaam" Name="Achternaam" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
