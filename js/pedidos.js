$(document).ready(function () {
    var operacao = "A"; //"A"=Adição; "E"=Edição
    var indice_selecionado = -1;
    var tbProdutos = localStorage.getItem("tbProdutos");// Recupera os dados armazenados
    tbProdutos = JSON.parse(tbProdutos); // Converte string para objeto
    if (tbProdutos == null) // Caso não haja conteúdo, iniciamos um vetor vazio
        tbProdutos = [];

    function Adicionar($id, $qtde, $nomeProduto, $valor, $contentID) {
        var prod = GetProduto("Id", $id);
        if (prod != null) {
            alert("Produto já cadastrado.");
            return;
        }

        var produto = JSON.stringify({
            Id: $id,
            NomeProduto: $nomeProduto,
            Valor: $valor,
            Qtde: $qtde,
            ContentID: $contentID
        });

        tbProdutos.push(produto);

        localStorage.setItem("tbProdutos", JSON.stringify(tbProdutos));
        window.location.reload();
        alert("Produto adicionado ao carrinho.");
        return true;
    }

    function Editar($id, $qtde, $nomeProduto, $valor, $contentID) {
        tbProdutos[indice_selecionado] = JSON.stringify({
            Id: $id,
            NomeProduto: $nomeProduto,
            Valor: $valor,
            Qtde: $qtde,
            ContentID: $contentID
        });
        localStorage.setItem("tbProdutos", JSON.stringify(tbProdutos));
        window.location.reload();
        alert("Informações editadas.")
        operacao = "A";
        return true;
    }

    function Listar() {
        var numeroDeItens = 0;
        var subtotal = 0;
        for (var i in tbProdutos) {
            var prod = JSON.parse(tbProdutos[i]);
            $("#itens-pedido").append(' <div>' +
             '<p>' + prod.NomeProduto +
             ' <img src="img/fail.png" class="imgOperacoes btnExcluir" alt="' + i + '" title="excluir" />' +
             ' <img src="img/edit.png" class="imgOperacoes btnEditar" alt="' + i + '" title="Editar" />' +
             '</p>' +
                       '<p>(' + prod.Qtde + ' x R$ ' + toGrana(prod.Valor) + ')  <b>Total R$ ' + toGrana(prod.Qtde * prod.Valor) + '</b></p>' +
                       '<input type="hidden" name="idproduto" value="' + prod.Id + '" />' +
                       '</div>');
            numeroDeItens += parseInt(prod.Qtde);
            subtotal += (parseInt(prod.Qtde) * prod.Valor);
        }
        $("#subtotal").text(subtotal);
        $("#numeroDeItens").text(numeroDeItens);
        //O valor total é a soma do subtotal com  a taxa de entrega que é R$ 6,00
        $("#valorTotal").text(subtotal + 6);
    }

    function Excluir() {
        indice_selecionado = parseInt($(this).attr("alt"));
        tbProdutos.splice(indice_selecionado, 1);
        localStorage.setItem("tbProdutos", JSON.stringify(tbProdutos));
        alert("Registro excluído.");
        window.location.reload();
    }


    function GetProduto(propriedade, valor) {
        var prod = null;
        for (var item in tbProdutos) {
            var i = JSON.parse(tbProdutos[item]);
            if (i[propriedade] == valor)
                prod = i;
        }
        return prod;
    }

    Listar();

    $(".produtos-cardapio .button").on("click", function () {

        var $id = $(this).val();
        var $qtde = $(this).siblings('.qtde').val();
        var $contentID = $(this).parent().parent('div').attr('id');
        var $nomeProduto = $(this).parent().parent('div').find('b').text();
        var $valor = $(this).parent().parent('div').find('span').text();

        if (typeof ($qtde) === 'undefined') {
            $qtde = $(this).parent().parent('tr').find('.qtde').val();
            $valor = $(this).parent().parent('tr').find('span').text();
            $nomeProduto = $(this).parent().parent('tr').find('.nomeProduto').text();
            $contentID = $(this).parent().parent().parent().parent('table').attr('id');

        }
        if (operacao == "A") {

            if ($qtde.length > 0) {
                return Adicionar($id, $qtde, $nomeProduto, $valor, $contentID);
            } else {
                alert("Você precisa informar a quantidade de itens!");
            }
        }
        else
            return Editar($id, $qtde, $nomeProduto, $valor, $contentID);
    });

    $(".btnEditar").on("click", function () {
        operacao = "E";
        indice_selecionado = parseInt($(this).attr("alt"));
        var prod = JSON.parse(tbProdutos[indice_selecionado]);
        $("#" + prod.ContentID + " .qtde").val(prod.Qtde);
        $("#" + prod.ContentID + " .qtde").css("background-color", "#F7F3B5");
        $("#" + prod.ContentID + " .qtde").focus();
    });

    $(".btnExcluir").bind("click", function () {
        indice_selecionado = parseInt($(this).attr("alt"));
        Excluir();
    });

    $("#btnFinalizar").on("click", function () {
        var isGood = confirm('Você deseja finalizar o seu pedido?');
        if (isGood) {
            window.location.href = 'login.asp';
        } 
    });
});