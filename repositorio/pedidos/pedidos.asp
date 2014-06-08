<form action="processos.asp" method="post">
    <input type="hidden" name="operacao" value="5" />
 <h2>Você gostaria de finalizar este pedido?</h2>

<table id="tabelaPedidos">
        <tfoot>
            <tr>
                <th>Itens</th>
                <th></th>
                <th></th>
                <th>Valor Total</th>
                <th></th>
            </tr>
        </tfoot>
    </table>
   <br />
    <div id="dadostotal">Total do pedido: <span id="spanTotal"></span><input type='hidden' name='total' id='totalPedido' /></div>
    <br />
<div id="pagamento">

    <div>
            <label>Método de pagamento</label>
    </div>
    <div>
        <select name="metodo_de_pagamento" id="metodo_de_pagamento" required>
            <option value="Dinheiro">Dinheiro</option>
            <option value="Cartão de crédito">Cartão de crédito</option>
            <option value="VR/VA">VR/VA</option>
        </select>
    </div>
</div>
<br />
<p id="btnParaConclusao"><button id='btnConcluir' class="button">Concluir</button><button id='btnCancelar' class="button-red">Cancelar</button></p>
</form>
<script src="js/pedidos.js"></script>