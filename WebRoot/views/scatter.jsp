<%@ page language="java" import="java.util.*,org.liyubo.db.dao.*" pageEncoding="UTF-8"%>
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

<title>数据实验室-聚类结果</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<script type="text/javascript" src="js/echarts.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="/statics/dashboard.jsp"%>
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar" align="left">
				<%@ include file="/statics/side-new.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2"
				align="left">
				<div class="panel panel-default">
					<div class="panel-heading"><h4>环境指标聚类结果图</h4></div>
					<div class="panel-body">
						<div id="scatter" style="width: 75%;height:85%;"></div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('scatter'));
			// 指定图表的配置项和数据
			var schema = [ {
				name : 'light',
				index : 1,
				text : 'light'
			}, {
				name : 'temp',
				index : 2,
				text : 'temp'
			}, {
				name : 'humi',
				index : 3,
				text : 'humi'
			}, {
				name : 'soiltemp',
				index : 4,
				text : 'soiltemp'
			}, {
				name : 'soilhumi',
				index : 5,
				text : 'soilhumi'
			}, {
				name : '等级',
				index : 6,
				text : '等级'
			} ];
<%
//处理数据库数据
SourceDao source = new SourceDao();
String result = source.getScatter();
%>
			var rawData = [<%=result%>];

			var CATEGORY_DIM_COUNT = 5;
			var GAP = 1;
			var BASE_LEFT = 5;
			var BASE_TOP = 10;
			var GRID_WIDTH = (100 - BASE_LEFT - GAP) / CATEGORY_DIM_COUNT - GAP;
			var GRID_HEIGHT = (100 - BASE_TOP - GAP) / CATEGORY_DIM_COUNT - GAP;
			var CATEGORY_DIM = 6;
			var SYMBOL_SIZE = 3;

			function retrieveScatterData(data, dimX, dimY) {
				var result = [];
				for ( var i = 0; i < data.length; i++) {
					var item = [ data[i][dimX], data[i][dimY] ];
					item[CATEGORY_DIM] = data[i][CATEGORY_DIM];
					result.push(item);
				}
				return result;
			}

			function generateGrids(option) {
				var index = 0;
				for ( var i = 0; i < CATEGORY_DIM_COUNT; i++) {
					for ( var j = 0; j < CATEGORY_DIM_COUNT; j++) {
						if (CATEGORY_DIM_COUNT - i + j >= CATEGORY_DIM_COUNT) {
							continue;
						}

						option.grid.push({
							left : BASE_LEFT + i * (GRID_WIDTH + GAP) + '%',
							top : BASE_TOP + j * (GRID_HEIGHT + GAP) + '%',
							width : GRID_WIDTH + '%',
							height : GRID_HEIGHT + '%'
						});

						option.brush.xAxisIndex
								&& option.brush.xAxisIndex.push(index);
						option.brush.yAxisIndex
								&& option.brush.yAxisIndex.push(index);

						option.xAxis.push({
							splitNumber : 3,
							position : 'top',
							axisLine : {
								show : j === 0,
								onZero : false
							},
							axisTick : {
								show : j === 0,
								inside : true
							},
							axisLabel : {
								show : j === 0
							},
							type : 'value',
							gridIndex : index,
							scale : true
						});

						option.yAxis.push({
							splitNumber : 3,
							position : 'right',
							axisLine : {
								show : i === CATEGORY_DIM_COUNT - 1,
								onZero : false
							},
							axisTick : {
								show : i === CATEGORY_DIM_COUNT - 1,
								inside : true
							},
							axisLabel : {
								show : i === CATEGORY_DIM_COUNT - 1
							},
							type : 'value',
							gridIndex : index,
							scale : true
						});

						option.series.push({
							type : 'scatter',
							symbolSize : SYMBOL_SIZE,
							xAxisIndex : index,
							yAxisIndex : index,
							data : retrieveScatterData(rawData, i, j)
						});

						option.visualMap.seriesIndex
								.push(option.series.length - 1);

						index++;
					}
				}
			}

			var option = {
				animation : false,
				brush : {
					brushLink : 'all',
					xAxisIndex : [],
					yAxisIndex : [],
					inBrush : {
						opacity : 1
					}
				},
				visualMap : {
					type : 'piecewise',
					categories : [ "原始环境", "ML聚类", "MD聚类" ],
					dimension : CATEGORY_DIM,
					orient : 'horizontal',
					top : 0,
					left : 'center',
					inRange : {
						color : [ '#c23531', '#2f4554', '#61a0a8' ]
					},
					outOfRange : {
						color : '#ddd'
					},
					seriesIndex : [ 0 ]
				},
				tooltip : {
					trigger : 'item'
				},
				parallelAxis : [ {
					dim : 0,
					name : schema[0].text
				}, {
					dim : 1,
					name : schema[1].text
				}, {
					dim : 2,
					name : schema[2].text
				}, {
					dim : 3,
					name : schema[3].text
				}, {
					dim : 4,
					name : schema[4].text
				}, {
					dim : 5,
					name : schema[5].text,
					type : 'category',
					data : [ '0', '1', '2' ]
				} ],
				parallel : {
					bottom : '5%',
					left : '5%',
					height : '31%',
					width : '55%',
					parallelAxisDefault : {
						type : 'value',
						name : '光照聚类',
						nameLocation : 'end',
						nameGap : 20,
						splitNumber : 3,
						nameTextStyle : {
							fontSize : 14
						},
						axisLine : {
							lineStyle : {
								color : '#555'
							}
						},
						axisTick : {
							lineStyle : {
								color : '#555'
							}
						},
						splitLine : {
							show : false
						},
						axisLabel : {
							textStyle : {
								color : '#555'
							}
						}
					}
				},
				grid : [],
				xAxis : [],
				yAxis : [],
				series : [ {
					name : 'parallel',
					type : 'parallel',
					smooth : true,
					lineStyle : {
						normal : {
							width : 1,
							opacity : 0.3
						}
					},
					data : rawData
				} ]
			};

			generateGrids(option);
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
</body>
</html>

