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
public class PerRolVO {
    private String PRID,PRPersona,PRRol;

    public PerRolVO() {
    }

    public PerRolVO(String PRID, String PRPersona, String PRRol) {
        this.PRID = PRID;
        this.PRPersona = PRPersona;
        this.PRRol = PRRol;
    }

    public String getPRID() {
        return PRID;
    }

    public void setPRID(String PRID) {
        this.PRID = PRID;
    }

    public String getPRPersona() {
        return PRPersona;
    }

    public void setPRPersona(String PRPersona) {
        this.PRPersona = PRPersona;
    }

    public String getPRRol() {
        return PRRol;
    }

    public void setPRRol(String PRRol) {
        this.PRRol = PRRol;
    }

    
    
    
}
