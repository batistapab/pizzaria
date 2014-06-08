<nav id="menuServicos">
    <h2>Painel de acesso</h2>
        <ul>
            <li><a href="?id=lista-pedidos" id="lista-pedidos">Meus pedidos</a></li>          
            <li><a href="?id=editar-usuario" id="editar-usuario">Meus dados</a></li>    
            <li><a href="?id=documentos" id="documentos">Documentos</a></li>
        </ul>
    <% if perfil=1 then %>  
    <h2>Produtos</h2>
        <ul>
            <li><a href="?id=cadastrar-produtos" id="cadastrar-produtos">Cadastrar produtos</a></li>
            <li><a href="?id=lista-de-produtos" id="lista-de-produtos">Lista de produtos</a></li>
        </ul>    
    <h2>Usuários</h2>
        <ul>
            <li><a href="?id=cadastrar-usuario" id="cadastrar-usuario">Cadastrar usuário</a></li>
            <li><a href="?id=lista-de-usuarios" id="lista-de-usuarios">Lista de usuários</a></li>    
        </ul>
    <%end if %>
</nav>