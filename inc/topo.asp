        <div id="topo">
            <div id="logo">
                    <img src="img/pizzaVetor.png"  alt="Click Pizzas" title="Click Pizzas" />
                    <h1>Click Pizzas </h1>
                    <h3>A sua pizzaria interativa !</h3>
                </div>
                <section id="telefones"><span>Disque Pizza</span><br /> (011) 2222-2222 | 3333-3333</section>
                <nav class="menu">
                    <ul>
                        <li><a href="index.asp">Principal</a></li>
                        <li><a href="historia.asp">História</a></li>
                        <li><a href="cardapio.asp">Cardápio</a></li>                        
                        <li><a href="contatos.asp">Contatos</a></li>
                         <% if Request.Cookies("nome")<>"" then %>                        
                       <!-- <li><a href="pedidos.asp">Pedidos</a></li>-->
                        <li><a href="home.asp">Minha página</a></li>
                        <li><a href="sair.asp">Sair</a></li>
                        <% else %>
                        <li><a href="login.asp">Login</a></li>
                         <%end if %>

                    </ul>
                </nav>
        </div>
