/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.DocumentosVO;
import java.io.File;
import java.io.FileInputStream;
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
 * @author Miguel Gil
 */
public class DocumentosDAO extends ConexionDB implements crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String docId = "", docNombre = "", docUrl = "", docPer = "";
    FileInputStream input = null;

    public DocumentosDAO() {
    }

    public DocumentosDAO(DocumentosVO docVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            docId = docVO.getDocId();
            docNombre = docVO.getDocNombre();
            docUrl = docVO.getDocUrl();
            docPer = docVO.getDocPer();
        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tbldocumento (DOCNOMBRE, DOCURL, DOCPERSONA) values (?,?,?);";
            puente = conexion.prepareStatement(sql);
            //input = new FileInputStream(new File(docUrl));
            puente.setString(1, docNombre);
            //puente.setBinaryStream(2, input);
            puente.setString(2, docUrl);
            puente.setString(3, docPer);
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
            sql = "update tbldocumento set DOCNOMBRE=?,DOCURL=?,DOCPERSONA=? WHERE DOCID=?";
            puente = conexion.prepareStatement(sql);
            input = new FileInputStream(new File(docUrl));
            puente.setString(1, docNombre);
            //puente.setBinaryStream(2, input);
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
            sql = "delete from tbldocumento WHERE DOCID=?";
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

    public DocumentosVO consultarPorId(String Id) {
        DocumentosVO docVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from tbldocumento where DOCID=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                docVO = new DocumentosVO(Id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return docVO;
    }

    public ArrayList<DocumentosVO> listar() {
        ArrayList<DocumentosVO> docuLista = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from listarDocumentosView;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {
                DocumentosVO docVO = new DocumentosVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));

                docuLista.add(docVO);

            }

        } catch (Exception e) {
            Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DocumentosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return docuLista;
    }
}
