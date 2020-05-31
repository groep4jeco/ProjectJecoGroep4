<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveringPagina.aspx.cs" Inherits="ProjectBedrijfApp.ReserveringPagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container1 {
            background-color: seashell;
            text-align: center;
            display: inline-block;
            border-left-width: 900px;
            float: left;
            border-top: thick;
            margin-left:300px;
            height:660px;
        }

        #form1 {
            background-color: lightslategray;
            height: 940px;
        }

        .container2 {
            float: unset;
            background-color: seashell;
            margin-left: 1100px;
            height:638px;
            margin-right: 300px;
            width: 550px;
            text-align:center;
        }

        .knop1 {
            position: center;
        }

       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container1" style="align-self: center; height: 638px; width: 550px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <br />
            <br />
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Tijdvlak"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton1_CheckedChanged" Text="17:00-19:30" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton2_CheckedChanged" Text="19:30-22:00" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblVolwassenen" runat="server" Text="Aantal volwassenen"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtVolw" ErrorMessage="Dit is een verplicht veld."></asp:RequiredFieldValidator>
            
            <asp:TextBox ID="TxtVolw" runat="server" OnTextChanged="TxtVolw_TextChanged" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="lblKind" runat="server" Text="Aantal kinderen"></asp:Label>
            <asp:TextBox ID="TxtKind" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtVolw" ErrorMessage="Aantal personen mag niet lager zijn dan 0 of hoger dan 160" MaximumValue="160" MinimumValue="0"></asp:RangeValidator>
            <br />
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TxtKind" ErrorMessage="Aantal personen mag niet lager zijn dan 0 of hoger dan 160" MaximumValue="159" MinimumValue="0"></asp:RangeValidator>
            <br />
            <asp:Button ID="BtnTerug" runat="server" Text="Vorige pagina" />
            <br />
            <br />
            <asp:CheckBox ID="cbAlles" runat="server" Text="All you can Eat" OnCheckedChanged="cbAlles_CheckedChanged" AutoPostBack="True" />
            <br />
            <br />
            <asp:Label ID="lblRondes" runat="server" Text="Aantal rondes" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtRondes" runat="server" Visible="False" Height="30px" OnTextChanged="txtRondes_TextChanged" TextMode="Number" ToolTip="Voer hier het aantal rondes in"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <div class="knop1">
               <asp:Button ID="BtnClick" runat="server" OnClick="Button1_Click" Text="Reserveer Tafel" Height="47px" Width="117px" Font-Bold="True" Font-Italic="True" />
           </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <div class="container2">
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <div class="img1">
                &nbsp;</div>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="lbldatum" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVoornaam" ErrorMessage="Dit is een verplicht veld."></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblVoornaam" runat="server" Text="Voornaam*"></asp:Label>
            <br />
            <asp:TextBox ID="txtVoornaam" runat="server" OnTextChanged="txtVoornaam_TextChanged"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAchternaam" ErrorMessage="Dit is een verplicht veld."></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblAchternaam" runat="server" Text="Achternaam*"></asp:Label>
            <br />
            <asp:TextBox ID="txtAchternaam" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblSorry" runat="server"></asp:Label>
            <br />
            <asp:Button ID="BtnZoek" runat="server" OnClick="BtnZoek_Click" Text="Zoek klant" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="KlantID" DataSourceID="sqlKlant" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnDataBound="GridView1_DataBound" OnLoad="GridView1_Load" OnPageIndexChanged="GridView1_PageIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="KlantID" HeaderText="KlantID" InsertVisible="False" ReadOnly="True" SortExpression="KlantID" />
                    <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                    <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Telefoonnummer" HeaderText="Telefoonnummer" SortExpression="Telefoonnummer" />
                </Columns>
            </asp:GridView>
                <asp:Button ID="btnNieuw" runat="server" OnClick="btnNieuw_Click" Text="Nieuwe klant" Visible="False" />
                <br />
            <asp:SqlDataSource ID="sqlKlant" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT [KlantID], [Voornaam], [Achternaam], [Email], [Telefoonnummer] FROM [Klant] WHERE (([Voornaam] = @Voornaam) OR ([Achternaam] = @Achternaam))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtVoornaam" Name="Voornaam" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtAchternaam" Name="Achternaam" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <asp:Label ID="lbltelefoon" runat="server" Text="Telefoonnummer" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="Txttelefoon" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="lblEmail" runat="server" Text="Emailadres" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="TxtEmail" runat="server" Visible="False"></asp:TextBox>

    </form>
</body>
</html>
