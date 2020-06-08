package kangyi;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spider.dataFunction;


public class EnterUSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnterUSServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入servlet");
		try {
	         System.out.println("start");
//	         int a=20;
//	         int b=30;
	         String flag = request.getParameter("flag");
	        
	       //获取累计确诊数量——美国
	         dataFunction dF_forDiag=new dataFunction();
	         String[] results=dF_forDiag.getAccumulate("us");
	         request.setAttribute("Cum_diag",results[0]);
	         request.setAttribute("Add_diag",results[1]);
	      
	 		 String time1 = "null";
	 		 String time2 = "null";
	 		 String time3 = "null";
	 		 String choose1 = "null";
	 	
	 		String choose2 = "null";
	 		String choose3 = "null";
	 		 

//	 	
	 			 
//	 	
	 	
	 		

	 		
	 		String[] args1=null;
	 	
	 		args1=new String[]{"python","C:\\Users\\Thinkpad\\eclipse-workspace\\kangyi\\src\\resources\\USmodel_forweb.py",time1,choose1,time2,choose2,time3,choose3};
	
	         Process pr=Runtime.getRuntime().exec(args1);//运行python文件
	          
	         BufferedReader in = new BufferedReader(new InputStreamReader(
	           pr.getInputStream()));
	         String line;
	         int i=0;
	         while ((line = in.readLine()) != null) {
	        	 if(i==0) {
	        		request.setAttribute("result1",line);
	        		
	             }
	        	 else if(i==1) {
		        		request.setAttribute("result2",line);
		          }
	        	 else if(i==2) {
		        		request.setAttribute("result3",line);
		          }
	        	 else if(i==3) {
		        		request.setAttribute("result4",line);
		          }
	        	 else if(i==4) {
		        		request.setAttribute("result5",line);
		          }
	        	 else if(i==5) {
		        		request.setAttribute("result6",line);
		          }
	        	 else if(i==6) {
		        		request.setAttribute("result7",line);
		          }
	        	 else if(i==7) {
		        		request.setAttribute("result8",line);
		          }
	        	 else if(i==8) {
		        		request.setAttribute("result9",line);
		          }
	        	
	          System.out.println(line);
	          i++;
	         }
	         in.close();
	         pr.waitFor();
	         System.out.println("end");
	         
//	         request.getRequestDispatcher("info-model-result.jsp").forward(request, response);
	     
	         request.getRequestDispatcher("predict-easy-US-result.jsp").forward(request, response);
		     
		 		//没写完
	         
	        } catch (Exception e) {
	         e.printStackTrace();
	        }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
//		System.out.println(username+password+password2);
		
		
		}
		
		
	

}
