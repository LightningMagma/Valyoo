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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author APRENDIZ
 */
public class CuentaDAO extends ConexionDB implements crud {

    private Connection puerta;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String CuNumero, CuFechaRegistro, CuEstado, CuPersona;

    public CuentaDAO() {

    }

    public CuentaDAO(CuentaVO cuVO) {
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
            sql = "insert into tblcuentacredito(CuFechaRegistro, CuPersona) values (?,?);";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuFechaRegistro);
            puente.setString(2, CuPersona);
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
            sql = "update tblcuentacredito set CuFechaRegistro=?, CuPersona=? where CuNumero =?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuFechaRegistro);
            puente.setString(2, CuPersona);
            puente.setString(3, CuNumero);
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
            String validacion = "select * from tblcuentacredito where CuEstado='Inactivo' and CuNumero=?;";
            puente = puerta.prepareStatement(validacion);
            puente.setString(1, CuNumero);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                sql = "update tblcuentacredito set CuEstado='Activo' where CuNumero=?;";
                puente = puerta.prepareStatement(sql);
                puente.setString(1, CuNumero);
                puente.executeUpdate();
                operacion = true;
            } else {
                sql = "update tblcuentacredito set CuEstado='Inactivo' where CuNumero=?;";
                puente = puerta.prepareStatement(sql);
                puente.setString(1, CuNumero);
                puente.executeUpdate();
                operacion = true;
            }
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

    public CuentaVO consultarCuenta() {
        CuentaVO cuVO = null;

        try {
            puerta = this.obtenerConexion();
            sql = "select * from tblcuentacredito where CuNumero = ?;";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, CuNumero);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                cuVO = new CuentaVO(CuNumero, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return cuVO;
    }

    public ArrayList<CuentaVO> listarCuenta() {
        ArrayList<CuentaVO> cuentaLista = new ArrayList<>();
        try {
            puerta = this.obtenerConexion();
            sql = "select * from listarCuentasView;";
            puente = puerta.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                CuentaVO cuVO = new CuentaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
                cuentaLista.add(cuVO);
            }
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return cuentaLista;
    }

    public CuentaVO listarCuPer(String cuPersona) {
        CuentaVO cuVO = null;
        try {
            puerta = this.obtenerConexion();
            sql = "select * from tblcuentacredito where CuPersona = ?";
            puente = puerta.prepareStatement(sql);
            puente.setString(1, cuPersona);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                cuVO = new CuentaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return cuVO;
    }

    public ArrayList<CuentaVO> listarCuentasActivas() {
        ArrayList<CuentaVO> cuentaLista = new ArrayList<>();
        try {
            puerta = this.obtenerConexion();
            sql = "select * from cuentasactivasview;";
            puente = puerta.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                CuentaVO cuVO = new CuentaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
                cuentaLista.add(cuVO);
            }
        } catch (Exception e) {
            Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CuentaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return cuentaLista;
    }
}
