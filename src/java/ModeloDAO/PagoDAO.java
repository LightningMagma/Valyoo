/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;
import ModeloVO.PagoVO;

/**
 *
 * @author APRENDIZ
 */
public class PagoDAO extends ConexionDB implements crud {

    private Connection puerta;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String PagId, PagDesc, PagValor, PagFecha, PagPres;

    public PagoDAO(PagoVO pagoVO) {
        super();
        try {
            puerta = this.obtenerConexion();
            PagId = pagoVO.getPagId();
            PagDesc = pagoVO.getPagDesc();
            PagValor = pagoVO.getPagValor();
            PagFecha = pagoVO.getPagFecha();
            PagPres = pagoVO.getPagPres();
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblpago(PagID, PagDesc, PreValor, PagFecha, PagPres) values (?,?,?,?,?);";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagId);
            puente.setString(2, PagDesc);
            puente.setString(3, PagValor);
            puente.setString(4, PagFecha);
            puente.setString(5, PagPres);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblpago set PagDesc=?, PreValor=?, PagFecha=?, PagPres=? where PagID =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagDesc);
            puente.setString(2, PagValor);
            puente.setString(3, PagFecha);
            puente.setString(4, PagPres);
            puente.setString(5, PagId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql="delete from tblpago where PagID =?";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        return operacion;
    }

}
