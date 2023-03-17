/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.CuentaVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author APRENDIZ
 */
public class CuentaDAO extends ConexionDB implements crud{
    private Connection puerta;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String CuNumero, CuFechaRegistro, CuEstado, CuPersona;
    
    public CuentaDAO(CuentaVO cuVO){
        super();
        try {
            puerta = this.obtenerConexion();
            CuNumero = cuVO.getCuNumero();
            CuFechaRegistro = cuVO.getCuFechaRegistro();
            CuEstado = cuVO.getCuEstado();
            CuPersona = cuVO.getCuPersona();
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblcuenta(CuNumero, CuFechaRegistro, CuEstado, CuPersona) values (?,?,?,?);";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuNumero);
            puente.setString(2, CuFechaRegistro);
            puente.setString(3, CuEstado);
            puente.setString(4, CuPersona);           
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblcuenta set CuFechaRegistro=?, CuEstado=?, CuPersona=? where CuNumero =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuFechaRegistro);
            puente.setString(2, CuEstado);
            puente.setString(3, CuPersona); 
            puente.setString(4, CuNumero);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql="delete from tblcuenta where CuNumero =?";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuNumero);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        return operacion;
    }
}
