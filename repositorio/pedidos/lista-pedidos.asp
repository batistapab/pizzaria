<h2>Histórico de pedidos</h2>
<%
   if perfil = 3 then
      sql="SELECT ID, DATA_PEDIDO , METODO_DE_PAGAMENTO, VALOR, STATUS_DO_PAGAMENTO, STATUS_DO_PEDIDO FROM PEDIDOS WHERE IDUSUARIO="&idUsuario&" ORDER BY DATA_PEDIDO DESC "       
   else
      sql="SELECT ID, DATA_PEDIDO , METODO_DE_PAGAMENTO, VALOR, STATUS_DO_PAGAMENTO, STATUS_DO_PEDIDO FROM PEDIDOS ORDER BY DATA_PEDIDO DESC" 
   end if  
  Call conecta  
   Set rs=conn.Execute(sql) 
   if  rs.EOF then 
               Response.Write "Nenhum registro encontrado"
   else  
%>
<table class="tablepedidos">
    <tr>
        <th>Nº do pedido</th>
        <th>Data</th>
        <th>Método de pag.</th>
        <th>Valor</th>
        <th>Status dopag.</th>
        <th>Status do pedido</th>
    </tr>
    <%  Do While Not rs.Eof  %>
    <tr>
        <td><% =rs("ID") %></td>
        <td><% =rs("DATA_PEDIDO") %></td>
        <td><% =rs("METODO_DE_PAGAMENTO") %></td>
        <td><% =rs("VALOR") %></td>
        <td><% =rs("STATUS_DO_PAGAMENTO") %></td>
        <td><% =rs("STATUS_DO_PEDIDO") %></td>
    </tr>
     <% 	
       rs.movenext 'Passa pro próximo
       Loop 'Fim do Laço
	        rs.Close 
	        Set rs=Nothing
	  end if
 Call desconecta         
 %>
</table>