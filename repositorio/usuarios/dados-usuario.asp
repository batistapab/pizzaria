<!--#include file="../../inc/seguranca.asp"  -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
       <title>
            Editar usuário
    </title>
    <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    <link rel="stylesheet" type="text/css" href="../fancybox/source/jquery.fancybox.css" />
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="../js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
<form class="cadastro" id="editar-usuario" action="processos.asp" method="post">
    <h2>Editar usuário</h2>
    <input type="hidden" name="operacao" id="operacao" value="02" />
    <input type="hidden" name="acao" id="acao" value="cadastrar" />    
    <input type="hidden" name="idUsuario" id="idUsuario" value="0" />
    <div><label for="nome">Nome</label></div>
    <div><input type="text" name="nome" id="nome" maxlength="150" required /> </div>
    <div><label for="email">E-mail</label></div>
    <div><input type="email" name="email" id="email" maxlength="150" required /> </div>
    <div><label for="perfil">Perfil</label></div>
    <div>
        <select name="perfil" id="perfil" required>
            <option value=""></option>            
            <option value="1">Administrador</option>
            <option value="2">Funcionário</option>
            <option value="3">Cliente</option>
        </select>
    </div>
    <div><label for="status">Status</label></div>
    <div>
        <select name="status" id="status" required>
            <option value=""></option>            
            <option value="1">Ativo</option>
            <option value="2">Inativo</option>
            <option value="3">Bloqueado</option>
        </select>
    </div>
    <div><label for="observacao">Observação</label></div>
    <div><textarea name="observacao" id="observacao" rows="3" cols="70"></textarea></div>
    <p class="alerta"><strong>Só preencha os campos de senha se desejar alterá-la</strong></p>
    <div><label for="senha">Senha</label></div>
    <div><input type="password" name="senha" id="senha" /> </div>
    <div><label for="senha2">Repetir Senha</label></div>
    <div><input type="password" name="senha2" id="senha2" /> </div>
    <input type="submit" value="Salvar" />
    <input type="reset" value="Limpar" />
</form>
    <div id="loading" style="display: none;">Carregando...</div>
    <!--#include file="../../inc/scripts.asp"  -->
    <script>$(document).ready(function () {
     var url="repositorio/dados/dados-usuarios.asp";
    $.ajax({
    type: 'POST',
    url: url,
    async: false,
    contentType: "application/json",
    dataType: 'json',
    data: { q : <% =Request.Querystring("q") %> },
    success: function(result){
                alert(result);
    },
    beforeSend: function(){
        $('#loading').css({display:"block"});
    },
    complete: function(msg){
        $('#loading').css({display:"none"});
    }
    });

    });//Fim jquery
    </script>

</body>
</html>
