<%
dim nome,email,perfil

nome=Request.Cookies("nome") 
email=Request.Cookies("email") 
perfil=Request.Cookies("perfil") 

If nome="" or email="" or (perfil<> "1" and perfil<> "2") Then
    Response.Redirect("sair.asp")
    
End If
%>