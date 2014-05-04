<!--#include file="inc/funcoes.asp"  -->
<%
     On Error Resume Next 
    
 %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Click Pizzas</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css" />
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
    <div id="main">
        <!--#include file="inc/topo.asp"  -->
        <div id="conteudo">
<%
dim email,senha,rs,sql

if Request.Form("email")<>"" and  Request.Form("senha")<>"" then
    email=Request.Form("email")
    senha=MD5(Request.Form("senha"))

    if Len(email) < 8 or Len(email) > 100 or ValidEmail(email) =False then
        Response.Write("E-mail inválido!")        
	    Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	    response.end
    end if
    if Len(senha) < 10 and Len(senha) > 32 then
        Response.Write("Senha inválida!")        
	    Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	    response.end
    end if

    Call conecta
    set rs = Server.CreateObject("ADODB.Recordset")
     rs.open "SELECT * FROM USUARIOS WHERE EMAIL='"& email &"' AND SENHA='"&senha&"'" , conn
    
    if NOT rs.EOF then	 
        
        If rs("STATUSODUSUARIO")=1 Then
             Response.Cookies("nome") = rs("NOME")
             Response.Cookies("email") = rs("EMAIL")
             Response.Cookies("perfil") = rs("PERFIL")
             Response.Redirect("home.asp") 
             Response.End

       else 'Se o usuário estiver inativo ou bloqueado será direcionado a ligar para central

             Response.Write("O seu cadastro está inativo entre em contato com a nossa central de atendimento!<br />Telefones (011) 2222-2222 | 3333-3333!") 
             Response.AddHeader "Refresh","5 ; URL=login.asp"
             Response.End
       end if
    else
        Response.Write("Usuário e/ou senha não encontrado!<br />Tente novamente!")       
    end if

    
    If Err.Number <> 0 Then
  
      Response.Write (Err.Description& "<br><br>")
      Response.End
  
    End If

    Call desconecta
    Response.AddHeader "Refresh","4 ; URL=login.asp"
    On Error GoTo 0

else        
	    Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	    response.end
end if
%>
             <!--#include file="inc/apoio.asp"  -->
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
</body>
</html>
