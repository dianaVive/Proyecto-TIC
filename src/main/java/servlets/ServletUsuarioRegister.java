package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.UsuarioController;

/**
 * Servlet implementation class ServletUsuarioRegister
 */
@WebServlet("/ServletUsuarioRegister")
public class ServletUsuarioRegister extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUsuarioRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsuarioController usuario = new UsuarioController();

        String id_usuario = request.getParameter("id_usuario");
        String contrasena_usuario = request.getParameter("contrasena_usuario");
        String nombre_usuario = request.getParameter("nombre_usuario");
        String apellidos_usuario = request.getParameter("apellidos_usuario");
        String correo_usuario = request.getParameter("correo_usuario");
        String telefono_usuario = request.getParameter("telefono_usuario");
        boolean premium = Boolean.parseBoolean(request.getParameter("premium"));

        String result = usuario.register(id_usuario, contrasena_usuario, nombre_usuario, apellidos_usuario, correo_usuario, telefono_usuario, premium);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
