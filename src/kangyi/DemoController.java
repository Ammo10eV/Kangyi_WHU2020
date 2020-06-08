package kangyi;

//package test;
import java.io.BufferedReader;
import java.io.InputStreamReader;
public class DemoController {
   
  public static void main(String[] args) {
      try {
    	  System.out.println("start");
//        int a=20;
//        int b=30;
    	
    		
    			   
    			   
    			    
//        String time1 = "2020-03-22";
//        String choose1 = "1";//	
//        String time2 = "2020-04-11";
//        String choose2 = "2";//
//        String time3 = "2020-06-27";
//        String choose3 = "3";//
        
        String time1 = "null";
        String choose1 = "null";//	
        String time2 = "null";
        String choose2 = "null";//
        String time3 = "null";
        String choose3 = "null";//
       
		 
		 
		 
		
		
       
//        String[] args1=new String[]{"python","C:\\Users\\Thinkpad\\Desktop\\test.py",s};
//        String[] args1=new String[]{"python","C:\\Users\\Thinkpad\\Desktop\\1.py",s};
        String[] args1=new String[]{"python","C:\\Users\\Thinkpad\\eclipse-workspace\\kangyi\\src\\resources\\Spainmodel_forweb.py",time1,choose1,time2,choose2,time3,choose3};
        
        Process pr=Runtime.getRuntime().exec(args1);
         
        BufferedReader in = new BufferedReader(new InputStreamReader(
          pr.getInputStream()));
        String line;
        int i=0;
        while ((line = in.readLine()) != null) {
       
         System.out.println(line);
         i++;
        }
        in.close();
        pr.waitFor();
        System.out.println("end");
        } catch (Exception e) {
         e.printStackTrace();
        }}
  public void test(){
      System.out.println("我的第一个方法C");
  }

}