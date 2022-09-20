package beans;

import java.sql.Date;

public class Agenda {
    private int idServicio;
    private int idUsuario;
    private Date fechaAlquiler;

    public Agenda(int idServicio, int idUsuario, Date fechaAlquiler) {
        this.idServicio = idServicio;
        this.idUsuario = idUsuario;
        this.fechaAlquiler = fechaAlquiler;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Date getFechaAlquiler() {
        return fechaAlquiler;
    }

    public void setFechaAlquiler(Date fechaAlquiler) {
        this.fechaAlquiler = fechaAlquiler;
    }

    @Override
    public String toString() {
        return "Agenda{" + "idServicio=" + idServicio + ", idUsuario=" + idUsuario + ", fechaAlquiler=" + fechaAlquiler + '}';
    }
    
    
    
}