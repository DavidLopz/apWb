<%-- 
    Document   : proy
    Created on : 26/05/2017, 09:15:48 AM
    Author     : Alumnos
--%>

<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %> <%-- para conectar con mysql --%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        
        // crear e inicializar variables
        String correo, pass; // para ingresar
        int op = 0; // para seleccionar ingreso o registro

        //variables para la base de datos
        final String jdbcdriver = "com.mysql.jdbc.Driver";
        final String dburl = "jdbc:mysql:sql106.byethost14.com/b14_20094757_parcial3";
        // credenciales de la base de datos
        final String user = "b14_20094757";
        final String passql = "";
        Connection con;
        Class.forName(jdbcdriver);

        con = DriverManager.getConnection(dburl, user, passql);

        Statement stmt = con.createStatement();
        String sql;
        ResultSet rs;
        
        //variables para obtener y mostrar los registros de la base
        String mail, contra, nombre, ape, usu;
        
        // proceso
        response.setContentType("text/html");
        
        correo = request.getParameter("correo");
        pass = request.getParameter("pass");
        
        //ver si va a entrar a la pagina o registrarse como nuevo
        if (correo.length()>0 && pass.length()>0  ){
            op = 1;
            //out.println("<a href=\"registro\" >Registrar</a>");
            //out.print(correo + pass);
        }
        else if(request.getParameter("entrar") != null)
        {
            
                out.println("<html lang=\"es\"> <head> <title>Login</title>"
                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                        + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");
                        
                    out.print("<div class=\"contenedor\">");
                        out.println("<center>");
                        out.println("<div class=\"caja\">");
                            out.println("Error de usuario o contraseña o no esta registrado");
                                out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                    out.println("<input type=\"text\" placeholder=\"Correo\" name=\"correo\"/><br><br>");
                                    out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\"/><br><br>");
                                    out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                out.println("</form>");
                                
                                out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");
                                
                        out.println("</div>");
                        out.println("</center>");
                    out.println("</div>");
            
        }
        if (request.getParameter("registrar") != null) {
            op = 2;
            //out.println("si lo hace<br>");
        }
        else
        {
            
        }
        
            
        switch(op){
            case 1:
                try{
                    sql = "select * from registro where registro.correo=\'" + correo + "\' and registro.pass=\'" + pass + "\'";
                    //ResultSet rs = stmt.executeQuery(sql);
                    rs = stmt.executeQuery(sql);
                    
                    if (rs.next()) {
                        response.sendRedirect("text.html");
                    }
                    else
                    {
                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                        + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");
                        
                    out.print("<div class=\"contenedor\">");
                        out.println("<center>");
                        out.println("<div class=\"caja\">");
                            out.println("<script onclick=\"index.html\">alert(\"CORREO O CONTRASEÑA INCORRECTA\");</script>");
                            out.println("<BR><BR>VUELVA A INTENTARLO NUEVAMENTE<BR><BR>");
                                out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                    out.println("<input type=\"text\" placeholder=\"Correo\" name=\"correo\"/><br><br>");
                                    out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\"/><br><br>");
                                    out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                out.println("</form>");
                                
                                out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");
                                
                        out.println("</div>");
                        out.println("</center>");
                    out.println("</div>");
//  response.sendRedirect("index.html");
                    }
                    // limpiar y cerrar la conexion
                    rs.close();
                }
                catch(Exception e)
                {
                    out.println(""+ e);
                }
                break;
            case 2:
                // uso de funciones y de css en jsp
                try
                {
                    String var="";
                    //out.println("Usted esta tratando de registrar a");
                    //correo	pass	nombre	apellido	tipo
                    mail = request.getParameter("correo");
                    contra = request.getParameter("pass");
                    nombre = request.getParameter("nombre");
                    ape = request.getParameter("apellido");
                    usu = request.getParameter("tipU");
                    
                    if (mail.length() >0 && contra.length() >0 && nombre.length() >0 && ape.length() >0 && usu.length() >0) 
                    {
                        var = mail + "','" + contra + "\',\'" + nombre + "\',\'" + ape + "\',\'" + usu;
                        //out.println(var);
                        sql = "insert into registro(correo,pass,nombre,apellido,tipo) values(\'" + var +"\')";
                        //out.println(mail + " " + contra + " " + nombre + " " + ape + " " + usu + " se agrego");
                        stmt.executeUpdate(sql);

                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                            + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");

                        out.print("<div class=\"contenedor\">");
                            out.println("<center>");
                            out.println("<div class=\"caja\">");
                                out.println("Usuario registrado");
                                    out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                        out.println("<input type=\"text\" placeholder=\"Correo\" name=\"correo\"/><br><br>");
                                        out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\"/><br><br>");
                                        out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                    out.println("</form>");

                                    out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");

                            out.println("</div>");
                            out.println("</center>");
                        out.println("</div>");
                    }
                    else // fallo el registro
                    {
                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                            + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");

                        out.print("<div class=\"contenedor\">");
                            out.println("<center>");
                            out.println("<div class=\"caja\">");
                                out.println("Error de usuario, contraseña o faltan datos");
                                    out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                        out.println("<input type=\"text\" placeholder=\"Correo\" name=\"correo\"/><br><br>");
                                        out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\"/><br><br>");
                                        out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                    out.println("</form>");

                                    out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");

                            out.println("</div>");
                            out.println("</center>");
                        out.println("</div>");
                        
                    }
                    //rs.close();
                    break;
                }
                catch(Exception e)
                {
                    
                    
                    /*out.println("<html lang=\"es\"> <head> <title>Login</title>"
                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                        + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");*/
                        
                    out.print("<div class=\"contenedor\">");
                    out.println("<center>");
                        out.println("<script onclick=\"index.html\">alert(\"El usuario esta registrado\");</script>");
                            //out.println("El usuario esta registrado");
                        out.println("</center>");
                    out.println("</div>");
                }
                break;                         
        }
    %>
        
    </body>
</html>
