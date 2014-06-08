<!--#include file="../../inc/funcoes.asp"  -->
<!--#include file="../../inc/seguranca.asp"  -->
<%

id=idUsuario
if Request.Form("action")="Cadastrar" or Request.Form("action")="Editar" Then    
    Response.Write processa_documentos(Request.Form("id"),Request.Form("rg"),Request.Form("cpf"),id,Request.Form("action"))
else
    Response.Write("Você precisa informar uma ação válida!")
end if
%>

