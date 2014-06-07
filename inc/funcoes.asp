<!--#include file="md5.asp"  -->
<%
dim conn,nome,email,idUsuario,perfil,status,senha,observacao,sql,mensagem,erro, rs, acao, msgAcao, id,query,  tabela, col, tableDB, action, parametro,produto,foto,categoria, valor, descricao, telefone, endereco,numero,cep,complemento, bairro,cidade,estado,referencia, op, retorno,confirmarsenha

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

sub conectaDados
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.MapPath("../../db/pizzaria.mdb")& ";Jet OLEDB:Database Password=pizzaria;"
end sub

sub desconectaDados
    conn.Close
    Set conn = Nothing
end sub

    'terceiro nível
sub conectaIII
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.MapPath("../../../db/pizzaria.mdb")& ";Jet OLEDB:Database Password=pizzaria;"
end sub

sub desconectaIII
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

function processa_usuario(nome,telefone,email,perfil,status,senha,observacao,id,acao)
    
    if not IsNumeric(id) then
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
    if Len(telefone) < 14 or Len(telefone) > 16 then
        mensagem= mensagem & "<br />Telefone inválido."
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
    query=""
    if acao<>"cadastrar" and senha<>"" then
        if Len(senha) < 6 and Len(senha) > 10 then
            mensagem= mensagem & "<br />Informe uma senha que contenha entre 6 e 10 caracteres."
            erro=1
        else
            query=",SENHA='"& MD5(senha) &"'"
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
                sql="INSERT INTO USUARIOS (NOME,EMAIL,TELEFONE,PERFIL,STATUSDOUSUARIO,SENHA,OBSERVACAO) VALUES ('"& nome &"','"& LCase(email) &"','"& telefone &"',"& perfil  &", "& status&", '"& MD5(senha) &"', '"& observacao &"')"
                msgAcao="Cadastro efetuado com sucesso!"
            else
                sql="UPDATE USUARIOS SET NOME='"&nome &"',EMAIL='"& LCase(email) &"',TELEFONE='"& telefone &"',PERFIL="& perfil  &",STATUSDOUSUARIO="& status&",OBSERVACAO='"& observacao &"'"& query &" WHERE ID="&id&" "
                msgAcao="Atualização efetuada com sucesso!"
            end if
           Set rs=conn.Execute(sql)

          If Err.Number <> 0 Then  
              processa_usuario = "<p class='retornoDB'><b>"& Err.Description 
              processa_usuario=processa_usuario&"</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
         else
                if  acao="cadastrar" then
                    if perfil = 1 then
                    processa_usuario = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('window.location.href = \'home.asp?id=cadastrar-usuario\'' , 2000);</script>"  
                    end if                    
                else    
                    processa_usuario = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
                end if
         end if
        Call desconecta
    else
             processa_usuario = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p><script type='text/javascript'>window.setTimeout('history.back();', 3000);</script>"
    end if

end function


function processa_produto(produto,foto,categoria,valor,descricao,id,acao)
    
    if not IsNumeric(id) then
        mensagem= mensagem & "<br />ID inválido."
        erro=1
    end if
   if acao <> "cadastrar" and acao<>"editar" then
        mensagem= mensagem & "<br />Ação inválida."
        erro=1
    end if
    if Len(produto) < 2 and Len(produto) > 150 then
        mensagem= mensagem & "<br />O produto deve conter entre 2 e 150 caracteres."
        erro=1
    end if
    if Len(foto) < 5 and Len(foto) > 150 then
        mensagem= mensagem & "<br />A foto deve conter entre 5 e 150 caracteres."
        erro=1
    end if
    if Len(categoria) < 5 and Len(categoria) > 15 then
        mensagem= mensagem & "<br />A categoria informada é inválida."
        erro=1
    end if
    if Len(descricao) > 4000 then
        mensagem= mensagem & "<br />A observação deve conter no máximo 400 caracteres."
        erro=1
    end if

    if erro=0 then
        Call conecta        
        On Error Resume Next 

            if id=0 or acao="cadastrar" then
                sql="INSERT INTO PRODUTOS (PRODUTO,FOTO,CATEGORIA,VALOR,DESCRICAO) VALUES ('"& produto &"','"& foto &"','"& categoria  &"', "& valor &",'"& descricao &"')"
                msgAcao="Cadastro efetuado com sucesso!"
            else
                sql="UPDATE PRODUTOS SET PRODUTO='"& produto &"',FOTO='"& foto &"',CATEGORIA='"& categoria &"',VALOR="& valor  &",DESCRICAO='"& descricao &"' WHERE ID="&id&" "
                msgAcao="Atualização efetuada com sucesso!"
            end if
           Set rs=conn.Execute(sql)

          If Err.Number <> 0 Then  
              processa_produto = "<p class='retornoDB'><b>"& Err.Description 
              processa_produto=processa_produto&"</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
         else
                if  acao="cadastrar" then
                    processa_produto = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('window.location.href = \'home.asp?id=cadastrar-produtos\'' , 2000);</script>"
                else
    
                    processa_produto = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
                end if
         end if
        Call desconecta
    else
             processa_produto = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p><script type='text/javascript'>window.setTimeout('history.back();', 3000);</script>"
    end if

end function

function valida_endereco(cep, endereco, numero, complemento,bairro,cidade,estado,referencia)
      erro=0
    if cep <> "11111-111" and cep <> "22222-222" and cep <> "33333-333" and cep <> "44444-444" and cep <> "55555-555" then
       retorno="O seu cep não possui cobertura!" 
       erro  = 1
    end if    
    if  Len(endereco) > 255 then
        retorno="O endereço deve conter 255 caracteres!"       
        erro  = 1
    end if    
    if  Len(numero) > 10 then
        retorno="O campo Número deve conter no máximo 10 caracteres!"         
        erro  = 1
    end if    
    if  Len(complemento) > 20 then
        retorno="O complemento deve ter no máximo 20 caracteres!"          
        erro  = 1
    end if   
    if  Len(bairro) < 1 OR Len(bairro) > 255 then
        retorno="O complemento deve ter no máximo 20 caracteres!"         
        erro  = 1
    end if   
    if  Len(cidade) < 1 OR Len(cidade) > 255 then
        retorno="O complemento deve ter no máximo 20 caracteres!"         
        erro  = 1
    end if   
    if  Len(estado) > 2 or estado<>"SP" then
        retorno="O estado informado está inválido!"        
        erro  = 1
    end if   
    if  Len(referencia) > 255 then
        retorno="A referencia deve ter no máximo 255 caracteres!"         
        erro  = 1
    end if
        if erro <> 0 Then
	        valida_endereco=retorno&"<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"	  
        else
            valida_endereco=True
        end if
end function

function processa_endereco(id,cep, endereco, numero, complemento,bairro,cidade,estado,referencia,idUsuario,acao)
     Call conecta        
        On Error Resume Next 

            if id=0 or acao="cadastrar" then
                sql="INSERT INTO ENDERECOS (ENDERECO,NUMERO, COMPLEMENTO, BAIRRO,CIDADE,ESTADO,CEP,REFERENCIA,IDUSUARIO) VALUES ('"& endereco &"','"& numero &"','"& complemento  &"','"& bairro &"','"& cidade &"','"& estado &"','"& cep &"','"& referencia &"',"& idUsuario &")"
            else
                sql="UPDATE ENDERECOS SET ENDERECO='"& endereco &"',NUMERO='"& numero &"',COMPLEMENTO='"& complemento &"',BAIRRO='"& bairro  &"',CIDADE='"& cidade &"', ESTADO='"& estado &"',CEP='"& cep &"',REFERENCIA='"& referencia &"' WHERE ID="&id&" "
                msgAcao="Atualização efetuada com sucesso!"
            end if
           Set rs=conn.Execute(sql)

          If Err.Number <> 0 Then  
              processa_endereco = "<p class='retornoDB'><b>"& Err.Description 
              processa_endereco=processa_endereco&"</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
         else
                if  acao<>"cadastrar" then
                    processa_endereco = "<p class='retornoDB'><b>"&  msgAcao & "</b><br /><script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>"
                end if
         end if
        Call desconecta
end function


' A função exclusão funcionará para todas as tabelas cadastradas
function exclusao(tableDB,id)
       erro=0
       if not IsNumeric(id) then
            mensagem= mensagem & " ID inválido."
            erro=1
        end if
       if tableDB <> "ENDERECOS" and tableDB<>"PRODUTOS" and tableDB<>"ITENS" and tableDB<>"DOCUMENTOS" and tableDB<>"PEDIDOS" and tableDB<>"USUARIOS" then
            mensagem= mensagem & " A tabela "&tableDB&" não existe!"
            erro=1
       end if
      if erro=0 then
      Call conectaDados 
       sql="DELETE FROM "&tableDB&" WHERE ID="& parametro &""
       Set rs=conn.Execute(sql)
      Call desconectaDados
          If Err.Number <> 0 Then  
              exclusao = "Código"& Err.Description 
         else
              exclusao ="Exclusão realizada com sucesso"
         end if
      else         
            exclusao= "Foram encontrados os seguintes erros:"& mensagem
      end if
        
    end function

                                    function listar_produtos(id)    
                                    if not IsNumeric(id) then
                                        mensagem= mensagem & "<br />ID inválido."
                                        erro=1
                                    end if
                                    if erro=0 then
                                        Call conecta        
                                        On Error Resume Next 

                                            if id<>0 then  
                                            sql="SELECT ID, PRODUTO,FOTO,CATEGORIA,SWITCH(CATEGORIA = 1, 'Alimento',CATEGORIA = 2, 'Bebida',CATEGORIA=3,'Ingrediente') AS CATEGORIA_EXT, Format (VALOR, '#,##0.00') AS PRECO, DESCRICAO FROM PRODUTOS WHERE CATEGORIA="&id&" "
                                            Set rs=conn.Execute(sql)

                                             if rs.EOF then 
                                               listar_produtos = "Nenhum produto desta categoria cadastrado!"
                                             else
                                                  listar_produtos=""
                                                 'Definir como os dados serão exibidos na tela 
                                                
                                                  if id=1 then
                                                    Do While Not rs.Eof
                                                          listar_produtos = listar_produtos & "<div id='contentID"& rs("ID") &"'>" 
                                                          listar_produtos = listar_produtos & "<img src='img/produtos/" & rs("CATEGORIA_EXT") &  "/"& rs("FOTO") &"' alt='"& rs("PRODUTO") &"' title='" & rs("PRODUTO") & "' class='imgProdutos' />" 
                                                          listar_produtos = listar_produtos &"<h3><b class='nomeProduto'>" & rs("PRODUTO") & "</b><label>R$ <span>" & Replace(rs("PRECO"),",",".") & "</span></label></h3> "
                                                          listar_produtos = listar_produtos & "<p>" &rs("DESCRICAO") & "</p>"
                                                          listar_produtos = listar_produtos &"<hr /><p>Qtde: <input type='number' min='0' name='qtde' class='qtde' required />"
                                                          listar_produtos = listar_produtos & "<button value='"& rs("ID") & "' class='button'>Adicionar</button></p></div>"& vbcrlf 
                                                     rs.movenext 'Passa pro próximo
                                                     Loop 'Fim do Laço
	                                                 rs.Close 
	                                                 Set rs=Nothing
                                                  else
                                                    Do While Not rs.Eof
                                                          listar_produtos = listar_produtos & "<table id='contentID"& rs("ID") &"'><tr>"
                                                          listar_produtos = listar_produtos &"<td><img src='img/produtos/" & rs("CATEGORIA_EXT") &"/" & rs("FOTO")&"' alt='" & rs("PRODUTO") &"' title='" & rs("PRODUTO") &"' class='imgProdutos' /></td>"
                                                          listar_produtos = listar_produtos &"<td class='nomeProduto'>" & rs("PRODUTO") &"</td>"
                                                          listar_produtos = listar_produtos &"<td><label>R$ <span>" & Replace(rs("PRECO"),",",".") &"</span></label></td>" 
                                                          listar_produtos = listar_produtos &"<td>Qtde: <input type='number' min='0' name='qtde' class='qtde' required /></td>" 
                                                          listar_produtos = listar_produtos &"<td><button value='" & rs("ID") &"' class='button'>Adicionar</button></td></tr></table>"& vbcrlf 
                                                     rs.movenext 'Passa pro próximo
                                                     Loop 'Fim do Laço
	                                                 rs.Close 
	                                                 Set rs=Nothing
                                                  end if

                                             end if
                                            Else   
                                              listar_produtos = "Você precisa informar um parâmetro válido"         
                                            end if
                                        Call desconecta
                                    else
                                             listar_produtos = "<p class='retornoDB'><b>Foram encontrados os seguintes erros:</b><br />"& mensagem & "</p>"
                                    end if

                                end function 

%>

