<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="betalen.aspx.cs" Inherits="ProjectBedrijfApp.betalen2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            bottom: 232px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="0">Cash</asp:ListItem>
                <asp:ListItem Value="1">Maestro</asp:ListItem>
                <asp:ListItem Value="2">Mastercard</asp:ListItem>

            </asp:DropDownList>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                   <DIV class="Keypad" style="WIDTH: 192px; POSITION: relative; HEIGHT: 320px; BACKGROUND-COLOR: #ffffcc"
	ms_positioning="GridLayout"><INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="txtResult" style="FONT-SIZE: medium; Z-INDEX: 102; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		type="text" size="24" name="txtResult" runat="server">
	<asp:button id="btnOK" style="Z-INDEX: 101; LEFT: 104px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="OK" Width="81px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 104; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="1"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 105; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="2"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 106; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="3"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 107; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="4"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 108; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="5"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 109; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="6"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 110; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="7"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 111; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="8"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 112; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="9"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 113; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="0"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 114; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="delClicked(this);" type="button" value="DEL"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 115; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="clrClicked(this);" type="button" value="CLR">
	<asp:button id="btnCancel" style="Z-INDEX: 116; LEFT: 8px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="Cancel" Width="80px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><asp:label id="txtSource" style="Z-INDEX: 100; LEFT: 64px; POSITION: absolute; TOP: 280px"
		runat="server" Width="32px" Visible="False"></asp:label><INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="txtPasswordResult" style="FONT-SIZE: medium; Z-INDEX: 103; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		type="password" size="24" name="txtPasswordResult" runat="server">
	<asp:label id="lblIsPassword" style="Z-INDEX: 99; LEFT: 8px; POSITION: absolute; TOP: 240px"
		runat="server" Visible="False">False</asp:label></DIV>
<!--<script>document.onload=document.all("Keypad1_txtResult").focus();</script>-->
<script>
function focusToInput() {
   try {
      document.all("Keypad1_txtResult").focus();
   }
   catch (e) {
      document.all("Keypad1_txtPasswordResult").focus();
   }
}
function numClicked(elem) {
   try {
      document.all("Keypad1_txtResult").value+=elem.value;
   } 
   catch(e) {}
   try {
      document.all("Keypad1_txtPasswordResult").value+=elem.value;
   } 
   catch(e) {}
   //document.all("Keypad1_txtResult").focus();
   focusToInput();
}
function delClicked(elem) {
   try {
      document.all("Keypad1_txtResult").value=document.all("Keypad1_txtResult").value.substr(0,document.all("Keypad1_txtResult").value.length-1);
   } 
   catch(e) {}
   try {
      document.all("Keypad1_txtPasswordResult").value=document.all("Keypad1_txtPasswordResult").value.substr(0,document.all("Keypad1_txtPasswordResult").value.length-1);
   } 
   catch(e) {}
   //document.all("Keypad1_txtResult").focus();
   focusToInput();
}
function clrClicked(elem) {
   try {
      document.all("Keypad1_txtResult").value="";
   } 
   catch(e) {}
   try {
      document.all("Keypad1_txtPasswordResult").value="";
   } 
   catch(e) {}
   
   //document.all("Keypad1_txtResult").focus();
   focusToInput();
}
</script>
<script>document.onload=focusToInput();</script>

                    <asp:Button ID="Btnbetaalcash" runat="server" Text="Betalen" OnClick="Btnbetaalcash_Click" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                  <DIV class="Keypad" style="WIDTH: 192px; POSITION: relative; HEIGHT: 320px; BACKGROUND-COLOR: #ffffcc"
	ms_positioning="GridLayout">
                      <INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="Text1" style="FONT-SIZE: medium; Z-INDEX: 102; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		
                          type="text" size="24" name="txtResult" runat="server">
	<asp:button id="Button1" style="Z-INDEX: 101; LEFT: 104px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="OK" Width="81px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 104; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="1"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 105; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="2"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 106; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="3"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 107; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="4"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 108; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="5"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 109; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="6"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 110; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="7"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 111; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="8"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 112; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="9" class="auto-style1"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 113; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="0"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 114; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="delClicked(this);" type="button" value="DEL"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 115; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="clrClicked(this);" type="button" value="CLR">
	<asp:button id="Button2" style="Z-INDEX: 116; LEFT: 8px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="Cancel" Width="80px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><asp:label id="Label4" style="Z-INDEX: 100; LEFT: 64px; POSITION: absolute; TOP: 280px"
		runat="server" Width="32px" Visible="False"></asp:label><INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="Password1" style="FONT-SIZE: medium; Z-INDEX: 103; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		type="password" size="24" name="txtPasswordResult" runat="server">
	<asp:label id="Label5" style="Z-INDEX: 99; LEFT: 8px; POSITION: absolute; TOP: 240px"
		runat="server" Visible="False">False</asp:label></DIV>
<!--<script>document.onload=document.all("Keypad1_txtResult").focus();</script>-->
<script>
    function focusToInput() {
        try {
            document.all("Keypad1_txtResult").focus();
        }
        catch (e) {
            document.all("Keypad1_txtPasswordResult").focus();
        }
    }
    function numClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value += elem.value;
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value += elem.value;
        }
        catch (e) { }
        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
    function delClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value = document.all("Keypad1_txtResult").value.substr(0, document.all("Keypad1_txtResult").value.length - 1);
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value = document.all("Keypad1_txtPasswordResult").value.substr(0, document.all("Keypad1_txtPasswordResult").value.length - 1);
        }
        catch (e) { }
        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
    function clrClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value = "";
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value = "";
        }
        catch (e) { }

        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
</script>
<script>document.onload = focusToInput();</script>

                    <asp:Button ID="Btnbetaalmaestro" runat="server" Text="Betalen" />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <DIV class="Keypad" style="WIDTH: 192px; POSITION: relative; HEIGHT: 320px; BACKGROUND-COLOR: #ffffcc"
	ms_positioning="GridLayout"><INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="Text2" style="FONT-SIZE: medium; Z-INDEX: 102; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		type="text" size="24" name="txtResult" runat="server">
	<asp:button id="Button3" style="Z-INDEX: 101; LEFT: 104px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="OK" Width="81px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 104; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="1"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 105; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="2"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 106; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 152px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="3"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 107; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="4"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 108; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="5"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 109; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 96px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="6"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 110; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="7"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 111; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="8"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 112; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 40px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="9"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 113; LEFT: 72px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="numClicked(this);" type="button" value="0"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 114; LEFT: 16px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="delClicked(this);" type="button" value="DEL"><INPUT style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; Z-INDEX: 115; LEFT: 128px; WIDTH: 48px; FONT-FAMILY: Verdana; POSITION: absolute; TOP: 208px; HEIGHT: 48px"
		onclick="clrClicked(this);" type="button" value="CLR">
	<asp:button id="Button4" style="Z-INDEX: 116; LEFT: 8px; POSITION: absolute; TOP: 264px" runat="server"
		CssClass="FatButton" Text="Cancel" Width="80px" Height="48px" Font-Names="Verdana" Font-Size="Medium"></asp:button><asp:label id="Label6" style="Z-INDEX: 100; LEFT: 64px; POSITION: absolute; TOP: 280px"
		runat="server" Width="32px" Visible="False"></asp:label><INPUT onkeypress="if(event.keyCode==13){document.all('Keypad1_btnOK').click();return false;}if(event.keyCode==27){document.all('Keypad1_btnCancel').click();return false;}"
		id="Password2" style="FONT-SIZE: medium; Z-INDEX: 103; LEFT: 8px; WIDTH: 176px; FONT-FAMILY: Tahoma; POSITION: absolute; TOP: 8px; HEIGHT: 30px"
		type="password" size="24" name="txtPasswordResult" runat="server">
	<asp:label id="Label7" style="Z-INDEX: 99; LEFT: 8px; POSITION: absolute; TOP: 240px"
		runat="server" Visible="False">False</asp:label></DIV>
<!--<script>document.onload=document.all("Keypad1_txtResult").focus();</script>-->
<script>
    function focusToInput() {
        try {
            document.all("Keypad1_txtResult").focus();
        }
        catch (e) {
            document.all("Keypad1_txtPasswordResult").focus();
        }
    }
    function numClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value += elem.value;
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value += elem.value;
        }
        catch (e) { }
        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
    function delClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value = document.all("Keypad1_txtResult").value.substr(0, document.all("Keypad1_txtResult").value.length - 1);
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value = document.all("Keypad1_txtPasswordResult").value.substr(0, document.all("Keypad1_txtPasswordResult").value.length - 1);
        }
        catch (e) { }
        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
    function clrClicked(elem) {
        try {
            document.all("Keypad1_txtResult").value = "";
        }
        catch (e) { }
        try {
            document.all("Keypad1_txtPasswordResult").value = "";
        }
        catch (e) { }

        //document.all("Keypad1_txtResult").focus();
        focusToInput();
    }
</script>
<script>document.onload = focusToInput();</script>

                    <asp:Button ID="BtnbetaalMC" runat="server" Text="Betalen" />
                </asp:View>
              
                    
            </asp:MultiView>
        </div>
     
    </form>
</body>
</html>
