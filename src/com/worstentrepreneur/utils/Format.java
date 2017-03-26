package com.worstentrepreneur.utils;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Format {
    public static String decimalsNumber(BigDecimal value){
        DecimalFormatSymbols formatSymbols = new DecimalFormatSymbols();
        formatSymbols.setDecimalSeparator('.');
        formatSymbols.setGroupingSeparator(' ');

        DecimalFormat df = new DecimalFormat("#,###,###.##", formatSymbols);
        return df.format(value);
    }
    public static String number(BigDecimal value){

        DecimalFormatSymbols formatSymbols = new DecimalFormatSymbols();
        formatSymbols.setDecimalSeparator('.');
        formatSymbols.setGroupingSeparator(' ');

        DecimalFormat df = new DecimalFormat("#,###,###", formatSymbols);
        return df.format(value);
    }
    public static String date(Date date){
        DateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        return sdf.format(date);
    }
}
