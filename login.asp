<!DOCTYPE html>
<html lang="pt-br">
<head>
<!--#include file="inc/metatags.asp"  -->
    <title>Click Pizzas</title>
    <link rel="stylesheet" href="jquery_ui/ui-lightness/jquery-ui-1.10.4.custom.min.css">
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
            <div id="tabs">
              <ul>
                <li><a href="#tabs-1">Já sou cadastrado</a></li>
                <li><a href="#tabs-2">Cadastre-se</a></li>
              </ul>
               <form id="tabs-1" method="post" action="logar.asp"> 
                   <input type="hidden" name="op" value="1" />   
                   <br />
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
               </form>
               <form id="tabs-2" method="post" action="logar.asp">                    
                   <input type="hidden" name="op" value="2" />     
                   <br />
                       <table>
                           <caption>Dados pessoais</caption>
                           <tr>
                               <th>Telefone</th>
                               <th colspan="2">Nome</th>
                           </tr>
                           <tr>
                               <td><input type="tel" class="telefone" name="telefone" id="telefone" maxlength="16" required /> </td>
                               <td colspan="2"><input type="text" name="nome" id="nome" maxlength="150" required /></td>
                           </tr>
                           <tr>
                               <th>E-mail</th>
                               <th>Senha</th>
                               <th>Confirmação de senha</th>
                           </tr>
                           <tr>
                               <td><input type="email" name="email" id="email2" placeholder="Digite seu e-mail" maxlength="80" required /></td>
                               <td><input type="password" name="senha" id="senha2" maxlength="10" required /></td>
                               <td><input type="password" name="confirmarsenha" id="confimarsenha" maxlength="10" required /></td>
                           </tr>
                       </table>
                       <table>
                           <caption>Dados para entrega</caption>
                           <tr>
                               <th>CEP: <input type="text" name="cep" id="cep" class="cep" maxlength="9" placeholder="12345-678" required /></th>
                               <td colspan="2"></td>
                           </tr>
                           <tr>
                               <td>Endereço</td>
                               <td>Número</td>
                               <td>Complemento</td>
                           </tr>
                           <tr>
                               <th><input type="text" name="endereco" id="endereco" maxlength="255" required /></th>
                               <th><input type="text" name="numero" id="numero" maxlength="10" required  /></th>
                               <th><input type="text" name="complemento" id="complemento" maxlength="20" /></th>
                           </tr>
                           <tr>
                               <td>Bairro</td>
                               <td>Cidade</td>
                               <td>Estado</td>
                           </tr>
                           <tr>
                               <th><input type="text" name="bairro" id="bairro" maxlength="255" required /></th>
                               <th><input type="text" name="cidade" id="cidade" maxlength="255" required  /></th>
                               <th>
                                   <select name="estado" id="estado" required>
                                        <option value="SP">São Paulo</option>
                                       <!--> <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espirito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="PR">Paraná</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>

                                           -->
                                    </select>

                               </th>
                           </tr>
                           <tr>
                               <th colspan="3">Ponto de referência</th>
                           </tr>
                           <tr>
                               <td colspan="3"><input type="text" name="referencia" id="referencia" maxlength="255" /></td>
                           </tr>
                           <tr>
                               <td colspan="3"><button>Cadastrar usuário</button></td>
                           </tr>
                       </table>
               </form>
            </div>
           <!--#include file="inc/apoio.asp"  -->
        </div>
        
    <!--#include file="inc/footer.asp"  -->
    </div>
    <!--#include file="inc/scripts.asp"  -->
   <script src="jquery_ui/ui/jquery-ui.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script>
     $(document).ready(function() {
        $("#tabs").tabs();
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
