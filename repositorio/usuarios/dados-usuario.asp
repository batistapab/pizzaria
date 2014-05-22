<!--#include file="../../inc/seguranca.asp"  -->
<script src="../../js/jquery.js"></script>    
<link rel="stylesheet" type="text/css" href="../../css/estilo.css">
<form class="cadastro" id="editar-usuario" action="../../processos.asp" method="post">
    <h2>Editar usuário</h2>
    <input type="hidden" name="operacao" id="operacao" value="02" />
    <input type="hidden" name="acao" id="acao" value="editar" />    
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
 <script>$(document).ready(function () {
  var url="../dados/dados-usuarios.asp";
  var data="q=<% =Request.Querystring("q") %>"
   
  var requisicao=$.ajax({
  url:  url,
  type: "POST",
  data: data,
  dataType : "json",
  success: function(retorno){
      $("#idUsuario").val(retorno[0].ID); 
      $("#nome").val(retorno[0].NOME); 
      $("#email").val(retorno[0].EMAIL); 
      $("#perfil").val(retorno[0].PERFIL);
      $("#status").val(retorno[0].STATUSDOUSUARIO);
      $("#observacao").val(retorno[0].OBSERVACAO); 
    },
    error: function(erro){
     alert(erro);
    }  
    });     
       
   });//Fim jquery
    </script>
