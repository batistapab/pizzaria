﻿<!--#include file="inc/funcoes.asp"  -->
<!--#include file="inc/md5.asp"  -->
<% Call conecta %>
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
On Error Resume Next
Server.ScriptTimeout = 90
dim email,senha

if Request.Form("email")<>"" and  Request.Form("senha")<>"" then
    email=Request.Form("email")
    senha=MD5(Request.Form("senha"))

    if Len(email) < 8 or Len(email) > 100 or ValidEmail(email) =False then
        Response.Write("E-mail inválido!")
        Response.End
    end if
    if Len(senha) < 10 and Len(senha) > 32 then
        Response.Write("Senha inválida!")
        Response.End
    end if

    If Err.Number <> 0 Then
  
      Response.Write (Err.Description& "<br><br>")
      Response.End
  
    End If


    Response.Write("E-mail: "&email)
    Response.Write("<br />"&senha)
    On Error GoTo 0

else

end if
%>
             <!--#include file="inc/apoio.asp"  -->
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
</body>
</html>
<% Call desconecta %>