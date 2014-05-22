<h2>Lista de usuários</h2>
<div id="retornolista"><div id="loading" style="display: none;">Carregando...</div></div>
 <script>$(document).ready(function () {
  var url="repositorio/dados/dados-usuarios.asp";
  var data="q=0";//O zero será usado pois exibirá todos os usuários
   
  var requisicao=$.ajax({
  url:  url,
  type: "POST",
  data: data,
  dataType : "json",
  success: function(retorno){
     if(retorno.length===0){
        $("#retornolista").append("<h3>Não existem usuários cadastrados!</h3>");     
       }
     else{
            $("#retornolista").append("<table>");
            $("#retornolista table").attr("class", "listas");
            $("#retornolista .listas").append("<thead>");
            $("#retornolista .listas thead").append("<tr><th>Nome</th><th>E-mail</th><th>Perfil</th><th>Status</th><th></th></tr>");
            $("#retornolista .listas").append("<tbody>");
            $.each(retorno, function(i, item) {
            $("#retornolista .listas tbody").append("<tr><td>"+item.NOME.toLowerCase()+"</td>><td>"+item.EMAIL+"</td>><td>"+item.PERFIL_EXT+"</td>><td>"+item.STATUS_EXT+"</td><td><a href='repositorio/usuarios/dados-usuario.asp?q="+item.ID+"' class='ver'><img src='img/edit.png' alt='Editar' /></a><a href='#'><img src='img/trash.png' alt='Editar' /></a></td></tr>");
             
         }); 
     }
    },
    beforeSend: function(){
        $("#loading").css({display:"block"});
    },
    complete: function(msg){
        $("#loading").css({display:"none"});
    },
    error: function(erro){
     alert(erro);
    }  
    });     
       
   });//Fim jquery
    </script>