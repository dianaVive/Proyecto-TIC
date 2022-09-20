package beans;
public class Servicios {
    private int id_servicio;
    private String nombre_servicio;
    private double costo;
    private int cantidad_servicios;

    public Servicios(int id_servicio, String nombre_servicio, double costo, int cantidad_servicios) {
        this.id_servicio = id_servicio;
        this.nombre_servicio = nombre_servicio;
        this.costo = costo;
        this.cantidad_servicios = cantidad_servicios;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getNombre_servicio() {
        return nombre_servicio;
    }

    public void setNombre_servicio(String nombre_servicio) {
        this.nombre_servicio = nombre_servicio;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getCantidad_servicios() {
        return cantidad_servicios;
    }

    public void setCantidad_servicios(int cantidad_servicios) {
        this.cantidad_servicios = cantidad_servicios;
    }

    @Override
    public String toString() {
        return "Servicios{" + "id_servicio=" + id_servicio + ", nombre_servicio=" + nombre_servicio + ", costo=" + costo + ", cantidad_servicios=" + cantidad_servicios + '}';
    }

    
}