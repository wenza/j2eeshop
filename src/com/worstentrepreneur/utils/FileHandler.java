package com.worstentrepreneur.utils;

import org.apache.commons.io.FileUtils;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

public class FileHandler {
    public static File moveDir(String original, String destination){
        File origFile = new File(original);
        File destFile = new File(destination);
        try {
            System.out.println(origFile.getName()+" from: " + origFile.getAbsolutePath());
            /*if (!destFile.exists()) {
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }
                destFile.createNewFile();
            }*/
            if(destFile.exists())destFile.delete();
            FileUtils.moveDirectory(origFile,destFile);
            System.out.println(origFile.getName()+" to  : " + origFile.getAbsolutePath());
            System.out.println(destFile.getAbsolutePath());
        }catch (Exception e){
            e.printStackTrace();
        }
        return destFile;
    }

    public static File copy(String original, String destination){
        File origFile = new File(original);
        File destFile = new File(destination);
        try {
            System.out.println(origFile.getName()+" from: " + origFile.getAbsolutePath());
            /*if (!destFile.exists()) {
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }
                destFile.createNewFile();
            }*/
            if(destFile.exists())destFile.delete();
            FileUtils.copyFile(origFile,destFile);
            System.out.println(origFile.getName()+" to  : " + origFile.getAbsolutePath());
            System.out.println(destFile.getAbsolutePath());
        }catch (Exception e){
            e.printStackTrace();
        }
        return destFile;
    }
    public static File copyDir(String original, String destination){
        File origFile = new File(original);
        File destFile = new File(destination);
        try {
            System.out.println(origFile.getName()+" from: " + origFile.getAbsolutePath());
            /*if (!destFile.exists()) {
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }
                destFile.createNewFile();
            }*/
            if(destFile.exists())destFile.delete();
            FileUtils.copyDirectory(origFile,destFile);
            System.out.println(origFile.getName()+" to  : " + origFile.getAbsolutePath());
            System.out.println(destFile.getAbsolutePath());
        }catch (Exception e){
            e.printStackTrace();
        }
        return destFile;
    }
    public static File move(String original, String destination){
        File origFile = new File(original);
        try {
            System.out.println(origFile.getName()+" from: " + origFile.getAbsolutePath());
            File destFile = new File(destination);
            checkCreateFile(destFile);
            boolean warMv = origFile.renameTo(destFile);
            System.out.println(origFile.getName()+" to  : " + origFile.getAbsolutePath() + " - " + warMv);
            System.out.println(destFile.getAbsolutePath());
        }catch (Exception e){
            e.printStackTrace();
        }
        return origFile;
    }
    public static void checkCreateFile(File f){
        try {
            if (!f.exists()) {
                if (!f.getParentFile().exists()) {
                    f.getParentFile().mkdirs();
                }
                f.createNewFile();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public static boolean download(String url, String destination){
        boolean ok = true;
        File f = new File(destination);
        try {
            //System.out.println("Creating empty file 1");
            checkCreateFile(f);
            //System.out.println("Creating empty file 2");
            FileUtils.copyURLToFile(new URL(url), f);
        } catch (IOException e) {
            e.printStackTrace();
            ok=false;
        }
        return ok;
    }
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
            System.out.println("write to "+path+" Done");
        } catch (IOException e) {
            System.out.println("File not found to write at "+path);
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
            System.out.println("File not found to read at "+path);
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
