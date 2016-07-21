package org.liyubo.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SourceDao {
	public String getScatter() throws Exception
	{
		List<String> scatter = new ArrayList<String>();
		//数据库用户名 
		String userName="root"; 
		//密码 
		String userPasswd="19911112"; 
		//数据库名 
		String dbName="field_monitor"; 
				
		//拼接sql
		String sql = "select * from scatter";
		
		//联结字符串 
		String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection connection=DriverManager.getConnection(url); 
		Statement statement = connection.createStatement(); 		
		ResultSet rs = statement.executeQuery(sql);
		
		
		while(rs.next()){
			String l = "["+rs.getString(1)+","+ rs.getString(2)+","+ rs.getString(3)+","+ rs.getString(4)+","+ rs.getString(5)+",\""+ rs.getString(6)+"\",\""+ rs.getString(7)+"\"]";
			scatter.add(l);
		}
		
		rs.close();
		statement.close();
		connection.close();
		String result = "";
		for(String s : scatter){
//			System.out.println(s);
			result = result + s +",";
		}
		String res = result.substring(0,result.length()-1);
		
		return res;
	}
	
//	public static void main(String[] args) throws Exception {
//		String scatter = getScatter();
//		System.out.println(scatter);
//	}
}
