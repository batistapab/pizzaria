<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" href="nivo/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo/nivo-default.css" type="text/css" media="screen" />

</head>
<body>
    <div id="main">
        <div id="topo">
            <div id="logo">
                    <img src="img/pizzaVetor.png"  alt="Pizzaria Interativa" title="Pizzaria Interativa" />
                    <h1>Click Pizzas </h1>
                    <h3>O verdareiro sabor da Itália !</h3>
                </div>
                <section id="telefones"><span>Disque Pizza</span><br /> (011) 2222-2222 | 3333-3333</section>
                <nav class="menu">
                    <ul>
                        <li><a href="javascript:void(0);">Home</a></li>
                        <li><a href="javascript:void(0);">Quem somos</a></li>
                        <li><a href="javascript:void(0);">Cardápio</a></li>
                        <li><a href="javascript:void(0);">Pedidos</a></li>
                    </ul>
                </nav>
        </div>
        <div id="conteudo">
                <div id="slider" class="theme-default">
                 <img src="img/nemo.jpg" alt="" title="#htmlcaption1" />
                 <a href="javascript:void(0);"><img src="img/toystory.jpg" alt="" title="#htmlcaption2" /></a>
                 <img src="img/up.jpg" alt=""  title="#htmlcaption3" />
                 <img src="img/walle.jpg" alt="" title="#htmlcaption4" />
                </div>
                <div id="htmlcaption1" class="nivo-html-caption">
                    <strong>Este</strong> is an example of a <em>HTML</em> caption with <a href="javascript:void(0);">a link</a>.
                </div>
                <div id="htmlcaption2" class="nivo-html-caption">
                    <strong>This</strong> o examplo 2 <em>HTML</em> caption with <a href="javascript:void(0);">a link</a>.
                </div>
                <div id="htmlcaption3" class="nivo-html-caption">
                    <strong>This</strong> o exemplo 3 <em>HTML</em> caption with <a href="javascript:void(0);">a link</a>.
                </div>
                <div id="htmlcaption4" class="nivo-html-caption">
                    <strong>This</strong> o exemplo 4 <em>HTML</em> caption with <a href="javascript:void(0);">a link</a>.
                </div>
            <div class="box-conteudo">
                <h2>Cardápio</h2>
            </div>
            <div class="box-conteudo">
                <h2>Promoções</h2>
            </div>            
            <div class="box-conteudo">
                <h2>Nossa localização</h2>
            </div>
            
            <div id="apoio">
                <div id="atendimento">
                    <h2>Atendimento</h2>
                </div>
                <div id="formasDePagamento">
                    <h2>Formas de pagamento</h2>
                    <br />
                    <img src="img/cartoes/master.png" alt="" />                    
                    <img src="img/cartoes/visa.png" alt="" />
                    <img src="img/cartoes/dinners.png" alt="" />
                    <img src="img/cartoes/aura.png" alt="" />
                    <img src="img/cartoes/american.png" alt="" />
                    <img src="img/cartoes/redeshop.png" alt="" />                    
                    <img src="img/cartoes/maestro.png" alt="" />
                    <img src="img/cartoes/elo.png" alt="" />
                    <br />
                    <p>Além dos cartões acima o pagamento presencial na retirada ou na loja pode ser feito com os cartões abaixo.</p>
                    <img src="img/cartoes/cifrao.png" alt="" />
                    <img src="img/cartoes/visavale.png" alt="" />
                    <img src="img/cartoes/sodexo.png" alt="" />
                    <img src="img/cartoes/vr.png" alt="" />
                    
                </div>
                <div id="newsletter">
                    <h2>Receba promoções</h2>
                    <form>
                        <input type="email" name="emailnewsletter" id="emailnewsletter" placeholder="digite seu e-mail" required /> 
                        <button id="cadNewsletter">Cadastrar</button>
                    </form>
                </div>
            </div>
            
            <footer>
                <nav class="menu">                    
                    <ul>
                        <li><a href="javascript:void(0);">Home</a></li>
                        <li><a href="javascript:void(0);">Quem somos</a></li>
                        <li><a href="javascript:void(0);">Cardápio</a></li>
                        <li><a href="javascript:void(0);">Pedidos</a></li>
                        <li><a href="javascript:void(0);">Política de privacidade</a></li>
                    </ul>
                </nav>
                <div id="direitosautorais">
                    &copy; 2014 Direiros reservados - Click Pizzas - Desenvolvido por Nossa Equipe
                    
                    <div id="redessociais">
                        <a href="javascript:void(0);"><img src="img/ico_facebook.png" alt="Facebook" title="Facebook" /></a>                    
                        <a href="javascript:void(0);"><img src="img/twitter.png" alt="Twitter" title="Twitter" /></a>
                        <a href="javascript:void(0);"><img src="img/gplus.png" alt="G+1" title="G+1" /></a>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    
    <script src="js/jquery.js"></script>
    <script src="nivo/jquery.nivo.slider.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider({
                effect: 'random', //Specify sets like: 'fold,fade,sliceDown'
                slices: 15,
                animSpeed: 500, //Slide transition speed
                pauseTime: 3000,
                startSlide: 0, //Set starting Slide (0 index)
                directionNav: true, //Next & Prev
                directionNavHide: true, //Only show on hover
                controlNav: false, //1,2,3...
                controlNavThumbs: false, //Use thumbnails for Control Nav
                controlNavThumbsFromRel: false, //Use image rel for thumbs
                controlNavThumbsSearch: '.jpg', //Replace this with...
                controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                keyboardNav: true, //Use left & right arrows
                pauseOnHover: true, //Stop animation while hovering
                manualAdvance: false, //Force manual transitions
                captionOpacity: 0.8, //Universal caption opacity
                beforeChange: function () { },
                afterChange: function () { },
                slideshowEnd: function () { } //Triggers after all slides have been shown
            });
        });
    </script>


</body>
</html>
