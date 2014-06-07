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
    if Request.Form("email")<>"" and  Request.Form("senha")<>"" and (Request.Form("op")=1 or Request.Form("op")=2 and IsNumeric(Request.Form("op"))) then

    
    op=Request.Form("op")
    email=Request.Form("email")
    senha=Request.Form("senha")

    if op=2 then      
     nome=Request.Form("nome")
     telefone=Request.Form("telefone")    
     cep=Request.Form("cep") 
     endereco=Request.Form("endereco") 
     numero=Request.Form("numero") 
     complemento=Request.Form("complemento") 
     bairro=Request.Form("bairro") 
     cidade=Request.Form("cidade") 
     estado=Request.Form("estado") 
     referencia=Request.Form("referencia")
     confirmarsenha=Request.Form("confirmarsenha")


    if confirmarsenha<>senha then
      Response.Write("As senhas estão divergentes!")        
	  Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	  Response.end
    end if

     Response.Write valida_endereco(cep, endereco, numero, complemento,bairro,cidade,estado,referencia)
    
    'Nessa tela por padrão o usuário cadastrado terá o perfil 3 e status 1 que é para cliente ativo e a ação é cadastrar
    Response.Write processa_usuario(nome,telefone,email,3,1,senha,observacao,id,"cadastrar")

    '#################### Fim da validação do cadastro do novo usuário
    end if
    
   

    if Len(email) < 8 or Len(email) > 100 or ValidEmail(email) =False then
        Response.Write("E-mail inválido!")        
	    Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	    response.end
    end if
    if Len(senha) < 6 and Len(senha) > 10 then
        Response.Write("Senha inválida!")        
	    Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
	    response.end
    end if

    Call conecta
    set rs = Server.CreateObject("ADODB.Recordset")
     rs.open "SELECT * FROM USUARIOS WHERE EMAIL='"& email &"' AND SENHA='"&MD5(senha)&"'" , conn

    if NOT rs.EOF then	 
            
        If rs("STATUSDOUSUARIO")="1" Then
             Response.Cookies("idUsuario") = rs("ID")
             Response.Cookies("nome") = rs("NOME")
             Response.Cookies("email") = rs("EMAIL")
             Response.Cookies("perfil") = rs("PERFIL")
             if op=2 then
                 Response.Write processa_endereco(0,cep, endereco, numero, complemento, bairro,cidade, estado, referencia,  rs("ID"), "cadastrar")
             end if
             

       else 'Se o usuário estiver inativo ou bloqueado será direcionado a ligar para central
             Response.Write("O seu cadastro está inativo entre em contato com a nossa central de atendimento!<br />Telefones (011) 2222-2222 | 3333-3333!") 
             Response.AddHeader "Refresh","5 ; URL=login.asp"
             Response.End
       end if
    else
        Response.Write("Usuário e/ou senha não encontrado!<br />Tente novamente!")    
        Response.End   
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
