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
public class UsuarioVO {

    public UsuarioVO() {
    }

    public UsuarioVO(String usuUsuario, String usuContrasena, String usuEstado) {
        this.usuUsuario = usuUsuario;
        this.usuContrasena = usuContrasena;
        this.usuEstado = usuEstado;
    }

    public String getUsuUsuario() {
        return usuUsuario;
    }

    public void setUsuUsuario(String usuUsuario) {
        this.usuUsuario = usuUsuario;
    }

    public String getUsuContrasena() {
        return usuContrasena;
    }

    public void setUsuContrasena(String usuContrasena) {
        this.usuContrasena = usuContrasena;
    }

    public String getUsuEstado() {
        return usuEstado;
    }

    public void setUsuEstado(String usuEstado) {
        this.usuEstado = usuEstado;
    }
    private String usuUsuario,usuContrasena,usuEstado;
    
}
