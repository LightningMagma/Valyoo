/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;
import ModeloVO.UsuarioVO;
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
public class UsuarioDAO extends ConexionDB implements crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;   
    private String sql;
    private String usuUsuario = "", usuContrasena = "", usuEstado = "";
     public UsuarioDAO() {
    }
    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        try {
            //3. Conectarse a la DB
            conexion = this.obtenerConexion();
            //4. Trare los datos del VO al DAO
            usuUsuario = usuVO.getUsuUsuario();
            usuContrasena = usuVO.getUsuContrasena();
            usuEstado = usuVO.getUsuEstado();
        } catch (Exception e) {
            //Logger atrapa la trasavilidad como nivel severo
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {

            sql = "insert into tblusuario(usuUsuario,usuContrasena)values (?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuUsuario);
            puente.setString(2, usuContrasena);            
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update tblusuario set usuContrasena=? where usuUsuario=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuContrasena);
            puente.setString(2, usuUsuario);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {

            sql = "update tblusuario set usuEstado='Inactivo' where usuUsuario=?;";
            puente = conexion.prepareStatement(sql);            
            puente.setString(1, usuUsuario);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return operacion;
    }
    public boolean iniciarSesion(String usuario, String clave) {
        try {
            conexion=this.obtenerConexion();
            sql="select * from tblusuario where usuUsuario=? and usuContrasena=?;";
            puente= conexion.prepareStatement(sql);
            puente.setString(1, usuUsuario);
            puente.setString(2, usuContrasena);
            mensajero=puente.executeQuery();
            if (mensajero.next()) {
                operacion=true;
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return operacion;
    }
     public UsuarioVO consultarPorID(String id){
        UsuarioVO usuVO = null;
        try {
            conexion=this.obtenerConexion();
            sql="select * from tblusuario where usuUsuario=?;";
            puente= conexion.prepareStatement(sql);
            puente.setString(1,id);            
            mensajero=puente.executeQuery();            
            while (mensajero.next()) {                
                usuVO = new UsuarioVO(id,mensajero.getString(2), mensajero.getString(3));
            }            
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return usuVO;
    }
    public ArrayList<UsuarioVO> listarUsuarios(){
        ArrayList<UsuarioVO> listaUsuario = new ArrayList<>();
        try {
            conexion=this.obtenerConexion();
            sql="select * from tblusuario;";
            puente= conexion.prepareStatement(sql);                     
            mensajero=puente.executeQuery();            
            while (mensajero.next()) {                
                UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1),mensajero.getString(2),mensajero.getString(3));
                listaUsuario.add(usuVO);
            }            
        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally {
            try {
                this.cerrarConexion();
            } catch (SQLException ex) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listaUsuario;
        
    }
    
}
