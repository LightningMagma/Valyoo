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
public class PrestamosVO {

    public PrestamosVO() {
    }

    public PrestamosVO(String PreId, String PreFechaInicio, String PreFechaFin, String PreCuotas, String PreMonto, String PreInteres,String PreCuenta, String PreEstado) {
        this.PreId = PreId;
        this.PreFechaInicio = PreFechaInicio;
        this.PreFechaFin = PreFechaFin;
        this.PreCuotas = PreCuotas;
        this.PreMonto = PreMonto;
        this.PreInteres = PreInteres;
        this.PreCuenta = PreCuenta;
        this.PreEstado = PreEstado;
    }

    public String getPreId() {
        return PreId;
    }

    public void setPreId(String PreId) {
        this.PreId = PreId;
    }

    public String getPreFechaInicio() {
        return PreFechaInicio;
    }

    public void setPreFechaInicio(String PreFechaInicio) {
        this.PreFechaInicio = PreFechaInicio;
    }

    public String getPreFechaFin() {
        return PreFechaFin;
    }

    public void setPreFechaFin(String PreFechaFin) {
        this.PreFechaFin = PreFechaFin;
    }

    public String getPreCuotas() {
        return PreCuotas;
    }

    public void setPreCuotas(String PreCuotas) {
        this.PreCuotas = PreCuotas;
    }

    public String getPreMonto() {
        return PreMonto;
    }

    public void setPreMonto(String PreMonto) {
        this.PreMonto = PreMonto;
    }

    public String getPreInteres() {
        return PreInteres;
    }

    public void setPreInteres(String PreInteres) {
        this.PreInteres = PreInteres;
    }

    public String getPreEstado() {
        return PreEstado;
    }

    public void setPreEstado(String PreEstado) {
        this.PreEstado = PreEstado;
    }

    public String getPreCuenta() {
        return PreCuenta;
    }

    public void setPreCuenta(String PreCuenta) {
        this.PreCuenta = PreCuenta;
    }

    private String PreId, PreFechaInicio, PreFechaFin,
            PreCuotas, PreMonto, PreInteres, PreEstado, PreCuenta;
}
