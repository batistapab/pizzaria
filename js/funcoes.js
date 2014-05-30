$(document).ready(function () {
    var data = "q=0";//O zero será usado pois exibirá todos os usuários  
    var requisicao = $.ajax({
        url: "repositorio/dados/dados-usuarios.asp",
        type: "POST",
        data: data,
        dataType: "json",
        success: function (retorno) {
            if (retorno.length === 0) {
                $("#retornolista").append("<h3>Não existem usuários cadastrados!</h3>");
            }
            else {
                $("#retornolista").append("<table>");
                $("#retornolista table").attr("class", "listas");
                $("#retornolista .listas").append("<thead>");
                $("#retornolista .listas thead").append("<tr><th>Nome</th><th>E-mail</th><th>Perfil</th><th>Status</th><th></th></tr>");
                $("#retornolista .listas").append("<tbody>");
                $.each(retorno, function (i, item) {
                    var tbody = "<tr><td>" + item.NOME.toLowerCase() + "</td><td>" + item.EMAIL + "</td><td>" + item.PERFIL_EXT + "</td>"
                    tbody += "<td>" + item.STATUS_EXT + "</td><td><a href='repositorio/usuarios/dados-usuario.asp?q=" + item.ID + "' class='ver'>"
                    tbody += "<img src='img/edit.png' alt='Editar' /></a>"
                    tbody += "<a href='javascript:void(0)' onclick='ExcluirUsuario(" + item.ID + ");'><img src='img/trash.png' alt='Excluir' /></a></td></tr>";
                    $("#retornolista .listas tbody").append(tbody);

                });
            }
        },
        beforeSend: function () {
            $("#loading").css({ display: "block" });
        },
        complete: function (msg) {
            $("#loading").css({ display: "none" });
        },
        error: function (erro) {
            alert(erro);
        }
    });

    var data = "q=0";//O zero será usado pois exibirá todos os produtos  
    var requisicaoProdutos = $.ajax({
        url: "repositorio/dados/dados-produtos.asp",
        type: "POST",
        data: data,
        dataType: "json",
        success: function (retorno) {
            if (retorno.length === 0) {
                $("#listadeprodutos").append("<h3>Não existem produtos cadastrados!</h3>");
            }
            else {
                $("#listadeprodutos").append("<table>");
                $("#listadeprodutos table").attr("class", "listas");
                $("#listadeprodutos .listas").append("<thead>");
                $("#listadeprodutos .listas thead").append("<tr><th>Produto</th><th>Categoria</th><th>Preço</th><th>Descrição</th><th></th></tr>");
                $("#listadeprodutos .listas").append("<tbody>");
                $.each(retorno, function (i, prod) {
                    var tbody = "<tr><td>" + prod.PRODUTO + "</td><td>" + prod.CATEGORIA_EXT + "</td><td> R$ " + prod.VALOR + "</td><td>" + prod.DESCRICAO + "</td>"
                    tbody += "</td><td><a href='repositorio/produtos/editar-produtos.asp?q=" + prod.ID + "' class='ver'>"
                    tbody += "<img src='img/edit.png' alt='Editar' /></a>"
                    tbody += "<a href='javascript:void(0)' onclick='ExcluirProduto(" + prod.ID + ");'><img src='img/trash.png' alt='Excluir' /></a></td></tr>";
                    $("#listadeprodutos .listas tbody").append(tbody);

                });
            }
        },
        beforeSend: function () {
            $("#loading").css({ display: "block" });
        },
        complete: function (msg) {
            $("#loading").css({ display: "none" });
        },
        error: function (erro) {
            alert(erro);
        }
    });
});//Fim jquery

function ExcluirProduto(x) {
    var id = x;
    if (confirm("Você tem certeza absoluta que deseja excluir este produto?")) {
        var xmlhttp = new XMLHttpRequest();
        var url = "repositorio/dados/dados-produtos.asp";
        var params = "action=excluir & parametro=" + id;
        xmlhttp.open("POST", url, true);
        //Send the proper header information along with the request
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.setRequestHeader("Content-length", params.length);
        xmlhttp.setRequestHeader("Connection", "close");
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {                
                alert(xmlhttp.responseText);
                window.location.reload();
            }
        }
        xmlhttp.send(params);
    } else {
        return false;
    }
};   //Fim excluir produto