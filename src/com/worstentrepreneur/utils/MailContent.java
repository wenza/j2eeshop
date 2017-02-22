package com.worstentrepreneur.utils;


import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Calendar;

/**
 * Created by wenza on 24.11.16.
 */
public class MailContent {
    public static ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
    public static String getUniversalContent(String subject,String headline,String text, String btnLink, String btnText,String headerImageUrl){
        String html = readFile(settings.getAbsolutePathOfWar()+"/admin/modules/mailtemplate-editor/templates/universal/mailtemplate.html", StandardCharsets.UTF_8);
        html = html.replaceAll("\\*\\|MC:SUBJECT\\|\\*", subject);

        html = html.replaceAll("\\*\\|HEADLINE\\|\\*", headline);
        html = html.replaceAll("\\*\\|TEXT\\|\\*",text);
        html = html.replaceAll("\\*\\|BUTTONLINK\\|\\*",btnLink);
        html = html.replaceAll("\\*\\|BUTTONTEXT\\|\\*",btnText);
        html = html.replaceAll("\\*\\|HEADERLINK\\|\\*",settings.shopUrl);
        html = html.replaceAll("\\*\\|HEADERTITLE\\|\\*",headline);
        html = html.replaceAll("\\*\\|HEADERIMAGE\\|\\*",headerImageUrl!=null?headerImageUrl:settings.getMailDefaultHeaderImageURL());

        html = html.replaceAll("\\*\\|SHOPNAME\\|\\*",settings.shopName);
        html = html.replaceAll("\\*\\|YEAR\\|\\*",Calendar.getInstance().get(Calendar.YEAR)+"");
        html = html.replaceAll("\\*\\|TWITTERLINK\\|\\*",settings.twitterLink);
        html = html.replaceAll("\\*\\|FACEBOOKLINK\\|\\*",settings.facebookLink);
        html = html.replaceAll("\\*\\|WEBSITELINK\\|\\*",settings.shopUrl);
        html = html.replaceAll("\\*\\|MAILTOADDRESS\\|\\*",settings.mailTo);
        html = html.replaceAll("\\*\\|MAILTO\\|\\*","mailto:"+settings.mailTo+"?Subject="+headline);

        return html;
    }
    public static String getUniversalContent(String subject,String headline,String text, String btnLink, String btnText){
        return getUniversalContent(subject,headline,text,btnLink,btnText,null);
    }

    public static String readFile(String path, Charset encoding){//StandardCharsets.UTF_8
        try {
            byte[] encoded = Files.readAllBytes(Paths.get(path));
            return new String(encoded, encoding);
        }catch (Exception e){
            e.printStackTrace();
            return "";
        }
    }
}
