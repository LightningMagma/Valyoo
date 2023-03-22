/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PrestamosVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author APRENDIZ
 */
public class PrestamosDAO extends ConexionDB implements crud {

    private Connection puerta;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String PreId, PreFechaInicio, PreFechaFin,
            PreCuotas, PreMonto, PreInteres, PreCuenta, PreEstado;

    public PrestamosDAO() {

    }

    public PrestamosDAO(PrestamosVO presVO) {
        super();
        try {
            puerta = this.obtenerConexion();
            PreId = presVO.getPreId();
            PreFechaInicio = presVO.getPreFechaInicio();
            PreFechaFin = presVO.getPreFechaFin();
            PreCuotas = presVO.getPreCuotas();
            PreMonto = presVO.getPreMonto();
            PreInteres = presVO.getPreInteres();
            PreCuenta = presVO.getPreCuenta();
            PreEstado = presVO.getPreEstado();
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblprestamo(PreFechaInicio, PreFechaFin, PreCuotas, PreMonto, PreInteres, PreCuenta) values (?,?,?,?,?,?);";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PreFechaInicio);
            puente.setString(2, PreFechaFin);
            puente.setString(3, PreCuotas);
            puente.setString(4, PreMonto);
            puente.setString(5, PreInteres);
            puente.setString(6, PreCuenta);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblprestamo set PreFechaInicio=?, PreFechaFin=?, PreCuotas=?, PreMonto=?, PreInteres=?, PreCuenta=? where PreID =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PreFechaInicio);
            puente.setString(2, PreFechaFin);
            puente.setString(3, PreCuotas);
            puente.setString(4, PreMonto);
            puente.setString(5, PreInteres);
            puente.setString(6, PreCuenta);
            puente.setString(7, PreId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "delete from tblprestamo where PreID =?";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PreId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public PrestamosVO consultarPrestamos() {
        PrestamosVO presVO = null;

        try {
            puerta = this.obtenerConexion();
            sql = "select * from tblprestamo where PreID = ?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, PreId);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                presVO = new PrestamosVO(PreId, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5),
                        mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));
            }
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return presVO;
    }

    public ArrayList<PrestamosVO> listarPrestamos() {
        ArrayList<PrestamosVO> prestamoLista = new ArrayList<>();
        try {
            puerta = this.obtenerConexion();
            sql = "Select * from tblprestamo";
            puente = puerta.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                PrestamosVO presVO = new PrestamosVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),
                        mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));
                prestamoLista.add(presVO);
            }
        } catch (Exception e) {
            Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PrestamosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return prestamoLista;
    }
}
