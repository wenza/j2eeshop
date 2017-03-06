package com.worstentrepreneur.tests;

import com.worstentrepreneur.j2eeshop.ShopSettingsSngl;
import com.worstentrepreneur.utils.FileHandler;
import com.worstentrepreneur.utils.PropertyHandler;
import com.worstentrepreneur.utils.TestReq;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.progress.ProgressMonitor;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.Properties;

public class Updater {
    static String warPath = ShopSettingsSngl.getInstance().getWarPath();//"/home/wenza/projects/lovelili/out/artifacts/lovelili";//ShopSettingsSngl.getInstance().getWarPath()
    static String infoPath = warPath + "/admin/updates/";
    static String backupsPath = warPath + "/admin/updates/backups/";
    static String newVersionZipURL = "";

    public static boolean needsUpdate(){
        //ShopSettingsSngl.getInstance().getUpdateStatus().clear();
        String latestDest = infoPath+"latest.info";
        ShopSettingsSngl.getInstance().updateStatus("Checking for new version");
        String currentDest = infoPath+"current.info";
        FileHandler.download("http://worstentrepreneur.com/j2eeshop/updates/latest.info",latestDest);
        Properties latestProps = PropertyHandler.read(latestDest);
        int latestVersion = TestReq.Int(latestProps.getProperty("latest_version"));
        if(latestVersion==0)return true;
        ShopSettingsSngl.getInstance().updateStatus("Checking for new version - latest : "+latestVersion);
        Properties currentProps = PropertyHandler.read(currentDest);
        int currentVersion = TestReq.Int(currentProps.getProperty("latest_version"));
        if(currentVersion==0)return true;
        ShopSettingsSngl.getInstance().updateStatus("Checking for new version - latest : "+latestVersion+" , current : "+currentVersion);
        System.out.println(Arrays.asList(ShopSettingsSngl.getInstance().getUpdateStatus()).toString());
        if(latestVersion>currentVersion){
            newVersionZipURL="http://worstentrepreneur.com/j2eeshop/updates/v"+latestVersion+"/j2eeshop.zip";
            ShopSettingsSngl.getInstance().updateStatus("Updating");
            return true;
        }else{
            ShopSettingsSngl.getInstance().updateStatus("No update");
            return false;
        }

    }
    public static void updateInThread(){
        new Thread(new Runnable() {
            @Override
            public void run() {
                update();
            }
        }).start();
    }
    public static void update(){
        if(!ShopSettingsSngl.getInstance().isUpdating()) {
            ShopSettingsSngl.getInstance().setUpdating(true);
            if (needsUpdate()) {
                final String source = warPath + "/admin/updates/downloads/j2eeshop.zip";

                //System.out.println("Downloading to - " + source);

                ShopSettingsSngl.getInstance().updateStatus("Downloading : " + newVersionZipURL + " to : " + source);
                FileHandler.download(newVersionZipURL, source);

                String destination = warPath + "/admin/updates/downloads/j2eeshop";
                String password = "j2eeshop";

                try {
                    ZipFile zipFile = new ZipFile(source);
                    if (zipFile.isEncrypted()) {
                        zipFile.setPassword(password);
                    }
                    ShopSettingsSngl.getInstance().updateStatus("Unzipping : " + source + " to : " + destination);
                    zipFile.extractAll(destination);

                    ProgressMonitor progressMonitor = zipFile.getProgressMonitor();
                    if (progressMonitor.getResult() == ProgressMonitor.RESULT_ERROR) {
                        // Any exception can be retrieved as below:
                        if (progressMonitor.getException() != null) {
                            progressMonitor.getException().printStackTrace();
                            ShopSettingsSngl.getInstance().updateStatus("Error with unzipping : " + progressMonitor.getException().getMessage());
                        } else {
                            //System.err.println("An error occurred without any exception");
                            ShopSettingsSngl.getInstance().updateStatus("Error with unzipping : Unknown");
                        }
                    } else {
                        File f = new File(source);
                        ShopSettingsSngl.getInstance().updateStatus("Unzipping successful! Removing ZIP file");
                        f.delete();
                    }
                } catch (ZipException e) {
                    ShopSettingsSngl.getInstance().updateStatus("ERROR: ZipException : " + e.getMessage());
                    e.printStackTrace();
                }

                File war = new File(warPath);
                ShopSettingsSngl.getInstance().updateStatus("Moving DIR from : " + warPath + "/ to : " + war.getParentFile().getAbsolutePath() + "/" + war.getName() + "_backup");
                File backupWar = FileHandler.moveDir(warPath + "/", war.getParentFile().getAbsolutePath() + "/" + war.getName() + "_backup");//+"/admin/updates/backups/date_"+(new Date()).getTime()+"/");

                ShopSettingsSngl.getInstance().updateStatus("Moving DIR from : " + backupWar.getAbsolutePath() + "/admin/updates/downloads/j2eeshop/" + " to : " + warPath + "/");
                File newVersionFile = FileHandler.moveDir(backupWar.getAbsolutePath() + "/admin/updates/downloads/j2eeshop/", warPath + "/");

                ShopSettingsSngl.getInstance().updateStatus("Moving DIR from : " + backupWar.getAbsolutePath() + "/admin/updates/" + " to : " + warPath + "/admin/updates/");
                File updatesFolder = FileHandler.moveDir(backupWar.getAbsolutePath() + "/admin/updates/", warPath + "/admin/updates/");

                ShopSettingsSngl.getInstance().updateStatus("Moving DIR from : " + backupWar.getAbsolutePath() + "/" + " to : " + warPath + "/admin/updates/backups/date_" + (new Date()).getTime() + "/");
                File backupFolder = FileHandler.moveDir(backupWar.getAbsolutePath() + "/", warPath + "/admin/updates/backups/date_" + (new Date()).getTime() + "/");

                ShopSettingsSngl.getInstance().updateStatus("Copying DIR from : " + backupFolder.getAbsolutePath() + "/admin/modules/" + " to : " + warPath + "/admin/modules/");
                File modulesAdmin = FileHandler.copyDir(backupFolder.getAbsolutePath() + "/admin/modules/", warPath + "/admin/modules/");

                ShopSettingsSngl.getInstance().updateStatus("Copying DIR from : " + backupFolder.getAbsolutePath() + "/modules/" + " to : " + warPath + "/modules/");
                File modules = FileHandler.copyDir(backupFolder.getAbsolutePath() + "/modules/", warPath + "/modules/");

                ShopSettingsSngl.getInstance().updateStatus("Copying DIR from : " + backupFolder.getAbsolutePath() + "/uploads/" + " to : " + warPath + "/uploads/");
                File uploads = FileHandler.copyDir(backupFolder.getAbsolutePath() + "/uploads/", warPath + "/uploads/");

                ShopSettingsSngl.getInstance().updateStatus("Copying File from : " + backupFolder.getAbsolutePath() + "/admin/config.properties" + " to : " + warPath + "/admin/config.properties");
                File config = FileHandler.copy(backupFolder.getAbsolutePath() + "/admin/config.properties", warPath + "/admin/config.properties");

                ShopSettingsSngl.getInstance().updateStatus("Moving File from : " + infoPath + "current.info" + " to : " + backupFolder.getAbsolutePath() + "/admin/updates/current.info");
                FileHandler.move(infoPath + "current.info", backupFolder.getAbsolutePath() + "/admin/updates/current.info");

                ShopSettingsSngl.getInstance().updateStatus("Renaming File from : " + infoPath + "latest.info" + " to : " + infoPath + "current.info");

                FileHandler.copy(backupFolder.getAbsolutePath() + "/admin/updates/latest.info", infoPath+"current.info");
                /*File latestInfo = new File(warPinfoPath + "latest.info");
                latestInfo.renameTo(new File(infoPath + "current.info"));*/

                ShopSettingsSngl.getInstance().updateStatus("Creating File : " + war.getParentFile().getAbsolutePath() + "/" + war.getName() + ".dodeploy");
                File dodeploy = new File(war.getParentFile().getAbsolutePath() + "/" + war.getName() + ".dodeploy");
                try {
                    dodeploy.createNewFile();
                } catch (IOException e) {
                    ShopSettingsSngl.getInstance().updateStatus("ERROR: IOException: " + e.getMessage());
                    //e.printStackTrace();
                }
            } else {
                System.out.println("J2EESHOP is up to date!");
            }
            ShopSettingsSngl.getInstance().setUpdating(false);
        }


    }
}
