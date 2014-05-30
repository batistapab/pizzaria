<!--#include file="../../inc/seguranca.asp"  -->
<script src="../../js/jquery.js"></script>    
<link rel="stylesheet" type="text/css" href="../../css/estilo.css">
<form class="cadastro" id="editar-produto" action="../../processos.asp" method="post">
    <h2>Editar Produto</h2>
    <input type="hidden" name="operacao" id="operacao" value="04" />
    <input type="hidden" name="acao" id="acao" value="editar" />       
    <input type="hidden" name="idproduto" id="idproduto" value="0" />
    <div><label for="produto">Produto</label></div>
    <div><input type="text" name="produto" id="produto" maxlength="150" required /> </div>
    <div><label for="categoria">Categoria</label></div>
    <div>
        <select name="categoria" id="categoria" required>
            <option value=""></option>            
            <option value="1">Alimento</option>
            <option value="2">Bebida</option>
            <option value="3">Ingrediente</option>
        </select>
    </div>
    <div><label for="valor">Valor</label></div>
    <div><input type="number" step="any" min="0" name="valor" id="valor" required /> </div>
    <div><label for="descricao">Descrição</label></div>
    <div><textarea name="descricao" id="descricao" rows="5" cols="60"></textarea></div>
    <input type="submit" value="Salvar" />
    <input type="reset" value="Limpar" />
</form>
 <script>$(document).ready(function () {
  var url="../dados/dados-produtos.asp";
  var data="q=<% =Request.Querystring("q") %>"
   
  var requisicao=$.ajax({
  url:  url,
  type: "POST",
  data: data,
  dataType : "json",
  success: function(retorno){
      $("#idproduto").val(retorno[0].ID); 
      $("#produto").val(retorno[0].PRODUTO); 
      $("#categoria").val(retorno[0].CATEGORIA); 
      $("#valor").val(retorno[0].VALOR);
      $("#descricao").val(retorno[0].DESCRICAO); 
    },
    error: function(erro){
     alert(erro);
    }  
    });     
       
   });//Fim jquery
    </script>
