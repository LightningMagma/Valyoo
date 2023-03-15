/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.crud;
import ModeloVO.PagoVO;

/**
 *
 * @author APRENDIZ
 */
public class PagoDAO extends ConexionDB implements crud  {
    
    private Connection puerta;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String PagId, PagDesc, PagValor, PagFecha, PagPres;
    
    public PagoDAO (PagoVO pagoVO) {
        super();
        try {
            //3. Conectarse a la DB
            puerta = this.obtenerConexion();
            //4. Traer los datos del VO al DAO
        } catch (Exception e) {
            Logger.getLogger(PagoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
    }
    
    
}
