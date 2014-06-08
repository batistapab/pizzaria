$(document).ready(function () {
    
    function toGrana(number) {
        var number = number.toString(),
        moeda = number.split('.')[0],
        centavos = (number.split('.')[1] || '') + '00';
        moeda = moeda.split('').reverse().join('')
            .replace(/(\d{3}(?!$))/g, '$1,')
            .split('').reverse().join('');
        return moeda + '.' + centavos.slice(0, 2);
    }

    var operacao = "A"; //"A"=Adição; "E"=Edição
   // var indice_selecionado = 0;
    var tbProdutos = localStorage.getItem("tbProdutos");// Recupera os dados armazenados
    tbProdutos = JSON.parse(tbProdutos); // Converte string para objeto
    if (tbProdutos == null) // Caso não haja conteúdo, iniciamos um vetor vazio
        tbProdutos = [];

    function Listar() {
        var numeroDeItens = 0;
        var subtotal = 0;
            $("#tabelaPedidos").html("");
            $("#tabelaPedidos").html(
                      "<thead>                         " +
                      "    <tr>                        " +
                      "        <th>Produto</th>        " +
                      "        <th>Quantidade</th>     " +
                      "        <th>Valor unitário (R$)</th> " +
                      "        <th>Subtotal</th>          " +
                      "        <th></th>               " +
                      "    </tr>                       " +
                      "</thead>                        " +
                      "<tbody>                         " +
                      "</tbody>                        " +
                      "<tfoot>                         " +
                      "</tfoot>                        "
              );
            for(var i in tbProdutos){
                var prod = JSON.parse(tbProdutos[i]);
                $("#tabelaPedidos tbody").append("<tr>"+                    
                    "	<td><input type='hidden' value='"+prod.Id+"' name='id' />"+ prod.NomeProduto + "</td>" +
                    "	<td><input type='hidden' value='" + prod.Qtde + "' name='qtde' />" + prod.Qtde + "</td>" +
                    "	<td><input type='hidden' value='"+ toGrana(prod.Valor) +"' name='valor' />" + toGrana(prod.Valor) + "</td>" +
                    "	<td>"+toGrana(prod.Qtde * prod.Valor)+"</td>" +
                    '   <td> <img src="img/fail.png" class="imgOperacoes btnExcluir" alt="' + i + '" title="excluir" />' +
                    "</tr>");
                
                numeroDeItens += parseInt(prod.Qtde);
                subtotal += (parseInt(prod.Qtde) * prod.Valor);
            }
            $("#tabelaPedidos tfoot").html("<tr>" +
                    "	<td>Itens</td>" +
                    "	<td>" + numeroDeItens + "</td>" +
                    "	<td>Subtotal</td>" +
                    "	<td><b> R$ " + toGrana(subtotal) + "</td>" +
                    "	<td></td>" +
                    "</tr>"
            );
            $("#spanTotal").append("<b> R$ " + toGrana(subtotal + 6) + "</b> (R$" + toGrana(subtotal) + " + R$ 6.00 Tx. de Entrega)");
            $("#totalPedido").val(toGrana(subtotal + 6));
        }
             

    function Excluir(indice_selecionado) {
        tbProdutos.splice(indice_selecionado, 1);
        localStorage.setItem("tbProdutos", JSON.stringify(tbProdutos));
        alert("Item excluído da sua lista.");
        window.location.reload();
    }

   Listar();

    $(".btnExcluir").bind("click", function () {
        indice_selecionado = parseInt($(this).attr("alt"));
        Excluir(indice_selecionado);
    });

    $("#btnFinalizar").on("click", function () {
        var isGood = confirm('Você deseja finalizar o seu pedido?');
        if (isGood) {
            window.location.href = 'login.asp';
        } 
    });
    /*
    $("#btnConcluir").on("click", function () {
        var isGood = confirm('Você deseja finalizar o seu pedido?');

        if (isGood) {
            var url = "repositorio/dados/dados-pedidos.asp";
            var action = $(".button").text();
            var id = $("[name='id']").val();
            var qtde = $("[name='qtde']").val();
            var metodo_de_pagamento = $("[name='metodo_de_pagamento']").val();
            dados = "action=" + action + "&id=" + id + "&qtde=" + qtde + "&metodo_de_pagamento=" + metodo_de_pagamento + "";

            $.ajax({
                url: url,
                type: "POST",
                data: dados,
                success: function (data, textStatus, jqXHR) {
                    alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Erro");
                }
            });
        }
    });
    */
});