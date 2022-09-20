package controller;

import java.util.Map;

public interface IUsuarioController {

    public String login(String id_usuario, String contrasena_usuario);

    public String register(String id_usuario, String contrasena_usuario,
            String nombre_usuario, String apellidos_usuario, String correo_usuario, String telefono_usuario, boolean premium);

}
