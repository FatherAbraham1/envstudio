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

<title>分析实验室</title>
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
		<div class="jumbotron">
			<h1>Hello, Data Analyser!</h1>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Spark传感云环境数据分析</p>
			<p>
				<a class="btn btn-primary btn-lg" href="views/scatter.jsp"
					role="button">聚类分析室</a>
			</p>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-4" >
				<div class="thumbnail">
					<img src="images/kmeans.jpg" alt="kmeans聚类算法">
					<div class="caption">
						<h3>Spark平台聚类</h3>
						<p>对比原始数据与Kmeans聚类和优化Kmeans聚类结果，基于原始Spark平台。点击进入查看更多详细的图表分析结果。kmeans</p>
						<p>
							<a href="views/scatter.jsp" class="btn btn-primary" role="button">进入</a> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="images/brain.jpg" alt="神经网络算法">
					<div class="caption">
						<h3>神经网络实验</h3>
						<p>神经网络模拟人思维的第二种方式，其特色在于信息的分布式存储和并行协同处理。单个神经元的结构简单，但大量神经元构成的网络系统能实现丰富功能。</p>
						<p>
							<a href="views/404.jsp" class="btn btn-primary" role="button">进入</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="images/netcode.jpg" alt="网络编码实验">
					<div class="caption">
						<h3>网络编码</h3>
						<p>网络编码融合了路由和编码的信息交换技术，核心是在网络中各节点对各条信道上收到的信息进行线性或者非线性的处理，然后转发给下游，中间节点扮演编码器或信号处理器的角色。</p>
						<p>
							<a href="views/netcode.jsp" class="btn btn-primary" role="button">进入</a> 
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

