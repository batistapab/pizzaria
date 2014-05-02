<h2>Cadastrar usuário</h2>
<form class="cadastro" id="cadastrar-usuario" action="processos.asp" method="post">
    <div><label for="nome">Nome</label></div>
    <div><input type="text" name="nome" id="nome" maxlength="150" required /> </div>
    <div><label for="email">E-mail</label></div>
    <div><input type="email" name="email" id="email" maxlength="150" required /> </div>
    <div><label for="perfil">Perfil</label></div>
    <div>
        <select name="perfil" id="perfil" required>
            <option value=""></option>            
            <option value="1">Administrador</option>
            <option value="2">Funcionário</option>
            <option value="3">Cliente</option>
        </select>
    </div>
    <div><label for="status">Status</label></div>
    <div>
        <select name="status" id="status" required>
            <option value=""></option>            
            <option value="1">Ativo</option>
            <option value="2">Inativo</option>
            <option value="3">Bloqueado</option>
        </select>
    </div>
    <div><label for="senha">Senha</label></div>
    <div><input type="password" name="senha" id="senha" required /> </div>
    <div><label for="senha2">Repetir Senha</label></div>
    <div><input type="password" name="senha2" id="senha2" required /> </div>
    <div><label for="observacao">Observação</label></div>
    <div><textarea name="observacao" id="observacao" rows="5" cols="60"></textarea></div>
    <input type="submit" value="Salvar" />
    <input type="reset" value="Limpar" />
</form>

