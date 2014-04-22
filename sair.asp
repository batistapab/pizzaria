<%
Response.Cookies("nome")=" "
Response.Cookies("email")=" "
Response.Cookies("perfil")=" "

Response.Cookies("nome").Expires = #January 1,2009#
Response.Cookies("email").Expires = #January 1,2009#
Response.Cookies("perfil").Expires = #January 1,2009#

 Response.Redirect("index.asp") 
%>
