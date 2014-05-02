<nav id="menuServicos">
    <h2>Pedidos</h2>
        <ul>
            <li><a href="?id=pedidos-recentes" id="pedidos-recentes">Pedidos Recentes</a></li>
            <li><a href="?id=pedidos-pendentes" id="pedidos-pendentes">Pedidos pendentes</a></li>
            <li><a href="?id=pedidos-concluidos" id="pedidos-concluidos">Pedidos concluídos</a></li>
        </ul>
    <h2>Meus dados</h2>
        <ul>
            <li><a href="?id=alterar-senha" id="alterar-senha">Alterar senha</a></li>
            <li><a href="?id=alterar-dados" id="alterar-dados">Alterar dados</a></li>
        </ul>
    <% if perfil=1 then %>
    <h2>Produtos</h2>
        <ul>
            <li><a href="?id=cadastrar-produtos" id="cadastrar-produtos">Cadastrar produtos</a></li>
            <li><a href="?id=editar-produtos" id="editar-produtos">Editar produtos</a></li>
            <li><a href="?id=lista-de-produtos" id="lista-de-produtos">Lista de produtos</a></li>
        </ul>
    <h2>Usuários</h2>
        <ul>
            <li><a href="?id=cadastrar-usuarios" id="cadastrar-usuarios">Cadastrar usuários</a></li>
            <li><a href="?id=editar-usuarios" id="editar-usuarios">Editar usuários</a></li>
            <li><a href="?id=lista-de-usuarios" id="lista-de-usuarios">Lista de usuários</a></li>
        </ul>
    <%end if %>
</nav>