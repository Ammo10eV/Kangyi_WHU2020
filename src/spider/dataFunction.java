package spider;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import com.mysql.jdbc.Connection;

public class dataFunction {
	public static Connection conn = null;  
	public static int count=0;//注意，每次使用之前都要初始化为0！！！
	
	public dataFunction() {

		String URL="jdbc:mysql://localhost:3306/covid_19?useUnicode=true&characterEncoding=utf-8&useSSL=false";//数据库连接字符串test1是要替换的东西--数据库库名（比表高一级） 
		
	  String NAME="root";//登录名    
		String PASSWORD="";//密码

			try {  
		      Class.forName("com.mysql.jdbc.Driver");  //启动driver
		  } catch (ClassNotFoundException e) {  
		      System.out.println("未能成功加载驱动程序，请检查是否导入驱动程序！");  
		                  //添加一个println，如果加载驱动异常，检查是否添加驱动，或者添加驱动字符串是否错误  
		      e.printStackTrace();  
		  }  
		
		  try {  
		      conn = (Connection) DriverManager.getConnection(URL, NAME, PASSWORD);  //构建链接connection
		      System.out.println("获取数据库连接成功！");  
		  } catch (SQLException e) {  
		      //System.out.println("获取数据库连接失败！");  
		                   //添加一个println，如果连接失败，检查连接字符串或者登录名以及密码是否错误  
		      e.printStackTrace();  
		  }
		  
	}
	public void add(String date, String country, String diagnosis, String death, String cure) throws SQLException{
		PreparedStatement ptmt2=null;
		
		java.sql.Date Date=java.sql.Date.valueOf(date);
		String Country=country;
		int Diagnosis=Integer.parseInt(diagnosis);
		int Death=Integer.parseInt(death);
		int Cure=Integer.parseInt(cure);
		
		String sql="insert into "+Country+"(date,Cumulative_diagnosis,Cumulative_death,Cumulative_cure) VALUES (\""+Date+"\","+Diagnosis+","+Death+","+Cure+")";
		System.out.println(sql);
		ptmt2 = conn.prepareStatement(sql);//准备语句

	    
	    ptmt2.executeUpdate();//更新，一定要
	    System.out.println("done");
	    conn.close();
	}
	public String[] getAccumulate(String country) throws SQLException{
		String sql1=null;
		String sql2=null;
		PreparedStatement ptmt1=null;
		PreparedStatement ptmt2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		String result1=null;
		String result2=null;
		
		/*获取当前日期和前一天的日期*/
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date result = new Date();
		String date= format.format(result);
		System.out.println(date);
		String yesterday =format.format(new Date(result.getTime() - 24 * 60 * 60 * 1000));
        System.out.println(yesterday);
        
		sql1="SELECT Cumulative_diagnosis from "+ country +" where date=\""+date+"\"";
		System.out.println(sql1);
		ptmt1 = conn.prepareStatement(sql1);//准备语句
		rs1=ptmt1.executeQuery();
		final StringBuilder builder = new StringBuilder();
		while( rs1.next() ) {
		    builder.append( rs1.getString(1));
		}
		result1 = builder.toString();
		System.out.println(result1);
		
		sql2="SELECT Cumulative_diagnosis from "+ country +" where date=\""+yesterday+"\"";
		System.out.println(sql2);
		ptmt2 = conn.prepareStatement(sql2);//准备语句
		rs2=ptmt2.executeQuery();
		final StringBuilder builder2 = new StringBuilder();
		while( rs2.next() ) {
		    builder2.append( rs2.getString(1));
		}
		result2 = builder2.toString();
		System.out.println(result2);
		
		int addcount = Integer.parseInt(result1)-Integer.parseInt(result2);
	    System.out.println(addcount);
	    conn.close();
	    
	    String results[] = {result1,String.valueOf(addcount)};
	    return results;
	}
}

