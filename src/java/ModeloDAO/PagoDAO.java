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
import java.sql.SQLException;
import java.util.ArrayList;

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

    public PagoDAO() {

    }

    public PagoDAO(PagoVO pagoVO) {
        super();
        try {
            puerta = this.obtenerConexion();
            PagId = pagoVO.getPagId();
            PagDesc = pagoVO.getPagDesc();
            PagValor = pagoVO.getPagValor();
            PagPres = pagoVO.getPagPres();
            PagFecha = pagoVO.getPagFecha();
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            String validacion = "select * from tblprestamo where PreMonto <= 0 and PreID = ?;";
            puente = puerta.prepareStatement(validacion);
            puente.setString(1, PagPres);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                operacion = false;
            } else if (validarMonto(PagPres, PagValor) == true) {
                operacion = false;
            } else {
                sql = "insert into tblpago(PagDescripcion, PagValor, PagPrestamo, PagFecha) values (?,?,?,current_timestamp());";
                puente = puerta.prepareStatement(sql);
                puente.setString(1, PagDesc);
                puente.setString(2, PagValor);
                puente.setString(3, PagPres);
                puente.executeUpdate();

                sql = "update tblprestamo set PreMonto = PreMonto - ? where PreID =?;";
                puente = puerta.prepareStatement(sql);
                puente.setString(1, PagValor);
                puente.setString(2, PagPres);
                puente.executeUpdate();
                operacion = true;
            }            
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
            sql = "update tblpago set PagDescripcion=?, PagValor=?, PagPrestamo=? where PagoID =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagDesc);
            puente.setString(2, PagValor);
            puente.setString(3, PagPres);
            puente.setString(4, PagId);
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
            sql = "delete from tblpago where PagoID =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagId);
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

    public PagoVO consultarPago() {
        PagoVO pagVO = null;

        try {
            puerta = this.obtenerConexion();
            sql = "select * from tblpago where PagoID = ?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PagId);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                pagVO = new PagoVO(PagId, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
            }
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return pagVO;
    }

    public ArrayList<PagoVO> listarPago() {
        ArrayList<PagoVO> pagoLista = new ArrayList<>();
        try {
            puerta = this.obtenerConexion();
            sql = "select * from listarPagosView;";
            puente = puerta.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                PagoVO pagVO = new PagoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                pagoLista.add(pagVO);
            }
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return pagoLista;
    }

    public PagoVO listarPagoPer(String pagPrestamo) {
        PagoVO pagVO = null;
        try {
            puerta = this.obtenerConexion();
            sql = "select * from tblpago where PagPrestamo = ?";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, pagPrestamo);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                pagVO = new PagoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
            }
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return pagVO;
    }

    public boolean validarMonto(String PreID, String PagValor) {
        double pagoValor = Double.parseDouble(PagValor);
        try {
            sql = "select * from tblprestamo where PreID = ?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PreID);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                double montoPrestamo = mensajero.getDouble("PreMonto");
                return montoPrestamo < pagoValor;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
