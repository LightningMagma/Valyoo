/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.SolicitudVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author APRENDIZ
 */
public class SolicitudDAO extends ConexionDB implements crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String solId = "", solMonto = "", solCuotas = "", solInteres = "", solEstado = "";

    public SolicitudDAO() {
    }

    public SolicitudDAO(SolicitudVO solVO) {
        super();
        try {
            //3. Conectarse a la DB
            conexion = this.obtenerConexion();
            //4. Trare los datos del VO al DAO
            solId = solVO.getSolId();
            solMonto = solVO.getSolMonto();
            solCuotas = solVO.getSolCuotas();
            solInteres = solVO.getSolInteres();
            solEstado = solVO.getSolEstado();
        } catch (Exception e) {
            //Logger atrapa la trasavilidad como nivel severo
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "insert into tblsolicitud(solMonto,solCuotas,solInteres) values (?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, solMonto);
            puente.setString(2, solCuotas);
            puente.setString(3, solInteres);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update tblsolicitud set solMonto=?,solCuotas=?,solInteres=? where SolID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, solMonto);
            puente.setString(2, solCuotas);
            puente.setString(3, solInteres);
            puente.setString(4, solId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {

            sql = "update tblsolicitud set solEstado='Inactivo' where SolID=?;";
            puente = conexion.prepareStatement(sql);            
            puente.setString(1, solId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

}
