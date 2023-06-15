/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PersonaVO;
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
public class PersonaDAO extends ConexionDB implements crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String perDocumento = "", perTipoDocumento = "", perNombre = "", perApellido = "", perCorreo = "", perTelefono = "", perDireccion = "", perClave = "", perSede = "", perEstado = "";

    public PersonaDAO() {
    }

    public PersonaDAO(PersonaVO perVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            perDocumento = perVO.getPerDocumento();
            perTipoDocumento = perVO.getPerTipoDocumento();
            perNombre = perVO.getPerNombre();
            perApellido = perVO.getPerApellido();
            perCorreo = perVO.getPerCorreo();
            perTelefono = perVO.getPerTelefono();
            perDireccion = perVO.getPerDireccion();
            perClave = perVO.getPerClave();
            perSede = perVO.getPerSede();
            perEstado = perVO.getPerEstado();
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }    

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblpersona (PERDOCUMENTO, PERTIPODOCUMENTO, PERNOMBRE, PERAPELLIDO, PERCORREO, PERTELEFONO, PERDIRECCION, PERCLAVE) values (?,?,?,?,?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perDocumento);
            puente.setString(2, perTipoDocumento);
            puente.setString(3, perNombre);
            puente.setString(4, perApellido);
            puente.setString(5, perCorreo);
            puente.setString(6, perTelefono);
            puente.setString(7, perDireccion);
            puente.setString(8, perClave);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblpersona set PERTIPODOCUMENTO=?, PERNOMBRE=?, PERAPELLIDO=?, PERCORREO=?, PERTELEFONO=?, PERDIRECCION=?, PERCLAVE=? where PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perTipoDocumento);
            puente.setString(2, perNombre);
            puente.setString(3, perApellido);
            puente.setString(4, perCorreo);
            puente.setString(5, perTelefono);
            puente.setString(6, perDireccion);
            puente.setString(7, perClave);
            puente.setString(8, perDocumento);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            String validacion = "select * from tblpersona where PERESTADO='Inactivo' and PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(validacion);
            puente.setString(1, perDocumento);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                sql = "update tblpersona set PERESTADO='Activo' where PERDOCUMENTO=?;";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, perDocumento);
                puente.executeUpdate();
                operacion = true;
            } else {
                sql = "update tblpersona set PERESTADO='Inactivo' where PERDOCUMENTO=?;";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, perDocumento);
                puente.executeUpdate();
                operacion = true;
            }
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public PersonaVO consultarPorDocumento(String documento) {
        PersonaVO perVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblpersona where PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                perVO = new PersonaVO(documento, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10));
            }
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return perVO;
    }

    public ArrayList<PersonaVO> listar() {
        ArrayList<PersonaVO> personaLista = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblpersona;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                PersonaVO perVO = new PersonaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10));

                personaLista.add(perVO);

            }

        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return personaLista;
    }

    public boolean iniciarSesion(String usuario, String clave) {
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblpersona where perDocumento=? and perClave=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perDocumento);
            puente.setString(2, perClave);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                operacion = true;
            }
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                // this.cerrarConexion();
            } catch (Exception ex) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return operacion;
    }

    public boolean actualizarContra() {
        try {
            sql = "update tblpersona set PERCLAVE=? where PERCORREO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perClave);
            puente.setString(2, perCorreo);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
}
