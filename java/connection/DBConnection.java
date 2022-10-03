package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    Connection connection;
    static String bd = "railway";
    static String port = "7536";
    static String login = "root";
    static String password = "FWXXIwpyLej4lYQoPmlN";
    static String ip = "containers-us-west-79.railway.app";	

    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://"+ DBConnection.ip + ":" + DBConnection.port + "/" + DBConnection.bd;
            connection = DriverManager.getConnection(url, this.login, this.password);
            System.out.println("Conexión Establecida");
        } catch (Exception ex) {
            System.out.println("Error en la conexión");
        }
    }
    
    public Connection getConnection(){
        return connection;
    }
    
    public void desconectar(){
        connection = null;
    }    
}