<!--#include file="../../inc/funcoes.asp"  -->
<!--#include file="../../inc/seguranca.asp"  -->
<!--#include file="../json/JSON_2.0.4.asp"-->
<!--#include file="../json/JSON_UTIL_0.1.1.asp"-->
<%
function listar_usuarios(id)
    
    if not IsNumeric(id) then
        mensagem= mensagem & "<br />ID inválido."
        erro=1
    end if
    if erro=0 then
        Call conectaDados        
        On Error Resume Next 

            if id=0 then             
               listar_usuarios = QueryToJSON(conn, "SELECT NOME,TELEFONE, EMAIL,PERFIL,STATUSDOUSUARIO,OBSERVACAO,ID,SWITCH(PERFIL = 1, 'Administrador',PERFIL = 2, 'Funcionário',PERFIL=3,'Cliente') AS PERFIL_EXT,SWITCH(STATUSDOUSUARIO = 1, 'Ativo',STATUSDOUSUARIO = 2, 'Inativo',STATUSDOUSUARIO=3,'Bloqueado') AS STATUS_EXT FROM USUARIOS").Flush   
            else
               listar_usuarios = QueryToJSON(conn, "SELECT NOME, TELEFONE,EMAIL,PERFIL,STATUSDOUSUARIO,OBSERVACAO,ID,SWITCH(PERFIL = 1, 'Administrador',PERFIL = 2, 'Funcionário',PERFIL=3,'Cliente') AS PERFIL_EXT,SWITCH(STATUSDOUSUARIO = 1, 'Ativo',STATUSDOUSUARIO = 2, 'Inativo',STATUSDOUSUARIO=3,'Bloqueado') AS STATUS_EXT FROM USUARIOS WHERE ID="&id&" ").Flush             
            end if
        Call desconectaDados
    else
             listar_usuarios = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p>"
    end if

end function  
     
 id=Request.Form("q")
 action=Request.Form("action")
 parametro=Request.Form("parametro")
 if id="" then
    id=idUsuario 
    'Esse ## idUsuario  ## é o id do usuário logado, foi gerado no arquivo logar e reuisitado no arquivo segurança
 end if

if action="excluir" and IsNumeric(parametro) then
    tableDB="USUARIOS"
    Response.Write exclusao(tableDB,id)
else
     Response.Write listar_usuarios(id)
end if
   
%>
