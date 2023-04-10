package com.mfc.untils;


/**
 *  @author jf3q.com
 *
 */
public class RandomUntils {

      
     public static String getUpass() {
    	  long upass=0;
    	  String str="";
    	  do{
    		  upass=(long) (Math.random()*100000);
    		  str=upass+"";
    	  }while(upass>0&&str.length()==6);
    	  System.out.println(str);
          return str;
     }
     
    public static void main(String[] args) {
    	RandomUntils.getUpass();
	}

    
      
    
}

