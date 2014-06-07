<!--#include file="inc/funcoes.asp"  -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Cardápio - Click Pizzas</title>   
	<link rel="stylesheet" href="jquery_ui/ui-lightness/jquery-ui-1.10.4.custom.css">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css" /> 
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
    <div id="main">
        <!--#include file="inc/topo.asp"  -->
        <div id="conteudo">
               <div class="cardapio">
                   <h2 class="pizzasTradicionais">Pizzas tradicionais</h2>
                   <img src="img/pizza.jpg" class="pizzasTradicionais" alt="pizzas tradicionais" title="pizzas tradicionais" />
                   <h2 class="bebidas">Bebidas</h2>
                   <img src="img/refrigerantes.png" class="bebidas-cardapio" alt="Bebidas" title="Bebidas" />
                   <h2 class="montesuapizza">Monte sua pizza</h2>
                   <img src="img/ingredientes.png" class="montesuapizza" alt="Ingredientes" title="Ingredientes" />
               </div>
               <div id="produtos-cardapio">                   
                    <div id="verificacep">
                        <p><b>Disponibilidade de entrega: </b> <input type="text" name="cep" id="cep" class="cep" placeholder="Digite seu CEP" maxlength="9" title="CEP" />  <span id="retornocep"></span>            
                        </p>
                    </div>
                   <div class="ac-container">                       
                       <label>Pizzas tradicionais</label>
                           <section id="pizzasTradicionais" class="produtos-cardapio">
                               <% 
                                      Response.Write listar_produtos(1)
  
                                %>

                           </section>                 
                       <label>Bebidas</label>
                           <section id="bebidas-cardapio" class="produtos-cardapio"> 
                               <% 
                                      Response.Write listar_produtos(2)
                               %>

                           </section> 
                      <!--             
                       <label>Monte sua pizza</label>
                           <section id="montesuapizza" class="produtos-cardapio"></section>
                       -->
                   </div>
               </div>
               <div id="opedido">
                   <h2>Tempo de entrega</h2>
                   <p><img src="img/clock.png" alt="tempo" title="tempo para entrega" /> De 45 à 60 minutos</p>     
                   <h2>Seu pedido <img src="img/carrinho.png" class="imgCarrinho" alt="Seu pedido" title="Seu pedido" /></h2>
                   <div id="itens-pedido"></div>
                   <div id="calculando">
                       <p><b>Itens: <label id="numeroDeItens"></label></b></p>
                       <p><b>Subtotal: R$ <label id="subtotal"></label></b></p>
                       <p><b>Tx. de entrega: <label id="txdeentrega">R$ 6,00</label></b></p>
                       <p id="totalpedido"><b>Total: R$ <label id="valorTotal"></label></b></p>
                        
                       <button class="button" id="btnFinalizar">Finalizar pedido</button>
                      
                       <br />
                   </div>
               </div>
        </div>
    <script src="js/storage.js"></script>    

    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
</body>
</html>
