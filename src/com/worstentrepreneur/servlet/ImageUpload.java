package com.worstentrepreneur.servlet;

import com.worstentrepreneur.utils.StringEncoder;
import com.worstentrepreneur.utils.TestReq;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.imaging.ImageFormat;
import org.apache.commons.imaging.ImageReadException;
import org.apache.commons.imaging.Imaging;
import org.apache.commons.io.IOUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/ImageUpload")
public class ImageUpload extends HttpServlet {

    /**
     * Default constructor.
     */
    public ImageUpload() {
        // TODO Auto-generated constructor stub

    }

    /**
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int minWidth = TestReq.Int(request,"min-width");
        int minHeight = TestReq.Int(request,"min-height");
        int maxFileSizeKB = 5000;//Settings.uploadImagesMaxSizeKB;
        String addPath = "/uploads/";//Settings.uploadImagesPath;
        //String addPath = "/up-imgs/";
        String filePath = addPath;
        String error = "";
        String successPath = "";

        String fileName;//item.getName();
        String root = getServletContext().getRealPath("/");
        String newPath = root+addPath;

        fileName= StringEncoder.randomString(10)+(new Date().getTime());
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List /* FileItem */ items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {
                        String extension = "png";
                        String postFileName = item.getName();
                        int i = postFileName.lastIndexOf('.');
                        if (i > 0) {
                            extension = postFileName.substring(i+1).toLowerCase();
                        }else{
                            error+="Image doesnt have extension(Unknown type).<br>";
                        }
                        boolean supported = false;
                        try {
                            //image is InputStream
                            byte[] byteArray = IOUtils.toByteArray(item.getInputStream());
                            ImageFormat mimeType = Imaging.guessFormat(byteArray);
                            System.out.println(" MIMETYPE = "+mimeType);
                            if ( (mimeType == ImageFormat.IMAGE_FORMAT_JPEG) ||
                                    (mimeType == ImageFormat.IMAGE_FORMAT_PNG) ||
                                    (mimeType == ImageFormat.IMAGE_FORMAT_GIF)
                                    ) {
                                supported=true;
                            } else {
                                // handle image of different format. Ex: BMP
                                supported=false;
                                error+="Unsupported image - supported are PNG,JPG,GIF only<br>";
                            }
                        } catch (ImageReadException e) {
                            //not an image
                            error+="Unsupported file - supported are PNG,JPG,GIF only<br>";
                            supported=false;
                        }
                        if(supported) {
                            if ("svg".equalsIgnoreCase(extension) || "png".equalsIgnoreCase(extension) || "gif".equalsIgnoreCase(extension) || "jpg".equalsIgnoreCase(extension) || "jpeg".equalsIgnoreCase(extension)) {

                                final String fileNameWithoutEx = fileName.toLowerCase();
                                fileName += "." + extension;
                                fileName = fileName.toLowerCase();
                                File path = new File(newPath);
                                if (!path.exists()) path.mkdirs();
                                final long sizeInKB = item.getSize() / 1024;


                                if (sizeInKB < maxFileSizeKB) {
                                    final File uploadedFile = new File(path + "/" + fileName);
                                    item.write(uploadedFile);
                                    response.setContentType("text/html");

                                    if(checkMinWidthHeight(uploadedFile, minWidth, minHeight)){

                                        successPath = (filePath + fileName).toLowerCase();
                                        System.out.println("paths=" + successPath);
                                        final File path2 = path;
                                        final String extension2 = extension;
                                        new Thread(new Runnable() {
                                            @Override
                                            public void run() {
                                                addSmallerRes(uploadedFile, sizeInKB, path2, fileNameWithoutEx, extension2);
                                            }
                                        }).start();
                                    }else{
                                        error+="Minimum width or height doesn't match";
                                    }
                                } else {
                                    error += "Max. filesize is 450KB<br>";
                                }

                            } else {
                                error += "Unsupported file - supported are PNG,JPG,GIF only<br>";
                            }
                        }
                    }else{
                        error+="Image is not form field<br>";
                    }
                }
            } catch (FileUploadException e) {
                //e.printStackTrace();
                error+=""+e.getMessage()+"<br>";
            } catch (Exception e) {
                e.printStackTrace();
                error+=""+e.getMessage()+"<br>";
            }
        }else{
            error+="File is not multipart<br>";
        }
        boolean success = error.length()==0;
        System.out.println("SUCCC="+success);
        String msg = error.length()==0?successPath:"<h2>Ooops there is a problem!</h2>"+error+"";
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": "+success+" , \"msg\" : \""+msg+"\"}");
    }
    public static void addSmallerRes(File uploadedFile,long fileSizeInKB,final File path2,final String onlyFileName,final String extension){
        //for()
        try {
            String fullpath= path2.getAbsolutePath();
            BufferedImage originalImage = ImageIO.read(new File(uploadedFile.getAbsolutePath()));
            int typeX = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            double ratio = ((double)originalImage.getHeight())/((double)originalImage.getWidth());

            changeSaveNewRes(originalImage,typeX,ratio,fullpath,150,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,320,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,480,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,640,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,1024,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,1280,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,1366,uploadedFile,fileSizeInKB,onlyFileName,extension);
            changeSaveNewRes(originalImage,typeX,ratio,fullpath,1920,uploadedFile,fileSizeInKB,onlyFileName,extension);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static boolean checkMinWidthHeight(File uploadedFile, int width, int height){
        try {
            BufferedImage originalImage = ImageIO.read(new File(uploadedFile.getAbsolutePath()));
            int itsWidth = originalImage.getWidth();
            int itsHeight = originalImage.getHeight();
            if(itsWidth<width){
                return false;
            }
            if(itsHeight<height){
                return false;
            }

        } catch (Exception e) {
            System.out.println("Exception error = checkMinWidthHeight");
            return false;
            //e.printStackTrace();
        }
        return true;
    }

    public static void changeSaveNewRes(int width,File uploadedFile,long fileSizeInKB,final File path2,final String onlyFileName,final String extension){
        try {
            String fullpath= path2.getAbsolutePath();
            BufferedImage originalImage = ImageIO.read(new File(uploadedFile.getAbsolutePath()));
            int typeX = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            double ratio = ((double)originalImage.getHeight())/((double)originalImage.getWidth());

            changeSaveNewRes(originalImage,typeX,ratio,fullpath,width,uploadedFile,fileSizeInKB,onlyFileName,extension);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public static void changeSaveNewRes(BufferedImage originalImage,int typeX, double ratio,String fullpath,int width,File uploadedFile,long fileSizeInKB,final String onlyFileName,final String extension) throws IOException{

            int height = (int)(width*ratio);//180?
            BufferedImage resizedImage5 = new BufferedImage(width, height ,typeX);//originalImage.getWidth()/5, originalImage.getHeight()/5, typeX);
            Graphics2D g = resizedImage5.createGraphics();
            g.drawImage(originalImage, 0, 0,width, height,null);//originalImage.getWidth()/5, originalImage.getHeight()/5, null);
            g.dispose();
            String tlc5 = fullpath+"/"+onlyFileName+"_"+width+"."+extension;
            ImageIO.write(resizedImage5, extension.toLowerCase(), new File(tlc5));
    }

}
