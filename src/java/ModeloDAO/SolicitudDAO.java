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
import java.util.ArrayList;
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
    private String solId = "", solMonto = "", solCuotas = "", solEstado = "", solPersona = "";

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
            solEstado = solVO.getSolEstado();
            solPersona = solVO.getSolPersona();
        } catch (Exception e) {
            //Logger atrapa la trasavilidad como nivel severo
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "insert into tblsolicitud(solMonto,solCuotas,solPersona) values (?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, solMonto);
            puente.setString(2, solCuotas);
            puente.setString(3, solPersona);
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

            sql = "update tblsolicitud set solMonto=?,solCuotas=?,solPersona=? where SolID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, solMonto);
            puente.setString(2, solCuotas);
            puente.setString(3, solPersona);
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

    public SolicitudVO consultarPorID(String id) {
        SolicitudVO solVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblsolicitud where solID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                solVO = new SolicitudVO(id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
            }
        } catch (Exception e) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return solVO;
    }

    public ArrayList<SolicitudVO> listarUsuarios() {
        ArrayList<SolicitudVO> listaSolicitud = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from listarSolicitudesView;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                SolicitudVO solVO = new SolicitudVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listaSolicitud.add(solVO);
            }
        } catch (Exception e) {
            Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(SolicitudDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listaSolicitud;
    }
}
