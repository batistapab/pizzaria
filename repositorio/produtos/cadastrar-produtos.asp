<h2>Cadastrar Produtos</h2>
<form class="cadastro" id="cadastrar-produto" action="processos.asp" method="post">
    <input type="hidden" name="operacao" id="operacao" value="03" />
    <input type="hidden" name="acao" id="acao" value="cadastrar" />    
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

