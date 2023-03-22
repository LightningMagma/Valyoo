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
public class CuentaVO {

    public CuentaVO() {

    }

    public CuentaVO(String CuNumero, String CuFechaRegistro, String CuEstado, String CuPersona) {
        this.CuNumero = CuNumero;
        this.CuFechaRegistro = CuFechaRegistro;
        this.CuEstado = CuEstado;
        this.CuPersona = CuPersona;
    }

    public String getCuNumero() {
        return CuNumero;
    }

    public void setCuNumero(String CuNumero) {
        this.CuNumero = CuNumero;
    }

    public String getCuFechaRegistro() {
        return CuFechaRegistro;
    }

    public void setCuFechaRegistro(String CuFechaRegistro) {
        this.CuFechaRegistro = CuFechaRegistro;
    }

    public String getCuEstado() {
        return CuEstado;
    }

    public void setCuEstado(String CuEstado) {
        this.CuEstado = CuEstado;
    }

    public String getCuPersona() {
        return CuPersona;
    }

    public void setCuPersona(String CuPersona) {
        this.CuPersona = CuPersona;
    }

    private String CuNumero, CuFechaRegistro, CuEstado, CuPersona;

}
