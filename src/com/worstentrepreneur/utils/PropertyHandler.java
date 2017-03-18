package com.worstentrepreneur.utils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Properties;

public class PropertyHandler {
    public static Properties read(String path){
        Properties prop = new Properties();
        InputStream input = null;

        try {

            input = new FileInputStream(path);

            // load a properties file
            prop.load(new InputStreamReader(input, Charset.forName("UTF-8")));

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return prop;
    }
    public static void store(Properties prop, String path){

        OutputStream output = null;

        try {
            output = new FileOutputStream(path);
            prop.store(output, null);

        } catch (IOException io) {
            io.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }
}
