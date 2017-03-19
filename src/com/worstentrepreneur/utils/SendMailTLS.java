package com.worstentrepreneur.utils;

/**
 * Created by wenza on 3.10.16.
 */

import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

public class SendMailTLS {
    //public static String testRecipient = ShopSettingsSngl.getInstance().mainAdminMail;
    public static boolean send(String from, String to,String subject, String text){

        ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
        final String username = settings.getMailUsername();
        final String password = settings.getMailPassword();

        Properties props = new Properties();
        /*if(settings.isMailSmtpAuth()) {
            props.put("mail.smtp.auth", "true");
        }else{
            props.put("mail.transport.protocol", "smtp");
        }*/

        if("starttls".equals(settings.getMailSmtpType())) {
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", settings.getMailSmtpHost());
            props.put("mail.smtp.port", settings.getMailSmtpPort() + "");
        }else if("ssl".equals(settings.getMailSmtpType())){
            props.put("mail.smtp.host", "smtp.yandex.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        }


        Enumeration keys = props.keys();
        while (keys.hasMoreElements()) {
            String key = (String)keys.nextElement();
            String value = (String)props.get(key);
            System.out.println("PROPERTY_MAIL="+key + ": " + value);
        }

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
    public static void sendContentInThread(final String mailFrom,final String to,final String subject,final String headline,final String text,final String filePath){
        sendContentInThread(mailFrom,to,subject,headline,text,filePath,null);
    }
    public static void sendContentInThread(final String mailFrom, final String to, final String subject, final String headline, final String text, final String filePath, final Map<String,String> patchKeywords){
        new Thread(new Runnable() {
            @Override
            public void run() {
                //MailContent.readFile(filePath, StandardCharsets.UTF_8);
                try {
                    System.out.println("Looking for html fill");

                    String content = MailContent.get(filePath, subject, headline, text, null, null, "http://1x1px.me/000000-0.png");
                    if(patchKeywords!=null) {
                        for (Map.Entry<String, String> entry : patchKeywords.entrySet()) {
                            String key = entry.getKey();
                            String value = entry.getValue();
                            content = content.replaceAll(key, TestReq.Str(value));
                        }
                    }
                    System.out.println("Looking for mc at - "+filePath);
                    send(mailFrom,to,subject,content);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
