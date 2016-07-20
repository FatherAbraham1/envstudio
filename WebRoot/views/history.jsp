<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement"%>
<%--创建历史数据显示页面，展示所有历史数据 --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>数据实验室-当日历史</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />
</head>
<body>
	<div class="container-fluid">
		<%@ include file="/statics/dashboard.jsp"%>
		<div class="row">
			<!-- 表部分 -->
			<div class="col-md-9" align="left">
				<div id="histale">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th><center>日期</center></th>
								<th><center>时间</center></th>
								<th><center>光照量</center></th>
								<th><center>空气温度</center></th>
								<th><center>空气湿度</center></th>
								<th><center>土壤温度</center></th>
								<th><center>土壤湿度</center></th>
							</tr>
						</thead>
						<tbody>

							<%
								Class.forName("com.mysql.jdbc.Driver");
								String url = "jdbc:mysql://localhost:3306/field_monitor?user=root&password=19911112&useUnicode=true&characterEncoding=utf8";
								Connection conn = DriverManager.getConnection(url);
								Statement stat = conn.createStatement();
								ResultSet rs = null;
								rs = stat.executeQuery("SELECT * FROM tb_sensorinfo_1 limit 110");

								int intPageSize; //一页显示的记录数
								int intRowCount; //记录的总数
								int intPageCount; //总页数
								int intPage; //待显示的页码
								String strPage;
								int i = 0;
								//设置一页显示的记录数
								intPageSize = 20;
								//取得待显示的页码
								strPage = request.getParameter("page");
								//判断strPage是否等于null,如果是，显示第一页数据
								if (strPage == null) {
									intPage = 1;
								} else {
									//将字符串转换为整型
									intPage = java.lang.Integer.parseInt(strPage);
								}
								if (intPage < 1) {
									intPage = 1;
								}
								//获取记录总数
								rs.last();
								intRowCount = rs.getRow();
								//计算机总页数
								intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
								//调整待显示的页码
								if (intPage > intPageCount)
									intPage = intPageCount;
								if (intPageCount > 0) {
									//将记录指针定位到待显示页的第一条记录上
									rs.absolute((intPage - 1) * intPageSize + 1);
								}
								while (i < intPageSize && !rs.isAfterLast()) {
							%>
							<tr>
								<td align="center"><%=rs.getString(2)%></td>
								<td align="center"><%=rs.getString(3)%></td>
								<td align="center"><%=rs.getString(4)%></td>
								<td align="center"><%=rs.getString(5)%></td>
								<td align="center"><%=rs.getString(6)%></td>
								<td align="center"><%=rs.getString(7)%></td>
								<td align="center"><%=rs.getString(8)%></td>
							</tr>
							<%
								rs.next();
									i++;
								}
								//关闭连接、释放资源
								rs.close();
								stat.close();
								conn.close();
							%>
						</tbody>
					</table>
					<div align="center">
						<nav>
						<ul class="pagination">
							<li><a href="./views/history.jsp?page=1"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
							</li>
							<%
								for (int j = 1; j <= intPageCount; j++) {
							%>
							<li><a href="./views/history.jsp?page=<%=j%>"><%=j%></a></li>
							<%
								}
							%>

							<li><a href="./views/history.jsp?page=<%=intPageCount%>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
							</li>
						</ul>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-md-3"> <iframe name="sinaWeatherTool"
				src="http://weather.news.sina.com.cn/chajian/iframe/weatherStyle40.html?city=%E5%8D%97%E4%BA%AC"
				width="260" height="113" marginwidth="0" marginheight="0" hspace="0"
				vspace="0" frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
</body>
</html>

