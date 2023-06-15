/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author xJuanDa
 */
public class PropiedadesCorreo {
    
    public static void envioCorreo(String servidor, String puerto, final String usuario,
            final String clave, String destino, String asunto, String mensaje) throws MessagingException {

        //Propiedades servidor SMTP
        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.host", servidor);
        propiedades.put("mail.smtp.port", puerto);
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");

        Authenticator autenticar = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, clave);
            }
        };
        
        Session sesion = Session.getInstance(propiedades, autenticar);
        Message msg = new MimeMessage(sesion);
        msg.setFrom(new InternetAddress(usuario));
        InternetAddress[] direcciones ={new InternetAddress(destino)};
        msg.setRecipients(Message.RecipientType.TO, direcciones);
        msg.setSubject(asunto);
        msg.setSentDate(new Date());
        msg.setText(mensaje);
          
        Transport.send(msg, usuario, clave);
        

    }
}
