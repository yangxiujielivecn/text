<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CallService2.aspx.cs" Inherits="CallService2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript">
    
      var helloService;
      
      function pageLoad() {
        helloService = new HelloService();
        helloService.set_defaultSucceededCallback(helloSucceed);
        helloService.set_defaultFailedCallback(helloFailed);
        
        // helloService.Greeting("Test", helloSucceed, helloFailed, null);
        
      }
      
      function helloSucceed(result) {
         var d = document.getElementById("result");
         d.innerHTML = result;      
      }
      
      function helloFailed(error, userContext, methodName) {
      }
      
      function callService() {
        var l = document.getElementById("input");
      
        helloService.Greeting(l.value);
      }
      

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" >
            <Services>
                <asp:ServiceReference Path="HelloService.svc" />
            </Services>
        </asp:ScriptManager>
        <input id="input" type="text" />
        <input id="Button1" type="button" value="button" onclick="callService()" />
        <div id="result">
        </div>
    </div>
    </form>
</body>
</html>
