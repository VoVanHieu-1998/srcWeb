package com.cdweb.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Arrays;
import java.util.Locale;

public class MyUtils {

    public static String fullPath(String path) {
        return "http://localhost:8080/CDWEB2020/" + path;
    }

    public static String convertToVndCurrency(BigDecimal vnd) {
        System.out.println(vnd);
        Locale localeVN = new Locale("vi", "VN");
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        DecimalFormat currencyVN = (DecimalFormat) DecimalFormat.getCurrencyInstance(localeVN);
        symbols.setCurrencySymbol("₫");
        symbols.setGroupingSeparator('.');

        currencyVN.setDecimalFormatSymbols(symbols);
        return currencyVN.format(vnd);
    }

    public static void main(String[] args) {

    }
}
