/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

/**
 *
 * @author Chath
 */
public class Img {

            InputStream ips = null;
        OutputStream ops = null;
public void getImg(String Name, Blob img) throws SQLException, IOException{

        
        
        String fpath=null;
        String inameedit = Name.replaceAll("\\s+","");
        fpath = "C:\\Users\\Guest1\\Documents\\GitHub\\BuildHub\\BuildTest\\web\\images\\post\\"+inameedit+".jpg";
        
       // System.out.println(fpath);
        ips = img.getBinaryStream();
        //System.out.println("FileSaved!");
        ops = new FileOutputStream(fpath);
        int bytesread = -1;
        byte[] buffer = new byte[4096];
        while((bytesread=ips.read(buffer))!=-1)
        {
        ops.write(buffer, 0, bytesread);
        }


}

public void close() throws IOException{

            ips.close(); 
        ops.close();

}
    
}
