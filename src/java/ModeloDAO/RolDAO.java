/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.RolVO;
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
public class RolDAO extends ConexionDB implements crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String rolId = "", rolNombre = "", rolEstado = "";

    public RolDAO() {
    }

    public RolDAO(RolVO rolVO) {
        super();
        try {
            //3. Conectarse a la DB
            conexion = this.obtenerConexion();
            //4. Trare los datos del VO al DAO
            rolId = rolVO.getRolId();
            rolNombre = rolVO.getRolNombre();
            rolEstado = rolVO.getRolEstado();
        } catch (Exception e) {
            //Logger atrapa la trasavilidad como nivel severo
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "insert into tblrol(rolNombre) values (?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolNombre);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update tblrol set rolNombre=? where rolid=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolNombre);
            puente.setString(2, rolId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            String validacion = "select * from tblrol where rolEstado='Inactivo' and rolid=?;";
            puente = conexion.prepareStatement(validacion);
            puente.setString(1, rolId);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                sql = "update tblrol set rolEstado='Activo' where rolid=?;";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, rolId);
                puente.executeUpdate();
                operacion = true;
            } else {
                sql = "update tblrol set rolEstado='Inactivo' where rolid=?;";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, rolId);
                puente.executeUpdate();
                operacion = true;
            }
        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return operacion;
    }

    public RolVO consultarPorID(String id) {
        RolVO rolVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblrol where rolID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                rolVO = new RolVO(id, mensajero.getString(2), mensajero.getString(3));
            }
        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rolVO;
    }

    public ArrayList<RolVO> listarRol() {
        ArrayList<RolVO> listaRol = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblrol;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                RolVO rolVO = new RolVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
                listaRol.add(rolVO);
            }
        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listaRol;

    }

}
