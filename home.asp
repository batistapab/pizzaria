<!--#include file="inc/funcoes.asp"  -->
<!--#include file="inc/seguranca.asp"  -->
<!DOCTYPE html>
<html lang="pt-br">
<head>

<!--#include file="inc/metatags.asp"  -->
    <%
        dim caminho
        id=Request.QueryString("id")    
    %>
    <title>
        <% 
            if id="" then 
                Response.Write("Home")
            else
                ajustaTitleHtml(id)
            end if
        %>
    </title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css" />
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="js/html5shiv.js"></script>
    <![endif]-->
      
<script src="js/funcoes.js"></script> 
</head>
<body id="home">
    <div id="main">
        <!--#include file="inc/topo.asp"  -->
        <div id="conteudo">
            <p id="nome-usuario">Olá, <% =Request.Cookies("nome") %></p>               
              <!--#include file="inc/menu-de-servicos.asp"  -->
              <div id="content">
                  <%
                    '################### Aqui verificamos o id informado 
                    ' Como os arquivos de inclusão são processados antes de qualquero código da página por isso utilizamos a solução abaixo
                      Select Case id
                            'pedidos
                  %>
	                       <% Case "pedidos-recentes" %>
		                       <!--#include file="repositorio/pedidos/pedidos-recentes.asp"-->
	                       <%  Case "pedidos-pendentes" %>
		                       <!--#include file="repositorio/pedidos/pedidos-pendentes.asp"-->
	                        <%  Case "pedidos-concluidos" %>
		                        <!--#include file="repositorio/pedidos/pedidos-concluidos.asp"-->
	                       <%   Case "pedidos-cancelados" %>
		                         <!--#include file="repositorio/pedidos/pedidos-cancelados.asp"-->

	                       <%   'usuarios  %>
	                       <%   Case "editar-usuario" %>
		                        <!--#include file="repositorio/usuarios/editar-usuario.asp"-->
                           <%   Case "cadastrar-usuario" %>
		                        <!--#include file="repositorio/usuarios/cadastrar-usuario.asp"-->
	                       <%  Case "lista-de-usuarios" %>
		                        <!--#include file="repositorio/usuarios/lista-de-usuarios.asp"-->

                      
                            <%   'produtos %>
	                       <%  Case "cadastrar-produtos" %>
		                       <!--#include file="repositorio/produtos/cadastrar-produtos.asp"-->
	                       <%   Case "editar-produtos" %>
		                        <!--#include file="repositorio/produtos/editar-produtos.asp"-->
	                       <%   Case "lista-de-produtos" %>
		                         <!--#include file="repositorio/produtos/lista-de-produtos.asp"-->

                           <%  'Este é o valor default
	                         Case Else %>
		                        <!--#include file="repositorio/pedidos/pedidos-pendentes.asp" -->
                       <% End Select  '################# fim da verificação  %>
                

              </div>
            
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
    <script>
        
    $(document).ready(function () {
        $("tbody tr:even").css("background-color", "rgba(255,255,255,0.8)");        
        $(".ver").fancybox({
           "width": 900,
           "height": 650,
           "scrolling": "no",
           "autoScale": false,
           "transitionIn": "none",
           "transitionOut": "none",
           "afterClose:": function () {
              window.location.reload();
           },
           "type": "iframe"
       });
        });
    </script>

</body>
</html>
