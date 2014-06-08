<!--#include file="inc/funcoes.asp"  -->
<!--#include file="inc/seguranca.asp"  -->
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
        <div id="conteudo">
<%
    Dim operacao

    'Código das operações

    '1 - Cadastrar usuários
    '2 - Editar usuários/Alterar dados
    '3 - Cadastrar produtos    
    '4 - Editar produto  
    '5 - Cadastrar pedido

    operacao = Request.Form("operacao")
    
    if not IsNumeric(operacao) or len(operacao) > 3 then
         Response.Write ("<p class='erroNoTipoDeDados'>Operação inválida!</p>")
         Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
		 Response.end
    end if

    select case operacao
        case 1 'Cadastra usuário     
            Response.Write( processa_usuario(Request.Form("nome"),Request.Form("telefone"), Request.Form("email"),Request.Form("perfil"),Request.Form("status"),Request.Form("senha"),Request.Form("observacao"),Request.Form("idUsuario"),Request.Form("acao")))

        case 2 'Editar usuários/Alterar dados
            Response.Write( processa_usuario(Request.Form("nome"),Request.Form("telefone"), Request.Form("email"),Request.Form("perfil"),Request.Form("status"),Request.Form("senha"),Request.Form("observacao"),Request.Form("idUsuario"),Request.Form("acao")))
        case 3 'Cadastrar produto
             Response.Write( processa_produto(Request.Form("produto"),Request.Form("foto"), Request.Form("categoria"),Request.Form("valor"),Request.Form("descricao"),Request.Form("idproduto"),Request.Form("acao")))
        case 4 'Editar produto
             Response.Write( processa_produto(Request.Form("produto"),Request.Form("foto"), Request.Form("categoria"),Request.Form("valor"),Request.Form("descricao"),Request.Form("idproduto"),Request.Form("acao")))
        case 5 'Cadastrar pedido
             Response.Write(CadastraPedido(request.form("id"),Request.Form("qtde"),Request.Form("valor"),Request.Form("metodo_de_pagamento"),Request.Form("total"),idUsuario))
        case else

    end select


%>
        </div>
    </div>
</body>
</html>