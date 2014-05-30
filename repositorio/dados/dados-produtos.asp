<!--#include file="../../inc/funcoes.asp"  -->
<!--#include file="../../inc/seguranca.asp"  -->
<!--#include file="../json/JSON_2.0.4.asp"-->
<!--#include file="../json/JSON_UTIL_0.1.1.asp"-->
<%
function listar_produtos(id)
    
    if not IsNumeric(id) then
        mensagem= mensagem & "<br />ID inválido."
        erro=1
    end if
    if erro=0 then
        Call conectaDados        
        On Error Resume Next 

            if id=0 then   
               listar_produtos = QueryToJSON(conn, "SELECT ID,PRODUTO,CATEGORIA,SWITCH(CATEGORIA = 1, 'Alimento',CATEGORIA = 2, 'Bebida',CATEGORIA=3,'Ingrediente') AS CATEGORIA_EXT,VALOR, DESCRICAO FROM PRODUTOS").Flush   
            else
               listar_produtos = QueryToJSON(conn, "SELECT ID, PRODUTO,CATEGORIA,SWITCH(CATEGORIA = 1, 'Alimento',CATEGORIA = 2, 'Bebida',CATEGORIA=3,'Ingrediente') AS CATEGORIA_EXT,VALOR, DESCRICAO FROM PRODUTOS WHERE ID="&id&" ").Flush             
            end if
        Call desconectaDados
    else
             listar_produtos = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p>"
    end if

end function  
     
 id=Request.Form("q")
 action=Request.Form("action")
 parametro=Request.Form("parametro")
 if id="" then
    id=0
 end if
     
if action="excluir" and IsNumeric(parametro) then
    tableDB="PRODUTOS"
    Response.Write exclusao(tableDB,id)
else
     Response.Write listar_produtos(id)
end if
   
%>
