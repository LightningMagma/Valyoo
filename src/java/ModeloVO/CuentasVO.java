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
public class CuentasVO {

    public CuentasVO(String CuNumero, String CuFechaRegistro, String CuEstado, String CuSede, String CuDeudor) {
        this.CuNumero = CuNumero;
        this.CuFechaRegistro = CuFechaRegistro;
        this.CuEstado = CuEstado;
        this.CuSede = CuSede;
        this.CuDeudor = CuDeudor;
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

    public String getCuSede() {
        return CuSede;
    }

    public void setCuSede(String CuSede) {
        this.CuSede = CuSede;
    }

    public String getCuDeudor() {
        return CuDeudor;
    }

    public void setCuDeudor(String CuDeudor) {
        this.CuDeudor = CuDeudor;
    }
    private String CuNumero, CuFechaRegistro, CuEstado, CuSede, CuDeudor;
}
