package org.liyubo.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GraSensorDao {
	//返回List<String[][]>---光照
	public String[] getLight() throws Exception
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
		String sql = "select time,max(light) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time limit 60";
		
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
		String[] relight= {"",""};
		//拼接成数据格式
		for(String[][] l:light){
			relight[0] = relight[0] + "'" +l[0][0] + "',";
			relight[1] = relight[1] + "'" +l[0][1] + "',";
		}
		relight[0] = relight[0].substring(0, relight[0].length()-1);
		relight[1] = relight[1].substring(0, relight[1].length()-1);
		return relight;
	}
	
	
	//返回List<String[][]>---空气温度
		public String[] getTemp() throws Exception
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
			String sql = "select time,max(temp) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time limit 60";
			
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
			String[] retemp= {"",""};
			//拼接成数据格式
			for(String[][] l:temp){
				retemp[0] = retemp[0] + "'" +l[0][0] + "',";
				retemp[1] = retemp[1] + "'" +l[0][1] + "',";
			}
			retemp[0] = retemp[0].substring(0, retemp[0].length()-1);
			retemp[1] = retemp[1].substring(0, retemp[1].length()-1);
			return retemp;
		}
		
		
		//返回List<String[][]>---空气湿度
		public String[] getHumi() throws Exception
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
			String sql = "select time,max(humi) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time limit 60";
			
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
			String[] rehumi= {"",""};
			//拼接成数据格式
			for(String[][] l:humi){
				rehumi[0] = rehumi[0] + "'" +l[0][0] + "',";
				rehumi[1] = rehumi[1] + "'" +l[0][1] + "',";
			}
			rehumi[0] = rehumi[0].substring(0, rehumi[0].length()-1);
			rehumi[1] = rehumi[1].substring(0, rehumi[1].length()-1);
			return rehumi;
		}
		
		
		//返回List<String[][]>---土壤温度
		public String[] getSoilTemp() throws Exception
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
			String sql = "select time,max(soiltemp) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time limit 60";
			
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
			String[] resoiltemp= {"",""};
			//拼接成数据格式
			for(String[][] l:soiltemp){
				resoiltemp[0] = resoiltemp[0] + "'" +l[0][0] + "',";
				resoiltemp[1] = resoiltemp[1] + "'" +l[0][1] + "',";
			}
			resoiltemp[0] = resoiltemp[0].substring(0, resoiltemp[0].length()-1);
			resoiltemp[1] = resoiltemp[1].substring(0, resoiltemp[1].length()-1);
			return resoiltemp;
		}
		
		
		//返回List<String[][]>---土壤湿度
		public String[] getSoilHumi() throws Exception
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
			String sql = "select time,max(soilhumi) from tb_sensorinfo_1 where date = '2015-5-12' group by time order by time limit 60";
			
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
			String[] resoilhumi= {"",""};
			//拼接成数据格式
			for(String[][] l:soilhumi){
				resoilhumi[0] = resoilhumi[0] + "'" +l[0][0] + "',";
				resoilhumi[1] = resoilhumi[1] + "'" +l[0][1] + "',";
			}
			resoilhumi[0] = resoilhumi[0].substring(0, resoilhumi[0].length()-1);
			resoilhumi[1] = resoilhumi[1].substring(0, resoilhumi[1].length()-1);
			return resoilhumi;
		}
	
}
