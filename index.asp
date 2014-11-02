<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Home - Click Pizzas</title>
    <link rel="stylesheet" href="nivo/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo/nivo-default.css" type="text/css" media="screen" />
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
                <div id="slider" class="theme-default">
                 <img src="img/ambiente.jpg" alt="" title="#htmlcaption1" />
                 <a href="javascript:void(0);"><img src="img/forno.jpg" alt="" title="#htmlcaption2" /></a>
                 <img src="img/pizza.jpg" alt=""  title="#htmlcaption3" />
                </div>
                
            <div class="box-conteudo">
                <h2>Cardápio</h2>
                <p>A Click Pizzas tem as melhores pizzas  das região, sem falar em nossos ingredientes italianos secretos passados desde os primeiros proprietários. </p>
                <img src="img/produtos/ALIMENTO/pizza_mussarela.jpg" alt="pizza" title="pizza" />
            </div>
            <div class="box-conteudo">
                <h2>O Ambiente</h2>
                <p>Nossa pizzaria difere das outras não apenas pelo sabor dos nossos produtos, mas também por ser um local aconchegante e familiar.</p>
                <img src="img/ambiente.jpg" alt="ambiente" />
            </div>            
            <div class="box-conteudo">
                <h2>Nossa localização</h2>
               <p>Alameda Olga, 34455206 - Santa Barbara - São Paulo - SP 01155-040</p>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.112383265462!2d-46.662271!3d-23.528459999999964!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce58053bd0d681%3A0xdbf9632047ad0deb!2sAlameda+Olga%2C+206+-+Santa+Cec%C3%ADlia!5e0!3m2!1spt-BR!2sbr!4v1402194316245" width="100%" height="150" frameborder="0" style="border:0"></iframe>
            </div>
            
           <!--#include file="inc/apoio.asp"  -->
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
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
