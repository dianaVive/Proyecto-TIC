package controller;

import java.sql.ResultSet;
import java.sql.Statement;
import beans.Usuario;
import com.google.gson.Gson;
import connection.DBConnection;

public class UsuarioController implements IUsuarioController {
    

    @Override
    public String login(String id_usuario, String contrasena_usuario) {

        Gson gson = new Gson();
        DBConnection con = new DBConnection();
        String sql = "SELECT * FROM usuario WHERE id_usuario ='" + id_usuario + "'and contrasena_usuario = '" + contrasena_usuario + "'";

        try {
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                
                String nombre_usuario = rs.getString("nombre_usuario");
                String apellidos_usuario = rs.getString("apellidos_usuario");
                String correo_usuario = rs.getString("correo_usuario");
                String telefono_usuario = rs.getString("telefono_usuario");
                Boolean premium = rs.getBoolean("premium");
                Usuario usuario = new Usuario(id_usuario, contrasena_usuario, nombre_usuario, apellidos_usuario, correo_usuario, telefono_usuario, premium);
                return gson.toJson(usuario);
            }
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        } finally {
            con.desconectar();
        }
        return "false";

    }

    @Override
    public String register(String id_usuario, String contrasena_usuario, String nombre_usuario, String apellidos_usuario, String correo_usuario, String telefono_usuario,
            boolean premium) {

        Gson gson = new Gson();

        DBConnection con = new DBConnection();
        String sql = "Insert into usuario values( '" + id_usuario + "', '" + contrasena_usuario + "', '" + nombre_usuario
                + "', '" + apellidos_usuario + "', '" + correo_usuario + "', " + premium + ")";

        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);

            Usuario usuario = new Usuario(id_usuario, contrasena_usuario, nombre_usuario, apellidos_usuario, correo_usuario, telefono_usuario, premium);

            st.close();

            return gson.toJson(usuario);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        } finally {
            con.desconectar();
        }

        return "false";

    }
}

