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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author xJuanDa
 */
public class PersonaDAO extends ConexionDB implements crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String perDocumento="", perTipoDocumento="", perNombre="", perApellido="", perTelefono="", perDireccion="", perUsuario="", perSede="", perEstado="";

    public PersonaDAO() {}
    public PersonaDAO(PersonaVO perVO){
        super();
        try {
            conexion = this.obtenerConexion();
            perDocumento=perVO.getPerDocumento();
            perTipoDocumento=perVO.getPerTipoDocumento();
            perNombre=perVO.getPerNombre();
            perApellido=perVO.getPerApellido();
            perTelefono=perVO.getPerTelefono();
            perDireccion=perVO.getPerDireccion();
            perUsuario=perVO.getPerUsuario();
            perSede=perVO.getPerSede();
            perEstado=perVO.getPerEstado();
        } catch (Exception e) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblpersona (PERDOCUMENTO, PERTIPODOCUMENTO, PERNOMBRE, PERAPELLIDO, PERTELEFONO, PERDIRECCION, PERUSUARIO, PERSEDE) values (?,?,?,?,?,?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perDocumento);
            puente.setString(2, perTipoDocumento);
            puente.setString(3, perNombre);
            puente.setString(4, perApellido);
            puente.setString(5, perTelefono);
            puente.setString(6, perDireccion);
            puente.setString(7, perUsuario);
            puente.setString(8, perSede);
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
            sql = "update tblpersona set PERTIPODOCUMENTO=?, PERNOMBRE=?, PERAPELLIDO=?, PERTELEFONO=?, PERDIRECCION=?, PERUSUARIO=?, PERSEDE=?, PERESTADO=? where PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perTipoDocumento);
            puente.setString(2, perNombre);
            puente.setString(3, perApellido);
            puente.setString(4, perTelefono);
            puente.setString(5, perDireccion);
            puente.setString(6, perUsuario);
            puente.setString(7, perSede);
            puente.setString(8, perEstado);
            puente.setString(9, perDocumento);
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
            sql = "update tblpersona set PERESTADO='Inactivo' where PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, perDocumento);
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
    
    public PersonaVO consultarPorDocumento(String documento){
        PersonaVO perVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblpersona where PERDOCUMENTO=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                perVO = new PersonaVO(documento, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));
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
                PersonaVO perVO = new PersonaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));

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
}
