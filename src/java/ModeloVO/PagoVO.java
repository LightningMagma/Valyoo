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
public class PagoVO {

    public PagoVO() {

    }

    public PagoVO(String PagId, String PagDesc, String PagValor, String PagFecha, String PagPres) {
        this.PagId = PagId;
        this.PagDesc = PagDesc;
        this.PagValor = PagValor;
        this.PagFecha = PagFecha;
        this.PagPres = PagPres;
    }

    public String getPagId() {
        return PagId;
    }

    public void setPagId(String PagId) {
        this.PagId = PagId;
    }

    public String getPagDesc() {
        return PagDesc;
    }

    public void setPagDesc(String PagDesc) {
        this.PagDesc = PagDesc;
    }

    public String getPagValor() {
        return PagValor;
    }

    public void setPagValor(String PagValor) {
        this.PagValor = PagValor;
    }

    public String getPagFecha() {
        return PagFecha;
    }

    public void setPagFecha(String PagFecha) {
        this.PagFecha = PagFecha;
    }

    public String getPagPres() {
        return PagPres;
    }

    public void setPagPres(String PagPres) {
        this.PagPres = PagPres;
    }
    private String PagId, PagDesc, PagValor, PagFecha, PagPres;
}
