<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Click Pizzas</title>
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
               <form id="formLogin" method="post" action="logar.asp">                   
                   <h2>Acessar sua conta</h2>
                   <fieldset>
                       <div>
                           <label for="email">E-mail:</label>
                       </div>
                       <div>
                           <input type="email" name="email" id="email" placeholder="Digite seu e-mail" />
                       </div>
                       <div>
                           <label for="senha">Senha:</label>
                       </div>
                       <div>
                           <input type="password" name="senha" id="senha" />
                       </div>
                       <div>
                           <button>Acessar</button>
                       </div>
                       <div>
                           <a href="esqueci.asp">Esqueci minha senha</a>
                       </div>
                   </fieldset>
               </form>
            
           <!--#include file="inc/apoio.asp"  -->
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
    <script src="js/jquery.validate.min.js"></script>
    <script>
     $(document).ready(function() {
        $("#formLogin").validate({
		rules: {
			email: {
				required: true,
				minlength: 8,
                maxlength:100,
				email: true
			},
			senha: {
				required: true,
				minlength: 5
			},
		messages: {
			email: {
				required: "Por favor insira um e-mail válido",
				minlength: "O e-mail deve conter no mínimo 8 caracteres",
				maxlength: "O e-mail deve conter no máximo 100 caracteres"
			},
			senha: {
				required: "Por favor insira a senha",
				minlength: "A senha deve conter no mínimo 8 caracteres",
				maxlength: "A senha deve conter no máximo 10 caracteres"
			}
            }
		}
	});
});
</script>
</body>
</html>
