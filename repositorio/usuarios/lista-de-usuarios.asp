<h2>Lista de usuários</h2>
<div id="retornolista"></div>
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
            $("#retornolista .listas tbody").append("<tr><td>"+item.NOME.toLowerCase()+"</td>><td>"+item.EMAIL+"</td>><td>"+item.PERFIL_EXT+"</td>><td>"+item.STATUS_EXT+"</td></tr>");
             
         }); 
     }
    },
    error: function(erro){
     alert(erro);
    }  
    });     
       
   });//Fim jquery
    </script>