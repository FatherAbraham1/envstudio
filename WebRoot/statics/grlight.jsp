<%@ page language="java" import="java.util.*,org.liyubo.db.dao.*" pageEncoding="UTF-8"%>
<script src="js/echarts.min.js"></script>
<div id="graphlight" style="width: 90%;height:70%;"></div>
<%
	GraSensorDao gra = new GraSensorDao();
	String[] gralight = gra.getLight();
%>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('graphlight'));

		// 指定图表的配置项和数据
		option = {
			title : {
				text : '实时光照量',
				subtext : '传感云'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '光照' ]
			},
			toolbox : {
				show : true,
				feature : {
					dataZoom : {
						yAxisIndex : 'none'
					},
					dataView : {
						readOnly : false
					},
					magicType : {
						type : [ 'line', 'bar' ]
					},
					restore : {},
					saveAsImage : {}
				}
			},
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ <%=gralight[0]%> ]
			},
			yAxis : {
				type : 'value',
				axisLabel : {
					formatter : '{value} Lex'
				}
			},
			series : [ {
				name : '光照',
				type : 'line',
				data : [<%=gralight[1]%>],
				markPoint : {
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					} ]
				}
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
