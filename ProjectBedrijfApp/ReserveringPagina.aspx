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
            margin-left: 100px;
            height: 660px;
        }

        #form1 {
            background-color: lightslategray;
            height: 940px;
        }

        .container2 {
            float: unset;
            background-color: seashell;
            margin-left: 900px;
            height: 638px;
            margin-right: 100px;
            width: 550px;
            text-align: center;
        }

        .knop1 {
            position: center;
            margin-left: 600px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container1" style="align-self: center; height: 638px; width: 550px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <br />
            <br />
            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="selecteer een tijdvak" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Tijd vak"></asp:Label>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton1_CheckedChanged" Text="17:00-19:30" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Tijdvak" OnCheckedChanged="RadioButton2_CheckedChanged" Text="19:30-22:00" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblVolwassenen" runat="server" Text="Aantal volwassenen"></asp:Label>
            <br />
            <br />
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtVolw" ErrorMessage="Dit is een verplicht veld." Visible="False"></asp:RequiredFieldValidator>

            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtVolw" ErrorMessage="De invoer is onjuist." MaximumValue="159" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtVolw" Enabled="False" ErrorMessage="Voer hier een getal in." ValidationExpression="^e[0-9]"></asp:RegularExpressionValidator>
            <br />

            <asp:TextBox ID="TxtVolw" runat="server" OnTextChanged="TxtVolw_TextChanged" TextMode="Number"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtVolw" ErrorMessage="Allen getallen toegestaan" ValidationExpression="^[1-9]\d?$"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="lblKind" runat="server" Text="Aantal kinderen"></asp:Label>
            <br />
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TxtKind" ErrorMessage="De invoer is onuist." MaximumValue="157" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:TextBox ID="TxtKind" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TxtKind" ErrorMessage="Alleen getallen toegestaan" ValidationExpression="^[1-9]\d?$"></asp:RegularExpressionValidator>
            <br />
            <asp:CustomValidator ID="perosnenteveel" runat="server" ErrorMessage="Maximaal twee personen per tafel toegestaan. Selecteer meer tafels of minder personen" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            <br />
            <asp:CheckBox ID="cbAlles" runat="server" Text="All you can Eat arrangementen" OnCheckedChanged="cbAlles_CheckedChanged" AutoPostBack="True" />
            <br />
            <br />
            <asp:Label ID="lblRondes" runat="server" Text="Aantal arrangement" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtRondes" runat="server" Visible="False" Height="30px" OnTextChanged="txtRondes_TextChanged" TextMode="Number" ToolTip="Voer hier het aantal rondes in"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RangeValidator ID="rangearrangement" runat="server" ControlToValidate="txtRondes" ErrorMessage="Arregementen kunnen niet lager zijn dan 0" MaximumValue="159" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Aantal arregementen kan niet meer zijn dan aantal personen" OnServerValidate="CustomValidator1_ServerValidate1"></asp:CustomValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtRondes" ErrorMessage="Alleen getallen toegestaan." ValidationExpression="^[1-9]\d?$"></asp:RegularExpressionValidator>
             <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Button1" runat="server" Text="Vorige pagina" BackColor="Gray" OnClick="Button1_Click1" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="knop1">
               <asp:Button ID="BtnClick" runat="server" OnClick="Button1_Click" Text="Reserveer Tafel" Height="47px" Width="159px" Font-Bold="True" Font-Italic="True" />
           </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
        <div class="container2">
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <div class="img1">
                &nbsp;
            </div>
            <asp:CustomValidator ID="Selecteereenklant" runat="server" ErrorMessage="Selecteer een klant" OnServerValidate="Selecteereenklant_ServerValidate"></asp:CustomValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="lbldatum" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVoornaam" ErrorMessage="Dit is een verplicht veld."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtVoornaam" Enabled="False" ErrorMessage="Gebruik enkel letters" ValidationExpression="[a-z][A-Z]"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblVoornaam" runat="server" Text="Voornaam*"></asp:Label>
            <br />
            <asp:TextBox ID="txtVoornaam" runat="server" OnTextChanged="txtVoornaam_TextChanged"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtVoornaam" ErrorMessage="Alleen letters toegestaan." ValidationExpression="^[A-Z]*[a-z]*$"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAchternaam" ErrorMessage="Dit is een verplicht veld."></asp:RequiredFieldValidator>

            <br />
            <asp:Label ID="lblAchternaam" runat="server" Text="Achternaam*"></asp:Label>
            <br />
            <asp:TextBox ID="txtAchternaam" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtAchternaam" ErrorMessage="Alleen letters toegestaan" ValidationExpression="^[A-Z][a-z]$"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Txttelefoon" Enabled="False" ErrorMessage="Invoer is onjuist." ValidationExpression="(0( \d|\d ))?\d\d \d\d(\d \d| \d\d )\d\d"></asp:RegularExpressionValidator>
            <asp:Label ID="lbltelefoon" runat="server" Text="Telefoonnummer" Visible="False"></asp:Label>
            <br />
            &nbsp;<asp:TextBox ID="Txttelefoon" runat="server" Visible="False" OnTextChanged="Txttelefoon_TextChanged1"></asp:TextBox>
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Emailadres" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
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

        <br />

        <br />
        <br />
        <br />
       

    </form>
</body>
</html>
