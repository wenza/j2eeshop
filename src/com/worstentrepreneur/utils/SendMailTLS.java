package com.worstentrepreneur.utils;

/**
 * Created by wenza on 3.10.16.
 */

import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendMailTLS {
    //public static String testRecipient = ShopSettingsSngl.getInstance().mainAdminMail;
    public static boolean send(String from, String to,String subject, String text){

        ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
        final String username = settings.getMailUsername();
        final String password = settings.getMailPassword();

        Properties props = new Properties();
        props.put("mail.smtp.auth", settings.isMailSmtpAuth()+"");
        props.put("mail.smtp.starttls.enable", settings.isMailSmtpStartTLSEnable()+"");
        props.put("mail.smtp.host", settings.getMailSmtpHost());
        props.put("mail.smtp.port", settings.getMailSmtpPort()+"");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text,"utf-8", "html");

            message.setContent(text, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email sent!");
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void sendInThread(final String from,final String to,final String subject,final String text){
        new Thread(new Runnable() {
            @Override
            public void run() {
                send(from,to,subject,text);
            }
        }).start();
    }

}
