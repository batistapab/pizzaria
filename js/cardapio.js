$(document).ready(function () {
    $("#verificacep #cep").on('keyup keydown', function () {
        //Quando o usuário digitar ou parar de fazê-lo, obtenho os dados digitados
        var cep = $("#verificacep #cep").val();
        var limpaRetornoDoCep = function () {
            $('#retornocep').text("").fadeOut(1000);
            if ($('#retornocep').hasClass("sucess") == true) {
                $('#retornocep').removeClass("sucess");
            } else {
                $('#retornocep').removeClass("fail");
            }
        };
        limpaRetornoDoCep();
        //Tiramos os espaço em branco
        cep = cep.trim();

        //verificamos se possui 9 caracteres e se a variável é exatamente identica === (valor e tipo);
        if (cep.length === 9) {
            //Por enquanto os ceps cadastrados ficarão num array 
            var listaDeCeps = ['11111-111', '22222-222', '33333-333', '44444-444', '55555-555']

            //Verificamos se o cep digitado foi encontrado. Se foi localizado a variavel localizou receberá a posição do objeto que pode ser >=0 e se não foi localizado recebe -1
            var localizou = listaDeCeps.indexOf(cep);
            if (localizou > -1) {
                $("#retornocep").attr("class", "sucess");
                $("#retornocep").append("Entrega disponível!").fadeIn(1000);
            }
            else {
                $("#retornocep").attr("class", "fail");
                $("#verificacep #cep").val("");
                $("#retornocep").append("Entrega não disponível!").fadeIn(1000);
            }
        }
    });

    //Função para exclusão dos produtos do pedido
    $("#itens-pedido .excluir").click(function () {
        var isGood = confirm('Você deseja excluir realmente este parágrafo?');
        if (isGood) {
            // div > p > a > .excluir
            $(this).parent().parent().parent().remove().fadeOut(1000);
        } else {
            alert('false');
        }
    });

    //Carregando os produtos no cardápio de acordo com a categoria    
    
    function carregando(idDiv, idCategoria){
        var data = "q="+idCategoria; //O campo data receberá a categoria do produto 
        $.ajax({
            url: "repositorio/dados/produtos-cardapio.asp",
            type: "POST",
            data: data,
            dataType: "json",
            success: function (retorno) {
                if (retorno.length === 0) {
                    $("#"+idDiv).append("<h3>Não existem produtos cadastrados!</h3>");
                }
                else {
                    var produtos = []; 
                    $.each(retorno, function (i, prod) {
                        if (idDiv == "pizzasTradicionais") {
                        produto = "<div>" +
                                   "<img src='img/produtos/" + prod.CATEGORIA_EXT.toLowerCase() + "/" + prod.FOTO + "' alt='" + prod.PRODUTO + "' title='" + prod.PRODUTO + "' class='imgProdutos' />" +
                                   "<h3>" + prod.PRODUTO + " <span>R$ " + prod.VALOR + "</span></h3> ";
                                     if (prod.DESCRICAO.length > 0){
                                         produto += "<p>" + prod.DESCRICAO + "</p>";
                                     }
                                     produto += "<hr /><p>Qtde: <input type='number' min='0' name='qtde' id='qtde' required />"+
                                   "<button value='" + prod.ID + "' class='button'>Adicionar</button></p>" +
                               "</div>";
                        }
                        else {
                            produto = "<table>" +
                                           "<tr>"+
                                               "<td><img src='img/produtos/" + prod.CATEGORIA_EXT.toLowerCase() + "/" + prod.FOTO + "' alt='" + prod.PRODUTO + "' title='" + prod.PRODUTO + "' class='imgProdutos' /></td>" +
                                               "<td>"+prod.PRODUTO + "</td><td><span>R$ " + prod.VALOR + "</span></td>"+
                                               "<td>Qtde: <input type='number' min='0' name='qtde' id='qtde' required /></td>" +
                                               "<td><button value='" + prod.ID + "' class='button'>Adicionar</button></td>"+
                                           "</tr>" +
                                       "</table>";

                        }
                        produtos.push(produto);

                    });
                    $(produtos.join("")).appendTo("#" + idDiv);
                }
            },
            beforeSend: function () {
                $("#loading").css({ display: "block" });
            },
            complete: function (msg) {
                $("#loading").css({ display: "none" });
            },
            error: function (erro) {
                alert("O carregamento da div "+idDiv+" apresentou os erros a seguir \n "+erro);
            }
        });
    };
    //Carregando as pizzas
    carregando("pizzasTradicionais", 1);
    //Carregando as pizzas
    carregando("bebidas-cardapio", 2);
});