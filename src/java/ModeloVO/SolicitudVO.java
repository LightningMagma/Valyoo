/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author APRENDIZ
 */
public class SolicitudVO {

    public SolicitudVO(String solId, String solMonto, String solCuotas, String solInteres, String solEstado) {
        this.solId = solId;
        this.solMonto = solMonto;
        this.solCuotas = solCuotas;
        this.solInteres = solInteres;
        this.solEstado = solEstado;
    }

    public String getSolId() {
        return solId;
    }

    public void setSolId(String solId) {
        this.solId = solId;
    }

    public String getSolMonto() {
        return solMonto;
    }

    public void setSolMonto(String solMonto) {
        this.solMonto = solMonto;
    }

    public String getSolCuotas() {
        return solCuotas;
    }

    public void setSolCuotas(String solCuotas) {
        this.solCuotas = solCuotas;
    }

    public String getSolInteres() {
        return solInteres;
    }

    public void setSolInteres(String solInteres) {
        this.solInteres = solInteres;
    }

    public String getSolEstado() {
        return solEstado;
    }

    public void setSolEstado(String solEstado) {
        this.solEstado = solEstado;
    }
    private String solId,solMonto,solCuotas,solInteres,solEstado;

    public SolicitudVO() {
    }
}
