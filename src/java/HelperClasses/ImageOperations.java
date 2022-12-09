/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HelperClasses;

import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Rohit
 */
public class ImageOperations {
    public static void saveTheImageToFolder(String path,Part part){
        try{
            //save the image to folder...
            FileOutputStream fos=new FileOutputStream(path);
            InputStream is=part.getInputStream();
            byte data[]=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            
        }catch(Exception e){
            System.out.println("opps image not saved !!!!!");
            e.printStackTrace();
        }
    }
    
}
