<%@ page language="java" import="java.util.*, org.liyubo.db.dao.SensorDao" pageEncoding="UTF-8"%>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>时间</th>
					<th>光照量</th>
				</tr>
			</thead>
			<tbody>
			<%
			//调用数据库数据
			SensorDao sensor = new SensorDao();
			List<String[][]> light = sensor.getLight();
			for(String[][] l :light){
			%>
				<tr>
					<td><%=l[0][0] %></td>
					<td><%=l[0][1] %></td>
				</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>

