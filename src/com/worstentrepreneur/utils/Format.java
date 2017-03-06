package com.worstentrepreneur.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

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
}
