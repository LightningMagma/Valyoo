/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author xJuanDa
 */
public class PersonaVO {

    private String perDocumento, perTipoDocumento, perNombre, perApellido, perCorreo, perTelefono, perDireccion, perClave, perSede, perEstado;

    public PersonaVO() {
    }

    public PersonaVO(String perDocumento, String perTipoDocumento, String perNombre, String perApellido, String perCorreo, String perTelefono, String perDireccion, String perClave, String perSede, String perEstado) {
        this.perDocumento = perDocumento;
        this.perTipoDocumento = perTipoDocumento;
        this.perNombre = perNombre;
        this.perApellido = perApellido;
        this.perCorreo = perCorreo;
        this.perTelefono = perTelefono;
        this.perDireccion = perDireccion;
        this.perClave = perClave;
        this.perSede = perSede;
        this.perEstado = perEstado;
    }

    public PersonaVO(String perCorreo, String perClave) {
        this.perCorreo = perCorreo;
        this.perClave = perClave;
    }

    public String getPerDocumento() {
        return perDocumento;
    }

    public void setPerDocumento(String perDocumento) {
        this.perDocumento = perDocumento;
    }

    public String getPerTipoDocumento() {
        return perTipoDocumento;
    }

    public void setPerTipoDocumento(String perTipoDocumento) {
        this.perTipoDocumento = perTipoDocumento;
    }

    public String getPerNombre() {
        return perNombre;
    }

    public void setPerNombre(String perNombre) {
        this.perNombre = perNombre;
    }

    public String getPerApellido() {
        return perApellido;
    }

    public void setPerApellido(String perApellido) {
        this.perApellido = perApellido;
    }

    public String getPerCorreo() {
        return perCorreo;
    }

    public void setPerCorreo(String perCorreo) {
        this.perCorreo = perCorreo;
    }

    public String getPerTelefono() {
        return perTelefono;
    }

    public void setPerTelefono(String perTelefono) {
        this.perTelefono = perTelefono;
    }

    public String getPerDireccion() {
        return perDireccion;
    }

    public void setPerDireccion(String perDireccion) {
        this.perDireccion = perDireccion;
    }

    public String getPerClave() {
        return perClave;
    }

    public void setPerUsuario(String perClave) {
        this.perClave = perClave;
    }

    public String getPerSede() {
        return perSede;
    }

    public void setPerSede(String perSede) {
        this.perSede = perSede;
    }

    public String getPerEstado() {
        return perEstado;
    }

    public void setPerEstado(String perEstado) {
        this.perEstado = perEstado;
    }

}
