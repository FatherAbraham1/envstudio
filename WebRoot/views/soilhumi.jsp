<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>数据实验室-土壤湿度</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />

</head>
<body>
	<%--引入导航条 --%>
	<%@include file="../statics/dashboard.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<%--引入侧边栏 --%>
				<%@include file="../statics/side.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-7 col-md-offset-2 main">
				<h2 class="page-header">实时土壤湿度图</h2>
				<div id="">
					<%@include file="../statics/grsoilhumi.jsp"%>
				</div>
			</div>
			<div class="col-sm-3 col-lg-2">
				<h3 class="sub-header">实时土壤湿度数据</h3>
				<div id="tbsoilhumi">
					<%@include file="../statics/tbsoilhumi.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		  setInterval(function(){$.get('statics/tbsoilhumi.jsp',function(a){$("#tbsoilhumi").html(a)})},1115000)
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
		  setInterval(function(){$.get('statics/grsoilhumi.jsp',function(a){$("#grsoilhumi").html(a)})},1115000)
		});
	</script>
</body>
</html>