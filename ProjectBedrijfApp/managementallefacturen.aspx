<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="managementallefacturen.aspx.cs" Inherits="ProjectBedrijfApp.managementallefacturen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        .calendarTest {
            position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: 'Poppins', sans-serif;
  background: url("https://cdn.discordapp.com/attachments/684406382845362212/709334204642492506/Logo1.png") no-repeat center / cover;
        }
        .dagenvandeweek{
            
        }
        .dagen {

        }
        .Bovenkant {
             position: relative;
  height: 200px;
  padding: 20px;
  width: 200px;
  color: #fff;
  background: #262626 url("https://cdn.discordapp.com/attachments/684406382845362212/709334204642492506/Logo1.png") no-repeat center / cover;
  text-shadow: 0 2px 2px rgba(#000, 0.2);
  box-sizing: border-box;

  &::before {
    content: "";
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    position: absolute;
    background: linear-gradient(to top, rgba(#000, 0.25), rgba(#000, 0.1));
  }
  
  h2 {
    margin: 0;
  }
  
  h3 {
    margin: 0;
    font-weight: 500;
  }
        }

..dagen, .Weekend{
 display: flex;
  align-items: center;
  justify-content: center;
  height: 25px;
  color: #262626;

  &:nth-child(7n) {
    color: #ff685d;
    font-weight: 700;
  }
  
  &--current,
  &:hover {
    background-color: #009688;
    color: #fff !important;
    font-weight: 700;
    cursor: pointer;
  }
}
  }
}

.dagenvandeweek{
     padding: 20px;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(25px, 1fr));
  grid-gap: 10px;
  box-sizing: border-box;

}




        .container1 {
        }

        #form1 {

        }

        .bon {
        }
    </style>
</head>
<body style="height: 567px">
    <form id="form1" runat="server">
        <div class="kalender">
            <asp:Calendar ID="calendarTest" runat="server" OnSelectionChanged="calendarTest_SelectionChanged" Width="400px">
                <DayHeaderStyle CssClass="dagenvandeweek" />
                <DayStyle CssClass="dagen" />
                <NextPrevStyle CssClass="Pijltjesmaand" />
                <SelectedDayStyle CssClass="Geselecteerdedag" />
                <TitleStyle CssClass="Bovenkant" />
                <TodayDayStyle CssClass="Vandaag" />
                <WeekendDayStyle CssClass="Weekend" />
            </asp:Calendar>
        </div>
        <br />
        <div class="container1">
            <asp:Button ID="BtnZoek" runat="server" OnClick="BtnZoek_Click" Text="Zoek" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="SELECT * FROM [listviewGeenidee] WHERE ([Factuurdatum] = @Factuurdatum)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="calendarTest" DbType="Date" Name="Factuurdatum" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Factuurnummer,Restaurant ID,KlantKlantID" DataSourceID="SqlDataSource1" OnLoad="GridView1_Load" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Factuurnummer" HeaderText="Factuurnummer" SortExpression="Factuurnummer" />
                        <asp:BoundField DataField="KlantenpasEmail" HeaderText="KlantenpasEmail" ItemStyle-Width="25%" SortExpression="KlantenpasEmail"/>
                        <asp:BoundField DataField="Factuurdatum" HeaderText="Factuurdatum" SortExpression="Factuurdatum" />
                        <asp:BoundField DataField="Totaalbedrag" HeaderText="Totaalbedrag" SortExpression="Totaalbedrag" />
                        <asp:BoundField DataField="Reserveringsnummer" HeaderText="Reserveringsnummer" SortExpression="Reserveringsnummer" />
                        <asp:BoundField DataField="KlantKlantID" HeaderText="KlantKlantID" SortExpression="KlantKlantID"/>
                        <asp:BoundField DataField="Restaurant ID" HeaderText="Restaurant ID" SortExpression="Restaurant ID" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" SelectCommand="BEGIN TRANSACTION;

SELECT [omschrijving], [prijs], [hoeveelheid], [besteltijd], [rondenummer] FROM [listviewfactuur] WHERE ([Factuurnummer] = @Factuurnummer);



COMMIT;">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="Factuurnummer" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <br />
        <div class="bon">
            <asp:Panel ID="Panel2" runat="server" Height="546px" Visible="False">
                <asp:Label ID="Label2" runat="server" Text="Bedankt dat u heeft gekozen om bij ons te komen eten."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                &nbsp;<br />
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:2020-BIM01A-P4-SushiConnectionString %>" OnSelecting="SqlDataSource3_Selecting" SelectCommand="SELECT [Naam], [Adres], [Plaats] FROM [Restaurant] WHERE ([Restaurant ID] = @Restaurant_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="Restaurant_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">Factuurtotaal exclusief btw</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Btw bedrag</td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Factuurtotaal inclusief btw</td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <br />
        <asp:Button ID="btnPrint" runat="server" Text="Print factuur" OnClick="btnPrint_Click" />
        <br />

        <asp:Button ID="btnSluit" runat="server" OnClick="Button1_Click" Text="Sluiten" />
        <br />


    </form>
</body>
</html>
