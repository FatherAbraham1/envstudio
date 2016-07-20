package org.liyubo.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SensorDao {
	//返回List<String[][]>---光照
	public List<String[][]> getLight() throws Exception
	{
		List<String[][]> light = new ArrayList<String[][]>();
		//数据库用户名 
		String userName="root"; 
		//密码 
		String userPasswd="19911112"; 
		//数据库名 
		String dbName="field_monitor"; 
		//表名 
		String tableName="tb_sensorinfo_1"; 
		
		//拼接sql
		String sql = "select time,max(light) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time DESC limit 20";
		
		//联结字符串 
		String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		Connection connection=DriverManager.getConnection(url); 
		Statement statement = connection.createStatement(); 		
		ResultSet rs = statement.executeQuery(sql);
		
		
		while(rs.next()){
			String [][] l = {{"0","0"}};
			l[0][0] = rs.getString(1);
			l[0][1] = rs.getString(2);
			light.add(l);
		}
		
		rs.close();
		statement.close();
		connection.close();
		return light;
	}
	
	//返回List<String[][]>---光照
		public List<String[][]> getTemp() throws Exception
		{
			List<String[][]> temp = new ArrayList<String[][]>();
			//数据库用户名 
			String userName="root"; 
			//密码 
			String userPasswd="19911112"; 
			//数据库名 
			String dbName="field_monitor"; 
			//表名 
			String tableName="tb_sensorinfo_1"; 
			
			//拼接sql
			String sql = "select time,max(temp) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time DESC limit 20";
			
			//联结字符串 
			String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection connection=DriverManager.getConnection(url); 
			Statement statement = connection.createStatement(); 		
			ResultSet rs = statement.executeQuery(sql);
			
			
			while(rs.next()){
				String [][] l = {{"0","0"}};
				l[0][0] = rs.getString(1);
				l[0][1] = rs.getString(2);
				temp.add(l);
			}
			
			rs.close();
			statement.close();
			connection.close();
			return temp;
		}
		
		//返回List<String[][]>---光照
		public List<String[][]> getHumi() throws Exception
		{
			List<String[][]> humi = new ArrayList<String[][]>();
			//数据库用户名 
			String userName="root"; 
			//密码 
			String userPasswd="19911112"; 
			//数据库名 
			String dbName="field_monitor"; 
			//表名 
			String tableName="tb_sensorinfo_1"; 
			
			//拼接sql
			String sql = "select time,max(humi) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time DESC limit 20";
			
			//联结字符串 
			String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection connection=DriverManager.getConnection(url); 
			Statement statement = connection.createStatement(); 		
			ResultSet rs = statement.executeQuery(sql);
			
			
			while(rs.next()){
				String [][] l = {{"0","0"}};
				l[0][0] = rs.getString(1);
				l[0][1] = rs.getString(2);
				humi.add(l);
			}
			
			rs.close();
			statement.close();
			connection.close();
			return humi;
		}
		
		//返回List<String[][]>---光照
		public List<String[][]> getSoilTemp() throws Exception
		{
			List<String[][]> soiltemp = new ArrayList<String[][]>();
			//数据库用户名 
			String userName="root"; 
			//密码 
			String userPasswd="19911112"; 
			//数据库名 
			String dbName="field_monitor"; 
			//表名 
			String tableName="tb_sensorinfo_1"; 
			
			//拼接sql
			String sql = "select time,max(soiltemp) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time DESC limit 20";
			
			//联结字符串 
			String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection connection=DriverManager.getConnection(url); 
			Statement statement = connection.createStatement(); 		
			ResultSet rs = statement.executeQuery(sql);
			
			
			while(rs.next()){
				String [][] l = {{"0","0"}};
				l[0][0] = rs.getString(1);
				l[0][1] = rs.getString(2);
				soiltemp.add(l);
			}
			
			rs.close();
			statement.close();
			connection.close();
			return soiltemp;
		}
		
		//返回List<String[][]>---光照
		public List<String[][]> getSoilHumi() throws Exception
		{
			List<String[][]> soilhumi = new ArrayList<String[][]>();
			//数据库用户名 
			String userName="root"; 
			//密码 
			String userPasswd="19911112"; 
			//数据库名 
			String dbName="field_monitor"; 
			//表名 
			String tableName="tb_sensorinfo_1"; 
			
			//拼接sql
			String sql = "select time,max(soilhumi) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time DESC limit 20";
			
			//联结字符串 
			String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf8"; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection connection=DriverManager.getConnection(url); 
			Statement statement = connection.createStatement(); 		
			ResultSet rs = statement.executeQuery(sql);
			
			
			while(rs.next()){
				String [][] l = {{"0","0"}};
				l[0][0] = rs.getString(1);
				l[0][1] = rs.getString(2);
				soilhumi.add(l);
			}
			
			rs.close();
			statement.close();
			connection.close();
			return soilhumi;
		}
}
