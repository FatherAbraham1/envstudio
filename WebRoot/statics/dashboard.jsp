<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
		<%--导航条 --%>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-
					toggle="collapse" data-target="#navbar" aria-expanded="false" aria-
					controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="views/light.jsp">Spark环境数据分析</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="views/light.jsp">实时环境</a>
					</li>
					<li><a href="views/history.jsp">历史数据</a>
					</li>
					<li><a href="views/lab.jsp">实验室</a>
				</ul>
			</div>
		</div>
	</nav>