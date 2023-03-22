/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.SedeVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author ACER
 */
public class SedeDAO extends ConexionDB implements crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String sedeId="",sedeDireccion="",sedeTelefono="",sedeEstado="";

    public SedeDAO() {
    }
    
    public SedeDAO(SedeVO sedeVO){
        super();
        try {
            conexion = this.obtenerConexion();
            sedeId=sedeVO.getSedeId();
            sedeDireccion=sedeVO.getSedeDireccion();
            sedeTelefono=sedeVO.getSedeTelefono();
            sedeEstado=sedeVO.getSedeEstado();
        } catch (Exception e) {
            Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblsede (SEDEDIRECCION,SEDETELEFONO) values (?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, sedeDireccion);
            puente.setString(2, sedeTelefono);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblsede set SEDEDIRECCION=?,SEDETELEFONO=?,SEDEESTADO=? WHERE SEDEID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, sedeDireccion);
            puente.setString(2, sedeTelefono);
            puente.setString(3, sedeEstado);
            puente.setString(4, sedeId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "update tblsede set SEDEESTADO='Inactivo' WHERE SEDEID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, sedeId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
}