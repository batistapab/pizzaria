<!--#include file="md5.asp"  -->
<%
dim conn,nome,email,perfil,status,senha,observacao,sql,mensagem,erro,rs,acao,msgAcao,id,tabela
mensagem=""
erro=0
id=0
tabela=""

Function ValidEmail(ByVal emailAddress) 
'this function will use regular expressions to check an '
'email address for validity '
'instantiate regex object container, output boolean '
Dim objRegEx, retVal 
'using late binding, vbscript reference is not required '
Set objRegEx = CreateObject("VBScript.RegExp") 
'.pattern -looks for a valid email address '
With objRegEx 
      .Pattern = "^\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$" 
      .IgnoreCase = True 
End With 
retVal = objRegEx.Test(emailAddress) 
'get rid of RegEx object '
Set objRegEx = Nothing 
ValidEmail = retVal 
End Function

sub conecta
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.MapPath("db/pizzaria.mdb")& ";Jet OLEDB:Database Password=pizzaria;"
end sub

sub desconecta
    conn.Close
    Set conn = Nothing
end sub

function captalize(Texto)
    Dim arrayTexto, i,Resultado
    arrayTexto = Split(Texto," ") 
    For i = 0 to UBound(arrayTexto) 
        Resultado = Resultado &" "& UCase(Left(arrayTexto(i),1))&lcase(mid(arrayTexto(i),2,len(arrayTexto(i)))) 		
    Next 
    Response.Write(Resultado)
end function 

function ajustaTitleHtml(title)
    title=Replace(title,"-", " ")
    ajustaTitleHtml=captalize(title)
end function

Function descricaoDoPerfil(x)
    select case x
        case 1
            descricaoDoPerfil="Administrador"
        case 2
            descricaoDoPerfil="Funcionário"
        case else 
            descricaoDoPerfil="Cliente"
    end select
end Function

Function descricaoDoStatus(x)
    select case x
        case 1
            descricaoDoStatus="Ativo"
        case 2
            descricaoDoStatus="Inativo"
        case else
            descricaoDoStatus="Bloqueado"
    end select
end Function

function processa_usuario(nome,email,perfil,status,senha,observacao,id,acao)
    
    if Len(id) <> 1 or not IsNumeric(id) then
        mensagem= mensagem & "<br />ID inválido."
        erro=1
    end if
   if acao <> "cadastrar" and acao<>"editar" then
        mensagem= mensagem & "<br />Ação inválida."
        erro=1
    end if
    if Len(nome) < 5 and Len(nome) > 150 then
        mensagem= mensagem & "<br />O nome deve conter entre 5 e 150 caracteres."
        erro=1
    end if
    if Len(email) < 5 and Len(email) > 150 or ValidEmail(email) = False then
        mensagem= mensagem & "<br />Informe um e-mail válido e que contenha entre 5 e 150 caracteres."
        erro=1
    end if
    if Len(perfil) <> 1 or not IsNumeric(perfil) then
        mensagem= mensagem & "<br />Perfil inválido."
        erro=1
    end if
    if Len(status) <> 1 or not IsNumeric(status) then
        mensagem= mensagem & "<br />Status inválido."
        erro=1
    end if
    if acao="cadastrar" then
        if Len(senha) < 6 and Len(senha) > 10 then
            mensagem= mensagem & "<br />Informe uma senha que contenha entre 6 e 10 caracteres."
            erro=1
        end if
    end if
    if Len(observacao) > 4000 then
        mensagem= mensagem & "<br />A observação deve conter no máximo 400 caracteres."
        erro=1
    end if

    if erro=0 then
        Call conecta        
        On Error Resume Next 

            if id=0 or acao="cadastrar" then
                sql="INSERT INTO USUARIOS (NOME,EMAIL,PERFIL,STATUSDOUSUARIO,SENHA,OBSERVACAO) VALUES ('"& nome &"','"& email &"',"& perfil  &", "& status&", '"& MD5(senha) &"', '"& observacao &"')"
                msgAcao="Cadastro efetuado com sucesso!"
            else
                sql="UPDATE USUARIOS SET NOME='"& nome &"',EMAIL='"& email &"',PERFIL="& perfil  &",STATUSDOUSUARIO="& status&",OBSERVACAO='"& observacao &"' WHERE ID="&id&" "
                msgAcao="Atualização efetuada com sucesso!"
            end if
           Set rs=conn.Execute(sql)

          If Err.Number <> 0 Then  
              processa_usuario = "<p class='retornoDB'><b>"& Err.Description &"</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
         else
              processa_usuario = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('window.location.href = \'home.asp?id=cadastrar-usuario\'' , 2000);</script>"
         end if
        Call desconecta
    else
             processa_usuario = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p><script type='text/javascript'>window.setTimeout('history.back();', 3000);</script>"
    end if

end function

function listar_usuarios(id)
    
    if Len(id) <> 1 or not IsNumeric(id) then
        mensagem= mensagem & "<br />ID inválido."
        erro=1
    end if
    if erro=0 then
        Call conecta        
        On Error Resume Next 

            if id=0 then                
                sql="SELECT NOME,EMAIL,PERFIL,STATUSDOUSUARIO,OBSERVACAO,ID FROM USUARIOS GROUP BY NOME,EMAIL,PERFIL,STATUSDOUSUARIO,OBSERVACAO,ID"            
            else
                sql="SELECT * FROM USUARIOS WHERE ID="&id&" "
            end if

           Set rs=conn.Execute(sql)
          If Err.Number <> 0 Then  
              listar_usuarios = "<p class='retornoDB'><b>"& Err.Description &"</b><br />"
          else
           tabela=tabela &"<table class='listas'>"
                tabela=tabela & "<tr>"
                    tabela=tabela & "<th>Nome</th>"
                    tabela=tabela & "<th>E-mail</th>"
                    tabela=tabela & "<th>Perfil</th>"
                    tabela=tabela & "<th>Status</th>"
                    tabela=tabela & "<th></th>"
                tabela=tabela & "</tr>"
          
             Do While Not rs.Eof 
                tabela=tabela & "<tr>"
                    tabela=tabela & "<td>"& Ucase(rs("NOME")) &"</td>"
                    tabela=tabela & "<td>"& rs("EMAIL") &"</td>"
                    tabela=tabela & "<td>"& descricaoDoPerfil(rs("PERFIL")) &"</td>"
                    tabela=tabela & "<td>"& descricaoDoStatus(rs("STATUSDOUSUARIO")) &"</td>"  
                    tabela=tabela & "<td><a href='repositorio/usuarios/editar-usuario.asp?q="& rs("ID") &"' class='ver'><img src='img/edit.png' alt='Ver' /></a></td>"
                tabela=tabela & "</tr>"
             rs.movenext 'Passa pro próximo
             Loop 'Fim do Laço
	         rs.Close 
	         Set rs=Nothing
            tabela=tabela & "</table>"          
           listar_usuarios = tabela
         end if
        Call desconecta
    else
             listar_usuarios = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p>"
    end if

end function
 
%>

