<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabletkeuze.aspx.cs" Inherits="ProjectBedrijfApp.tabletkeuze" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>  </title>
  
    <style>
        body {
            background-color: seashell;
        }
        
        #form1 {
            background-color: lightslategray;
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
            background-color:seashell;
        }
        
        .bedieningbutton
        {
            text-align: center;
            background-color:seashell;
            height: 171px;
            width: 926px;
            margin-left: 60px;
        }
        .
      

    </style>
</head>
<body>
    

    
       <form id="form1" runat="server">
         <div class="tafelbutton">
             <asp:Button ID="Button1" runat="server" Text="TAFEL" Font-Bold="True" Font-Size="XX-Large" Height="190px" Width="924px" style="margin-right: 0px" OnClick="Button1_Click" BackColor="#CCCCCC" />
             </div>
        <div class="bedieningbutton">
            <asp:Button ID="Button2" runat="server" Text="BEDIENING" Font-Bold="True" Font-Size="XX-Large" Height="170px" Width="924px" OnClick="Button2_Click" BackColor="#CCCCCC" />
        
            <br />
             <asp:Button ID="ManagerButton" runat="server" Text="Button" Visible="False" OnClick="ManagerButton_Click" />
            <br />
            <br />
            <asp:Label ID="IdLabel" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="VrmNaam" runat="server" Text="Label"></asp:Label>
        
       </div>

    </form>

</body>
</html>

