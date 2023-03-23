/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PerRolVO;
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
 * @author xJuanDa
 */
public class PerRolDAO extends ConexionDB implements crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String PRID = "", PRPersona = "", PRRol = "";

    public PerRolDAO() {
    }

    public PerRolDAO(PerRolVO prVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            PRID = prVO.getPRID();
            PRPersona = prVO.getPRPersona();
            PRRol = prVO.getPRRol();
        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into personarol(PRPersona,PRRol) values (?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, PRPersona);
            puente.setString(2, PRRol);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update personarol set PRPersona=?, PRRol=? where PRID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, PRPersona);
            puente.setString(2, PRRol);
            puente.setString(3, PRID);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "delete from personarol where PRID=?;";
            puente = conexion.prepareStatement(sql);            
            puente.setString(1, PRID);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
    public PerRolVO consultarPorID(String documento) {
        PerRolVO prVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from personarol where PRID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                prVO = new PerRolVO(documento, mensajero.getString(2), mensajero.getString(3));
            }
        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return prVO;
    }

    public ArrayList<PerRolVO> listar() {
        ArrayList<PerRolVO> personarolLista = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from personarol;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                PerRolVO prVO = new PerRolVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));

                personarolLista.add(prVO);

            }

        } catch (Exception e) {
            Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PerRolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return personarolLista;
    }

}
