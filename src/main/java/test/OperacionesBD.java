package test;

import beans.Servicios;
import connection.DBConnection;
import java.sql.ResultSet;
import java.sql.Statement;


public class OperacionesBD {
    public static void main(String[] args) {
        listarServicio();
        
    }
    
    public static void actualizarServicio(int id_servicio, String nombre_servicio){
        DBConnection con = new DBConnection();
        String sql = "UPDATE servicio SET nombre = '" + nombre_servicio + "'WHERE id = "+ id_servicio;
        try {
            Statement st = con.getConnection().createStatement();
            st.executeUpdate(sql);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.desconectar();
        }
    }
    
    public static void listarServicio(){
        DBConnection con = new DBConnection();
        String sql = "SELECT * FROM servicios";
        try {
            Statement st = con.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                int id_servicio = rs.getInt("id_servicio");
                String nombre_servicio = rs.getString("nombre_servicio");
                double costo  = rs.getDouble("costo");
                int cantidad_servicios = rs.getInt("cantidad_servicios");             
                Servicios servicios = new Servicios(id_servicio, nombre_servicio, costo, cantidad_servicios);
                System.out.println(servicios.toString());                      
            }
            
            st.executeQuery(sql);
        
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            con.desconectar();    
            
        }
    }
}
