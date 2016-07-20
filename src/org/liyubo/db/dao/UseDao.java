package org.liyubo.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UseDao {
	public String getPassword(String user) throws Exception
	{
		//数据库用户名 
		String userName="root"; 
		//密码 
		String userPasswd="19911112"; 
		//数据库名 
		String dbName="field_monitor"; 
		//表名 
		String tableName="user"; 
		
		//拼接sql
		String sql = "select password from user where username = '"+user+"'";
		
		//联结字符串 
		String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection connection=DriverManager.getConnection(url); 
		Statement statement = connection.createStatement(); 		
		ResultSet rs = statement.executeQuery(sql);
		String pass = null;
		while(rs.next()){
			pass = rs.getString(1);
		}
		
		rs.close();
		statement.close();
		connection.close();
		return pass;
	}
	
}
