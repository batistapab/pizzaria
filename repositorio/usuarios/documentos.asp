<div id="carregaform"><% =listar_documentos(idUsuario) %></div>
<script>
    $(document).ready(function() {
        $( ".button" ).click(function() {              
             var url = "repositorio/dados/dados-documentos.asp";
		     var action=$(".button").text();
			 var id=$("#id").val();
			 var rg=$("#rg").val();
			 var cpf=$("#cpf").val();
              dados= "action="+action+"&id="+id+"&rg="+rg+"&cpf="+cpf+"";

               $.ajax({
                url : url,
                type: "POST",
                data : dados,
                success: function(data, textStatus, jqXHR)
                {
                     alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                         alert("Erro");
                }
          });

      }); 
     
      }); 
</script>