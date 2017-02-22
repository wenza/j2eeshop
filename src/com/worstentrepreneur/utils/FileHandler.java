package com.worstentrepreneur.utils;

import java.io.*;

public class FileHandler {
    public static void write(String path, String content){
        BufferedWriter bw = null;
        //FileWriter fw = null;
        try {
            //fw = new FileWriter(path);
            /*bw = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(path), "UTF-8"
            ));*/
            bw = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(path), "UTF8"));//new BufferedWriter(fw);
            bw.write(content);
            System.out.println("Done");
        } catch (IOException e) {
            System.out.println("File not found to write");
            //e.printStackTrace();
        } finally {
            try {
                if(bw != null)bw.close();
                //if(fw != null)fw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    public static String read(String path){
        String result = "";

        BufferedReader br = null;
        FileReader fr = null;
        try {
            fr = new FileReader(path);
            br = new BufferedReader(fr);
            String sCurrentLine;
            //br = new BufferedReader(new FileReader(FILENAME));
            while ((sCurrentLine = br.readLine()) != null) {
                result+=sCurrentLine;
            }
        } catch (IOException e) {
            System.out.println("File not found to read");
        } finally {
            try {
                if (br != null)br.close();
                if (fr != null)fr.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }
}
