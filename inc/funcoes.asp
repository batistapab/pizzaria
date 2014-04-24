<%
Option Explicit 

dim conn

Function ValidEmail(ByVal emailAddress) 
'this function will use regular expressions to check an '
'email address for validity '
'instantiate regex object container, output boolean '
Dim objRegEx, retVal 
'using late binding, vbscript reference is not required '
Set objRegEx = CreateObject("VBScript.RegExp") 
'.pattern -looks for a valid email address '
With objRegEx 
      .Pattern = "^\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$" 
      .IgnoreCase = True 
End With 
retVal = objRegEx.Test(emailAddress) 
'get rid of RegEx object '
Set objRegEx = Nothing 
ValidEmail = retVal 
End Function

sub conecta
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.MapPath("db/pizzaria.mdb")& ";Jet OLEDB:Database Password=pizzaria;"
end sub

sub desconecta
    conn.Close
    Set conn = Nothing
end sub


 
%>

