<%
nome=Request.Cookies("nome") 
email=Request.Cookies("email") 
perfil=Request.Cookies("perfil") 
idUsuario=Request.Cookies("idUsuario") 

If nome="" or email="" or (perfil<> "1" and perfil<> "2" and perfil<>"3") Then
    Response.Redirect("sair.asp")
    
End If
%>