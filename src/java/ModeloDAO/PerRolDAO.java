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
import java.sql.SQLException;
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
            sql = "SELECT\n"
                    + "     personarol.`PRID` AS personarol_PRID,\n"
                    + "     concat(PerNombre,' ',PerApellido) AS nombreUsuario,\n"
                    + "     tblrol.`rolNombre` AS nombreRol\n"
                    + "FROM\n"
                    + "     `tblpersona` tblpersona INNER JOIN `personarol` personarol ON tblpersona.`PerDocumento` = personarol.`PRPersona`\n"
                    + "     INNER JOIN `tblrol` tblrol ON personarol.`PRRol` = tblrol.`rolID`";
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

    public ArrayList<PerRolVO> listarPerRol(String idPersona) {
        ArrayList<PerRolVO> listaPerRol = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from personarol where PRPersona=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idPersona);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                PerRolVO prVO = new PerRolVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
                listaPerRol.add(prVO);
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
        return listaPerRol;

    }

}
