<%@ page language="java" import="java.util.*, org.liyubo.db.dao.SensorDao" pageEncoding="UTF-8"%>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>时间</th>
					<th>土壤湿度</th>
				</tr>
			</thead>
			<tbody>
			<%
			//调用数据库数据
			SensorDao sensor = new SensorDao();
			List<String[][]> soilhumi = sensor.getSoilHumi();
			for(String[][] l :soilhumi){
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

