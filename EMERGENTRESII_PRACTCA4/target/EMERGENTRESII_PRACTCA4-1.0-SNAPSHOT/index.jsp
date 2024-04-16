<%@page import="com.emergentes.estudiante"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listaper") == null) {
        ArrayList<estudiante> lista = new ArrayList<>();
        session.setAttribute("listaper", lista);
    }
    ArrayList<estudiante> lista = (ArrayList<estudiante>) session.getAttribute("listaper");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Inscritos</title>
    </head>
    <body>
        <style>
            h1{
                font-size:50px;
            }
        </style>
    <center>
        <h1>Lista de Inscritos</h1>
    </center>
    <form action="MainServelt" method="get">
        <input type="hidden" name="op" value="nuevo">
        <button type="submit">Nuevo</button>
    </form>
    <br>
    <table border="1" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                if (lista != null) {
                    for (estudiante item : lista) {
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getFecha()%></td>
                <td><%=item.getNombres()%></td>
                <td><%=item.getApellidos()%></td> 
                <td><%=item.getTurno()%></td>
                <td><%=item.getSeminarios()%></td>
                <td><a href="MainServelt?op=editar&id=<%= item.getId()%>">Editar</a></td>
                <td><a href="MainServelt?op=eliminar&id=<%= item.getId()%>" onclick="return confirm('¿Está seguro de eliminar?')">Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>