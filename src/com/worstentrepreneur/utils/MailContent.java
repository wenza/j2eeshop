package com.worstentrepreneur.utils;


import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.j2eeshop.dao.entity.*;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.List;

/**
 * Created by wenza on 24.11.16.
 */
public class MailContent {
    public static ShopSettingsSngl settings = ShopSettingsSngl.getInstance();
    public static String get(String filePath,String subject,String headline,String text, String btnLink, String btnText,String headerImageUrl){
        String html = readFile(settings.getAbsolutePathOfWar()+filePath, StandardCharsets.UTF_8);
        System.out.println("file read");
        if(html!=null) {
            System.out.println("file read 2");

            html = html.replaceAll("\\*\\|MC:SUBJECT\\|\\*", TestReq.Str(subject));
            System.out.println("file read 21");

            html = html.replaceAll("\\*\\|HEADLINE\\|\\*", TestReq.Str(headline));
            System.out.println("file read 22");
            html = html.replaceAll("\\*\\|TEXT\\|\\*", TestReq.Str(text));
            System.out.println("file read 23");
            html = html.replaceAll("\\*\\|BUTTONLINK\\|\\*", TestReq.Str(btnLink));
            System.out.println("file read 24");
            html = html.replaceAll("\\*\\|BUTTONTEXT\\|\\*", TestReq.Str(btnText));
            System.out.println("file read 25");
            html = html.replaceAll("\\*\\|HEADERLINK\\|\\*", TestReq.Str(settings.shopUrl));
            System.out.println("file read 26");
            html = html.replaceAll("\\*\\|HEADERTITLE\\|\\*", TestReq.Str(headline));
            System.out.println("file read 27");
            html = html.replaceAll("\\*\\|HEADERIMAGE\\|\\*", TestReq.Str(headerImageUrl != null ? headerImageUrl : settings.getMailDefaultHeaderImageURL()));
            System.out.println("file read 28");

            html = html.replaceAll("\\*\\|SHOPNAME\\|\\*", TestReq.Str(settings.shopName));
            System.out.println("file read 29");
            html = html.replaceAll("\\*\\|YEAR\\|\\*", TestReq.Str(Calendar.getInstance().get(Calendar.YEAR) + ""));
            System.out.println("file read 30");
            html = html.replaceAll("\\*\\|TWITTERLINK\\|\\*", TestReq.Str(settings.twitterLink));
            System.out.println("file read 31");
            html = html.replaceAll("\\*\\|FACEBOOKLINK\\|\\*", TestReq.Str(settings.facebookLink));
            System.out.println("file read 32");
            html = html.replaceAll("\\*\\|WEBSITELINK\\|\\*", TestReq.Str(settings.shopUrl));
            System.out.println("file read 33");
            html = html.replaceAll("\\*\\|MAILTOADDRESS\\|\\*", TestReq.Str(settings.mailTo));
            System.out.println("file read 34");
            html = html.replaceAll("\\*\\|MAILTO\\|\\*", TestReq.Str("mailto:" + settings.mailTo + "?Subject=" + headline));
            System.out.println("file read 3");
        }
        System.out.println("file read 4");

        return html;
    }
    public static String getUniversalContent(String subject,String headline,String text, String btnLink, String btnText,String headerImageUrl){
        String html = readFile(settings.getAbsolutePathOfWar()+"/modules/backend_mailtemplate-editor/user_data/templates/universal/mailtemplate.html", StandardCharsets.UTF_8);
        html = html.replaceAll("\\*\\|MC:SUBJECT\\|\\*", TestReq.Str(subject));

        html = html.replaceAll("\\*\\|HEADLINE\\|\\*", TestReq.Str(headline));
        html = html.replaceAll("\\*\\|TEXT\\|\\*",TestReq.Str(text));
        html = html.replaceAll("\\*\\|BUTTONLINK\\|\\*", TestReq.Str(btnLink));
        html = html.replaceAll("\\*\\|BUTTONTEXT\\|\\*", TestReq.Str(btnText));
        html = html.replaceAll("\\*\\|HEADERLINK\\|\\*", TestReq.Str(settings.shopUrl));
        html = html.replaceAll("\\*\\|HEADERTITLE\\|\\*", TestReq.Str(headline));
        html = html.replaceAll("\\*\\|HEADERIMAGE\\|\\*", TestReq.Str(headerImageUrl!=null?headerImageUrl:settings.getMailDefaultHeaderImageURL()));

        html = html.replaceAll("\\*\\|SHOPNAME\\|\\*", TestReq.Str(settings.shopName));
        html = html.replaceAll("\\*\\|YEAR\\|\\*", TestReq.Str(Calendar.getInstance().get(Calendar.YEAR)+""));
        html = html.replaceAll("\\*\\|TWITTERLINK\\|\\*", TestReq.Str(settings.twitterLink));
        html = html.replaceAll("\\*\\|FACEBOOKLINK\\|\\*", TestReq.Str(settings.facebookLink));
        html = html.replaceAll("\\*\\|WEBSITELINK\\|\\*", TestReq.Str(settings.shopUrl));
        html = html.replaceAll("\\*\\|MAILTOADDRESS\\|\\*", TestReq.Str(settings.mailTo));
        html = html.replaceAll("\\*\\|MAILTO\\|\\*", TestReq.Str("mailto:"+settings.mailTo+"?Subject="+headline));

        return html;
    }
    public static String getUniversalNoBtnContent(String subject,String headline,String text,String headerImageUrl){
        String html = readFile(settings.getAbsolutePathOfWar()+"/modules/backend_mailtemplate-editor/user_data/templates/universal_no_btn/mailtemplate.html", StandardCharsets.UTF_8);
        html = html.replaceAll("\\*\\|MC:SUBJECT\\|\\*", TestReq.Str(subject));

        html = html.replaceAll("\\*\\|HEADLINE\\|\\*", TestReq.Str(headline));
        html = html.replaceAll("\\*\\|TEXT\\|\\*", TestReq.Str(text));
        html = html.replaceAll("\\*\\|HEADERLINK\\|\\*", TestReq.Str(settings.shopUrl));
        html = html.replaceAll("\\*\\|HEADERTITLE\\|\\*", TestReq.Str(headline));
        html = html.replaceAll("\\*\\|HEADERIMAGE\\|\\*", TestReq.Str(headerImageUrl!=null?headerImageUrl:settings.getMailDefaultHeaderImageURL()));

        html = html.replaceAll("\\*\\|SHOPNAME\\|\\*", TestReq.Str(settings.shopName));
        html = html.replaceAll("\\*\\|YEAR\\|\\*", TestReq.Str(Calendar.getInstance().get(Calendar.YEAR)+""));
        html = html.replaceAll("\\*\\|TWITTERLINK\\|\\*", TestReq.Str(settings.twitterLink));
        html = html.replaceAll("\\*\\|FACEBOOKLINK\\|\\*", TestReq.Str(settings.facebookLink));
        html = html.replaceAll("\\*\\|WEBSITELINK\\|\\*", TestReq.Str(settings.shopUrl));
        html = html.replaceAll("\\*\\|MAILTOADDRESS\\|\\*", TestReq.Str(settings.mailTo));
        html = html.replaceAll("\\*\\|MAILTO\\|\\*", TestReq.Str("mailto:"+settings.mailTo+"?Subject="+headline));

        return html;
    }
    public static String getUniversalContent(String subject,String headline,String text, String btnLink, String btnText){
        return getUniversalContent(subject,headline,text,btnLink,btnText,"http://www.cityrider.com/fixed/43aspect.png");
    }

    public static String readFile(String path, Charset encoding){//StandardCharsets.UTF_8
        System.out.println("Reading file at path : "+path);
        try {
            byte[] encoded = Files.readAllBytes(Paths.get(path));
            return new String(encoded, encoding);
        }catch (Exception e){
            e.printStackTrace();
            return "";
        }
    }
    public static String getOrderContents(CustomerSessionHolder sh){
        ShippingLang shippingLang = sh.order.getShipping().getLang(sh.getLang(),sh.jpa);
        PaymentLang paymentLang = sh.order.getPayment().getLang(sh.getLang(),sh.jpa);
        String html = "<table class=\"table no-first-border\" style=\"width:100%;font-size:10px;\">\n" +
                "            <tr>\n" +
                "                <th colspan=\"2\"> Položka </th><th></th><th>Množství</th><th>Cena (vč. DPH)</th>\n" +
                "            </tr>";
        for(OrderToProduct o2p : sh.order.getProducts()) {
            ProductLang lang = o2p.getProduct().getLang(sh.userLang, sh.jpa);
            String coverImg = "";
            List<ProductImage> productImages = sh.jpa.selectProductImages(o2p.getProduct());
            for (ProductImage pi : productImages) {
                if (pi.isCover()) coverImg = sh.shopSettings.shopUrl+pi.getImageURL();
            }
            html+="<tr>\n" +
                    "                        <td width=\"50px\">\n" +
                    "                            <img src=\""+coverImg+"\" width=\"50px\"/>\n" +
                    "                        </td>\n" +
                    "                        <td>\n" +
                    "                            <div>"+lang.getName()+"</div>\n" +
                    "                            <div>Kód: "+o2p.getProduct().getShopProductCode()+"</div>\n" +
                    "\n" +
                    "                        </td>\n" +
                    "                        <td width=\"100px\"></td>\n" +
                    "                        <td width=\"80px\">\n" +
                    "                            "+o2p.getQuantity()+"ks\n" +
                    "                        </td>\n" +
                    "                        <td width=\"80px\">"+Format.number(o2p.getPriceTaxIncl())+""+sh.userCurrency.getSign()+"</td>\n" +
                    "                    </tr>";
        }
        html+="<tr>\n" +
                "                <td colspan=\"2\" class=\"border-top\" style=\"border-top:white 1px solid;\">"+shippingLang.getName()+"</td>\n" +
                "                <td colspan=\"2\" class=\"border-top\" style=\"text-align:left;border-top:white 1px solid;\">Poštovné :</td>\n" +
                "                <td  class=\"border-top\" style=\"border-top:white 1px solid;\">"+Format.number(sh.order.getShippingTaxIncl())+""+sh.userCurrency.getSign()+"</td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td colspan=\"2\" class=\"no-border\">"+paymentLang.getName()+"</td>\n" +
                "                <td colspan=\"2\" class=\"border-top\" style=\"text-align:left;\">Platební metoda :</td>\n" +
                "                <td  class=\"border-top\">"+Format.number(sh.order.getPaymentTaxIncl())+""+sh.userCurrency.getSign()+"</td>\n" +
                "            </tr>\n" +
                "            <tr>\n" +
                "                <td colspan=\"2\" class=\"no-border\"></td>\n" +
                "                <td colspan=\"2\" class=\"border-top\" style=\"text-align:left;border-top:white 1px solid;\">Celkem :</td>\n" +
                "                <td  class=\"border-top\" style=\"border-top:white 1px solid;\"><strong>"+Format.number(sh.order.getOrderTaxIncl())+""+sh.userCurrency.getSign()+"</strong></td>\n" +
                "            </tr>\n" +
                "\n" +
                "        </table>";
        return html;

    }
}
