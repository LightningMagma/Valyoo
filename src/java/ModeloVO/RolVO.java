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
public class RolVO {
    private String rolId,rolNombre,rolEstado;

    public String getRolId() {
        return rolId;
    }

    public void setRolId(String rolId) {
        this.rolId = rolId;
    }

    public String getRolNombre() {
        return rolNombre;
    }

    public void setRolNombre(String rolNombre) {
        this.rolNombre = rolNombre;
    }

    public String getRolEstado() {
        return rolEstado;
    }

    public void setRolEstado(String rolEstado) {
        this.rolEstado = rolEstado;
    }

    public RolVO(String rolId, String rolNombre, String rolEstado) {
        this.rolId = rolId;
        this.rolNombre = rolNombre;
        this.rolEstado = rolEstado;
    }
    
}
