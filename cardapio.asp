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
                           <section id="pizzasTradicionais" class="produtos-cardapio"></section>                 
                       <label>Bebidas</label>
                           <section id="bebidas-cardapio" class="produtos-cardapio"></section> 
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
                   <div id="itens-pedido">
                       <div>
                           <p>Pizza de mussarela <a href="#"><img src="img/fail.png" class="excluir" alt="excluir" title="excluir" /></a></p>
                           <p>Qtde: 2   R$ 40,00</p>
                       </div>
                       <div>
                           <p>Coca-cola 2 Litro  <a href="#"><img src="img/fail.png" class="excluir" alt="excluir" title="excluir" /></a></p>
                           <p>Qtde: 2   R$ 14,00</p>
                       </div>
                       <div>
                           <p>Coca-cola Lata  <a href="#"><img src="img/fail.png" class="excluir" alt="excluir" title="excluir" /></a></p>
                           <p>Qtde: 2   R$ 7,00</p>
                       </div>
                   </div>
                   <div id="calculando">
                       <p>Itens: <label id="qtdedeitens">6</label></p>
                       <p>Subtotal: <label id="subtotal">R$ 61,00</label></p>
                       <p>Tx. de entrega: <label id="txdeentrega">R$ 6,00</label></p>
                       <p id="totalpedido">Total: <label>R$ 67,00</label></p>
                       <button class="button">Finalizar pedido</button>
                       <br />
                   </div>
               </div>
        </div>
    <script src="js/cardapio.js"></script>    
	<script src="jquery_ui/ui/jquery.ui.core.js"></script>
	<script src="jquery_ui/ui/jquery.ui.widget.js"></script>
	<script src="jquery_ui/ui/jquery.ui.accordion.js"></script>    
	<script>
	$(function() {
		$( ".ac-container" ).accordion();
	});
	</script>
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
</body>
</html>
