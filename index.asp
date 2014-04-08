<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Home - Click Pizzas</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css" />
    <!-- HTML5 shiv, faz que o IE6-8 suporte elementos HTML5 -->
    <!--[if lt IE 9]>
     <script src="js/html5shiv.js"></script>
    <![endif]-->    
    <link rel="stylesheet" href="nivo/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="nivo/nivo-default.css" type="text/css" media="screen" />
</head>
<body>
    <div id="main">
        <!--#include file="inc/topo.asp"  -->
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
