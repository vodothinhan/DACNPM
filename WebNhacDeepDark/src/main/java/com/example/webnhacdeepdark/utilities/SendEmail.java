package com.example.webnhacdeepdark.utilities;

import com.example.webnhacdeepdark.entity.Contact;
import com.example.webnhacdeepdark.entity.Users;
import com.example.webnhacdeepdark.service.ContactService;
import com.example.webnhacdeepdark.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.ArrayList;

@Component
public class SendEmail {
    @Autowired
    JavaMailSender mailSender ;

    @Autowired
    ContactService service ;
    public boolean sendEmail(String to , String code){
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setSubject("OTP Reset PassWord");
            helper.setFrom("vuibuonqua123@gmail.com");
            helper.setTo(to);
            String content = "<h1 style= \\n\" +\n" + "font-weight: 300; text-align: center;\\\">"+code+"</h1>";
            helper.setText(content, true);
            mailSender.send(message);
            return  true ;

        } catch (MessagingException e) {
            return  false ;
        }

    }
    public void replayEmail( ArrayList<String> listContent){
        Contact contact = service.findContactById(listContent.get(0));
        Users users = contact.getUsers();
        String to = users.getEmail() ;
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("noreply@baeldung.com");
        message.setTo(to);
        message.setSubject("Cảm ơn bạn đã đóng góp ý kiến");
        message.setText(listContent.get(1));
        mailSender.send(message);
    }
}

