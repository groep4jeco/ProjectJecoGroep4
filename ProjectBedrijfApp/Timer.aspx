<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timer.aspx.cs" Inherits="ProjectBedrijfApp.Timer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1260px;
            height: 650px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style1">
        
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text="Wacht nog "></asp:Label>
                        <br /><br />
                        <asp:Label ID="lblTimer" runat="server" Font-Size="XX-Large" Font-Bold="True" ForeColor="Black" OnDataBinding="Timer1_Tick1">10</asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Font-Size="XX-Large" Text="minuten"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="om door de gaan naar ronde"></asp:Label>
                        <br />
                        <asp:Label ID="lblRonde" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        <br />
                        <asp:Button ID="Button1" runat="server" Font-Size="XX-Large" Height="57px" OnClick="Button1_Click" Text="Verder" Width="309px" OnTick="Timer1_Tick1"/>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick1" Interval="1000">  
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>
    </form>
</body>
</html>
