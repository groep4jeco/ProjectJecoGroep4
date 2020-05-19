<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabletkeuze.aspx.cs" Inherits="ProjectBedrijfApp.tabletkeuze" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>  </title>
  
    <style>
        body {
            background-color: #a1f2f7;
        }
        
        #form1 {
            background-color: #7cc5f6;
            width: 1050px;
            height: 448px;
            margin-top: 120px;
            margin-left: auto;
            margin-right: auto;
        }

        .tafelbutton
        {
            text-align:center;
            margin-top: 35px;
            display: inline-block; 
            margin-left: 62px;
        }
        
        .bedieningbutton
        {
            text-align: center;

        }
      

    </style>
</head>
<body>
    

    
       <form id="form1" runat="server">
         <div class="tafelbutton">
             <asp:Button ID="ManagerButton" runat="server" Text="Button" Visible="False" />
             <asp:Button ID="Button1" runat="server" Text="TAFEL" Font-Bold="True" Font-Size="XX-Large" Height="190px" Width="924px" style="margin-right: 0px" OnClick="Button1_Click" />
             </div>
        <div class="bedieningbutton">
            <asp:Button ID="Button2" runat="server" Text="BEDIENING" Font-Bold="True" Font-Size="XX-Large" Height="186px" Width="924px" OnClick="Button2_Click" />
        
            <br />
            <br />
            <br />
            <asp:Label ID="IdLabel" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="VrmNaam" runat="server" Text="Label"></asp:Label>
        
       </div>

    </form>

</body>
</html>

