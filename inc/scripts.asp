    <script src="fancybox/source/jquery.fancybox.pack.js"></script>    
    <script>
    $(document).ready(function() {
       $("#exibirPolitica").fancybox({
           "width": 1000,
           "height": 758,
           "scrolling": "no",
           "autoScale": false,
           "transitionIn": "none",
           "transitionOut": "none",
           "onClosed": function () {
               parent.location.reload(true);
           },
           "type": "iframe"
       });
        $(".cep").mask("99999-999");
    });
    </script>