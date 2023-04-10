package com.mfc.untils;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.mfc.cons.Sys;
import com.sun.DateUtils;

 
/**
 *  @author jf3q.com
 *
 */
public class UploadFile {

	 
     public static String upimg( MultipartFile file,HttpServletRequest request,String package1) {
    	
    	 String format=file.getContentType().split("/")[1];
         String path = request.getSession().getServletContext().getRealPath(Sys.Upimg.path+package1);  
         
         File pf=new File(path);
         if(!pf.exists()){  
        	 pf.mkdirs();  
         }
         
         String fileName = DateUtils. getImgName()+UUID.randomUUID().toString().replace("-", "").substring(1, 11)+"."+format;  
           
         File targetFile = new File(path, fileName);  
         try {  
             file.transferTo(targetFile);
             
         } catch (Exception e) {  
             e.printStackTrace();  
         }  
        return   Sys.Upimg.path+package1+fileName  ;
     }

     public static void deleteFile(HttpServletRequest request,String path){   
		 
			 String abPath= request.getSession().getServletContext().getRealPath("")+"/"+path;
			 File f=new File(abPath);
			 if(f.exists())f.delete();
			  
    	
     } 
    
      
    
}

