$(document).ready(function () {
    $("#verificacep #cep").on('keyup keydown', function () {
        //Quando o usuário digitar ou parar de fazê-lo, obtenho os dados digitados
        var cep = $("#verificacep #cep").val();
        var limpaRetornoDoCep = function () {
            $('#retornocep').text("").fadeOut(1000);
            if ($('#retornocep').hasClass("sucess") == true) {
                $('#retornocep').removeClass("sucess");
            } else {
                $('#retornocep').removeClass("fail");
            }
        };
        limpaRetornoDoCep();
        //Tiramos os espaço em branco
        cep = cep.trim();

        //verificamos se possui 9 caracteres e se a variável é exatamente identica === (valor e tipo);
        if (cep.length === 9) {
            //Por enquanto os ceps cadastrados ficarão num array 
            var listaDeCeps = ['11111-111', '22222-222', '33333-333', '44444-444', '55555-555']

            //Verificamos se o cep digitado foi encontrado. Se foi localizado a variavel localizou receberá a posição do objeto que pode ser >=0 e se não foi localizado recebe -1
            var localizou = listaDeCeps.indexOf(cep);
            if (localizou > -1) {
                $("#retornocep").attr("class", "sucess");
                $("#retornocep").append("Entrega disponível!").fadeIn(1000);
            }
            else {
                $("#retornocep").attr("class", "fail");
                $("#verificacep #cep").val("");
                $("#retornocep").append("Entrega não disponível!").fadeIn(1000);
            }
        }
    });



});