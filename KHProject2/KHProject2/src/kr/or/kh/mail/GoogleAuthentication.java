package kr.or.kh.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
   PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("kksskk1234", "hpgsduvodaraawqk");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}