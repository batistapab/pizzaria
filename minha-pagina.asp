<!--#include file="inc/funcoes.asp"  -->
<!--#include file="inc/seguranca.asp"  -->
<!DOCTYPE html>
<html lang="pt-br">
<head>

<!--#include file="inc/metatags.asp"  -->
    <title>Minha página</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css" />
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="js/html5shiv.js"></script>
    <![endif]-->
</head>
<body id="home">
    <div id="main">

        <!--#include file="inc/topo.asp"  -->
        <div id="conteudo">
            <p id="nome-usuario">Olá, <% =Request.Cookies("nome") %></p>
               <nav id="menuServicos">
                   <h2>Pedidos</h2>
                        <ul>
                            <li><a href="#" id="ultimos">Últimos pedidos</a></li>
                            <li><a href="#" id="pendentes">Pedidos pendentes</a></li>
                            <li><a href="#" id="concluidos">Pedidos concluídos</a></li>
                            <li><a href="alterar-senha.asp" id="alterar-senha">Alterar senha</a></li>
                            <li><a href="alterar-dados.asp" id="alterar-dados">Alterar dados</a></li>
                        </ul>
               </nav>
              <div id="content">
                  <h2>Últimos pedidos</h2>
                  <table id="tabelaPedidos">
                      <thead>
                          <tr>
                              <th>Pedido</th>
                              <th>Data</th>
                              <th>Hora</th>
                              <th>Metodo de pag</th>
                              <th>Valor</th>
                              <th>Status do pagamento</th>
                              <th>Status do pedido</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>12</td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                          </tr>
                          <tr>
                              <td>RT</td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                          </tr>
                          <tr>
                              <td>ED</td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                          </tr>
                      </tbody>
                  </table>

              </div>
            
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
    <script>
        
    $(document).ready(function () {
        $("tbody tr:even").css("background-color", "rgba(255,255,255,0.8)");
        });
    </script>

</body>
</html>
