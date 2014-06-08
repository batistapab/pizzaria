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
	                       <% Case "pedidos" %>
		                       <!--#include file="repositorio/pedidos/pedidos.asp"-->
                            <% Case "lista-pedidos" %>
		                       <!--#include file="repositorio/pedidos/lista-pedidos.asp"-->
	                       <% Case "pedidos-recentes" %>

	                       <%   'usuarios  %>
	                       <%   Case "editar-usuario" %>
		                        <!--#include file="repositorio/usuarios/editar-usuario.asp"-->
                           <%   Case "cadastrar-usuario" %>
		                        <!--#include file="repositorio/usuarios/cadastrar-usuario.asp"-->
	                       <%  Case "lista-de-usuarios" %>
		                        <!--#include file="repositorio/usuarios/lista-de-usuarios.asp"-->
	                       <%  Case "documentos" %>
		                        <!--#include file="repositorio/usuarios/documentos.asp"-->

                      
                            <%   'produtos %>
	                       <%  Case "cadastrar-produtos" %>
		                       <!--#include file="repositorio/produtos/cadastrar-produtos.asp"-->
	                       <%   Case "editar-produtos" %>
		                        <!--#include file="repositorio/produtos/editar-produtos.asp"-->
	                       <%   Case "lista-de-produtos" %>
		                         <!--#include file="repositorio/produtos/lista-de-produtos.asp"-->

                           <%  'Este é o valor default
	                         Case Else %>
		                        <!--#include file="repositorio/pedidos/lista-pedidos.asp" -->
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
    
       <% 
        if checa_documento(idUsuario) = true  then     
        if id<>"pedidos" then 
        %>
            var tbProdutos = localStorage.getItem("tbProdutos"); 
            tbProdutos = JSON.parse(tbProdutos); 
            if (tbProdutos != null) 
           window.location.href = "home.asp?id=pedidos";

       <% 
        end if
        else
             if id<>"documentos" then 
             Response.Write(checa_documento(idUsuario))
             end if
        end if
         %>
      });

    </script>

</body>
</html>
