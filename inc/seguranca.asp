<%
nome=Request.Cookies("nome") 
email=Request.Cookies("email") 
perfil=Request.Cookies("perfil") 

if nome="" or email="" or (perfil<> 1 and perfil<> 2) then
    Response.Redirect("sair.asp")
end if
%>