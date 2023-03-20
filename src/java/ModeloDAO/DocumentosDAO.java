/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.DocumentosVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;

/**
 *
 * @author ACER
 */
public class DocumentosDAO extends ConexionDB implements crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String docId="",docNombre="",docUrl="",docPer="";

    public DocumentosDAO() {
    }
    public DocumentosDAO(DocumentosVO docVO){
        super();
        try {
            conexion = this.obtenerConexion();
            docId=docVO.getDocId();
            docNombre=docVO.getDocNombre();
            docUrl=docVO.getDocUrl();
            docPer=docVO.getDocPer();
        } catch (Exception e) {
            Logger.getLogger(SedeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tbldocumentos values (?,?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, docId);
            puente.setString(2, docNombre);
            puente.setString(3, docUrl);
            puente.setString(4, docPer);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tbldocumentos set DOCNOMBRE=?,DOCURL=?,DOCPER=? WHERE DOCID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, docNombre);
            puente.setString(2, docUrl);
            puente.setString(3, docPer);
            puente.setString(4, docId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "update tbldocumentos set DOCESTADO='Inactivo' WHERE DOCID=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, docId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
}
