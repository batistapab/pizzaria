<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Cardápio - Click Pizzas</title>
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
            <div id="verificacep">
                <p><b>Verifique se a entrega está disponível para o seu endereço: </b>
                   <label for="cep">CEP:</label> <input type="text" name="cep" id="cep" class="cep" placeholder="00000-000" maxlength="9" title="CEP" />  <span id="retornocep"></span>            
                </p>
            </div>
               <div class="cardapio">
                   <h2>Pizzas tradicionais</h2>
                   <img src="img/pizza.jpg" alt="pizzas tradicionais" title="pizzas tradicionais" />
                   <h2>Bebidas</h2>
                   <img src="img/refrigerantes.png" alt="Bebidas" title="Bebidas" />
                   <h2>Monte sua pizza</h2>
                   <img src="img/ingredientes.png" alt="Ingredientes" title="Ingredientes" />
               </div>
               <div id="produtos">

               </div>
        </div>
    <script src="js/verificacep.js"></script>
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
</body>
</html>
