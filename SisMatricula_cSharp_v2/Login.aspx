<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SisMatricula_cSharp_v2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Panel de ingreso</title>

     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="css/maruti-login.css" />
</head>
<body>
         <div id="loginbox">            
            <form id="form1" class="form-vertical" runat="server" >
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                   
                          <div class="control-group normal_text"> <h3><img src="img/logo.png" alt="Logo" /></h3></div>
                         <asp:Label class="alert alert-danger" ID="txtAlerta" runat="server" Text="" width="517px" Style="margin:0;padding:10px; border-radius: 0px 0px 0px 0px;"></asp:Label>
                        
            
                            <div class="control-group">

                                

                                <div class="controls">

                                    <div class="main_input_box">
                                        <span class="add-on"><i class="icon-user"></i></span>
                                        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                          
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="main_input_box">
                                        <span class="add-on"><i class="icon-lock"></i></span>
                                        <asp:TextBox ID="txtContrasena" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                            </div>
                         
                        
                            <div class="form-actions">
                                <span class="pull-right">
                                 <asp:Button ID="txtEntrar" runat="server" class="btn btn-info"  Text="Entrar" OnClick="txtEntrar_Click" />
                                  </span>
                            </div>
	              
                </ContentTemplate>
                      </asp:UpdatePanel>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <script src="js/maruti.login.js"></script> 
</body>
</html>
