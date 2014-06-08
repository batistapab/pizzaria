        <div id="topo">
            <div id="logo">
                    <img src="img/pizzaVetor.png"  alt="Click Pizzas" title="Click Pizzas" />
                    <h1>Click Pizzas </h1>
                    <h3>A sua pizzaria interativa !</h3>
                </div>
                <nav class="menu">
                    <ul>
                        <li><a href="index.asp">Principal</a></li>
                        <li><a href="cardapio.asp">Cardápio</a></li>  
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
