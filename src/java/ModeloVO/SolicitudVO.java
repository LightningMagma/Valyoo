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
    private String solId,solMonto,solCuotas,solEstado,SolPersona;
    
    public SolicitudVO() {
    }
    
    public SolicitudVO(String solId, String solMonto, String solCuotas, String solEstado, String SolPersona) {
        this.solId = solId;
        this.solMonto = solMonto;
        this.solCuotas = solCuotas;       
        this.solEstado = solEstado;
        this.SolPersona = SolPersona;
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

    public String getSolEstado() {
        return solEstado;
    }

    public void setSolEstado(String solEstado) {
        this.solEstado = solEstado;
    }

    public String getSolPersona() {
        return SolPersona;
    }
    public void setSolPersona(String SolPersona) {
        this.SolPersona = SolPersona;
    }
}
