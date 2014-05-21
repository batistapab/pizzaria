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
        <!--#include file="inc/topo.asp"  -->
        <div id="conteudo">
<%
    Dim operacao

    'Código das operações

    '1 - Cadastrar usuários
    '2 - Editar usuários/Alterar dados

    operacao = Request.Form("operacao")
    
    if not IsNumeric(operacao) or len(operacao) > 3 then
         Response.Write ("<p class='erroNoTipoDeDados'>Operação inválida!</p>")
         Response.Write("<script type='text/javascript'>window.setTimeout('history.back();', 2000);</script>")
		 Response.end
    end if

    select case operacao
        case 1 'Cadastra usuário     
            Response.Write( processa_usuario(Request.Form("nome"), Request.Form("email"),Request.Form("perfil"),Request.Form("status"),Request.Form("senha"),Request.Form("observacao"),Request.Form("idUsuario"),Request.Form("acao")))

        case 2 'Editar usuários/Alterar dados
            Response.Write( processa_usuario(Request.Form("nome"), Request.Form("email"),Request.Form("perfil"),Request.Form("status"),Request.Form("senha"),Request.Form("observacao"),Request.Form("idUsuario"),Request.Form("acao")))
        case 3
        case else

    end select


%>
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
</body>
</html>