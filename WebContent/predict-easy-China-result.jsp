    <%@page language="java" contentType="text/html; charset=UTF-8"
            pageEncoding="UTF-8"%>
        <%@page import="java.util.*"%>
        <%@page import="net.sf.json.JSONArray"%>
        <%@page import="net.sf.json.JSONObject"%>
        <%@page import="java.util.Iterator"%>

        <!DOCTYPE html>
        <html lang="zh-CN">
        <head>
        <script language="javascript">
        	<% String Cum_diag=request.getAttribute("Cum_diag").toString();%>
        	<% String Add_diag=request.getAttribute("Add_diag").toString();%>
            <% String result1=request.getAttribute("result1").toString();%>
            <% String result2=request.getAttribute("result2").toString();%>
            <% String result3=request.getAttribute("result3").toString();%>
            <% String result4=request.getAttribute("result4").toString();%>
            <% String result5=request.getAttribute("result5").toString();%>
            <% String result6=request.getAttribute("result6").toString();%>
            <% String result7=request.getAttribute("result7").toString();%>
            <% String result8=request.getAttribute("result8").toString();%>
            <% String result9=request.getAttribute("result9").toString();%>

        var sleep = function(time) {
        var startTime = new Date().getTime() + parseInt(time, 10);
        while(new Date().getTime() < startTime) {}
        };

        function aaa(){
        alert("模型正在演算中");
        sleep(5000);
        document.getElementById("myimage1").src="<%=request.getContextPath()%>/images/<%=result9 %>";
        document.getElementById("myimage2").src="<%=request.getContextPath()%>/images/<%=result9 %>";
        document.execCommand('Refresh');
        alert("模型演算成功(若图片未显示请手动刷新)");
        }
        </script>

        <meta charset="UTF-8">
        <!--IE8开启标准渲染模式-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--定义视窗，页面缩放比1：1，禁止用户缩放-->
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
        <title>实用版预测</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/adjust.css">
        </head>
        <body onload="aaa()">
        <!--导航栏-->
        <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
        <!--小屏幕导航按钮和logo-->
        <!--可以适应设备-->
        <div class="navbar-header">
        <!--给这个button绑定到navbar-collapse类-->
        <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
        <a href="index.html" class="navbar-brand">战疫助手> 实用版预测</a>
        </div>
        <!--小屏幕导航按钮和logo-->

        <!--右上角导航-->
        <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
        <li><a href="index.html">首页</a></li>
        <li><a href="infection.jsp" target="_blank">疫情数据</a></li>
        <li><a href="news.html" target="_blank">舆情数据</a></li>
        <li><a href="EnterChinaServlet?flag=1" target="_blank">实用版预测</a></li>
        <li><a href="predict-pro.html" target="_blank">专业版预测</a></li>
        </ul>
        </div>
        <!--右上角导航-->
        </div>
        </nav>
        <!--导航栏-->

        <!--搜索部分-实用版-->
        <div class="bg">
        <div class="filter">
        <section id="easy">
        <div class="container" style="margin-top: 70px;">
        <div class="title" style="margin-top: 30px;">
        疫情数据预测（当前状况下）
        </div>
        <p style="margin-left: 40px;">疫情数据预测由武汉大学信息管理学院XX团队推出，以官方公布历史数据为基础，引入医疗隔离和大众防疫因素，以智能AI算法预测确诊病例数量的变化趋势。</p>
        </div>
        <div class="container">
        <div class="row">
        <div class="col-md-1"></div>

        <div class="col-md-6" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        严格管控
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterChinaServlet?flag=1">
        <button type="button" class="btn btn-primary">中国</button>
        </a>
        </div>
        <div class="btn-group" role="group">
        <a href="EnterKoreanServlet?flag=1">
        <button type="button" class="btn btn-default">韩国</button>
        </a>
        </div>
        <div class="btn-group" role="group">
        <a href="EnterItalyServlet?flag=1">
        <button type="button" class="btn btn-default">意大利</button>
        </a>

        </div>
        </div>
        </div>
        <div class="col-md-2" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        消极应对
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterUSServlet?flag=1">
        <button type="button" class="btn btn-default">美国</button>
        </a>

        </div>
        </div>
        </div>
        <div class="col-md-2" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        大规模检测
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterSpainServlet?flag=1">
        <button type="button" class="btn btn-default">西班牙</button>
        </a>
        </div>
        </div>
        </div>
        <div class="col-md-1"></div>
        </div>
        </div>
        <div class="container" style="margin-top: 10px">
        <!--累计确诊、本日预测、明日预测-->
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-2 fill" style="margin-left: 15px">
        <h4 style="color: darkred"><%=Cum_diag%></h4>
        <h3>累计确诊</h3>
        <p>较昨日：<span style="color: darkred"><%=Add_diag%></span></p>
        </div>

        <div class="col-md-2 fill">
        <h4  style="color: orange"><%=result5%></h4>
        <h3>本日预测</h3>
        <p>较昨日：<span style="color: orange"><%=result6%></span></p>
        </div>

        <div class="col-md-2 fill">
        <h4  style="color: red"><%=result7%></h4>
        <h3>明日预测</h3>
        <p>较今日：<span style="color: red"><%=result8%></span></p>
        </div>

        <div class="col-md-3"></div>
        </div>
        <!--此处放图片-->
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
        <img id="myimage1" src="<%=request.getContextPath()%>/images/<%=result9 %>" style="margin-left: 15px;margin-top: 20px;width: 554px; height: 419px;">
        </div>
			<div class="col-md-2">
            <div style="margin-top: 50px; text-align: center; border-width:1px; border-style: solid; border-radius:5px;border-color: black;">
            <p style="margin:5px;">中国模型从2019年12月08日开始预测（即这天为第0天）</p>
            </div>
            <div style="margin-top: 10px; text-align: center; border-width:1px; border-style: solid; border-radius:5px;border-color: black;">
            <p style="margin:5px;">预测确诊人数顶峰在:<br>第<%=result1%>天</p>
            <p style="margin:5px;">预测最多确诊人数为:<br><%=result2%>人</p>
            </div>
            <div style="margin-top: 10px; text-align: center; border-width:1px; border-style: solid; border-radius:5px;border-color: black;">
            <p style="margin:5px;">预测无症状患者数顶峰在:<br>第<%=result3%>天</p>
            <p style="margin:5px;">预测最多无症状患者数为:<br><%=result4%>人</p>
            </div>
			</div>
	  
	  
        <div class="col-md-1"></div>
        </div>
        </div>


        <!--干预措施模拟预测-->
        <div class="container" style="margin-top: 5px;">
        <div class="title" style="margin-top: 30px;">
        干预措施模拟预测
        </div>
        </div>

        <div class="container">
        <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
        <!--这个表单需要传输数据-->
        <form action="EasymodelServlet" method="post" >
        <div class="form-inline">
        <!--干预措施一-->
        <div class="form-group">
        <h5 style="font-weight: bold;">干预措施一</h5>
        <label for="time1" style="font-weight: normal;">干预时间：</label>
        <input id="time1" type="date" placeholder="输入干预时间" class="form-control" name="time1"/>
        <br>

        <label for="cuoshi1" style="font-weight: normal; margin-top: 5px;">采取措施：</label>
        <select id="cuoshi1" class="form-control" name="choose1">
        <option value="1">采取严厉防控措施（如封城、封路、限制出行）</option>
        <option value="2">召开新闻发布会，说明疫情进展信息</option>
        <option value="3">采取较严厉防控措施（停课、公共场所关闭、隔离）</option>
        <option value="4">隐瞒实情，号召民众不佩戴口罩</option>
        </select>
        </div>
        <!--干预措施二-->
        <div class="form-group" style="margin-top: 20px;">
        <h5 style="font-weight: bold;">干预措施二</h5>
        <label for="time2" style="font-weight: normal;">干预时间：</label>
        <input id="time2" type="date" placeholder="输入干预时间" class="form-control" name="time2"/>
        <br>

        <label for="cuoshi2" style="font-weight: normal; margin-top: 5px;">采取措施：</label>
        <select id="cuoshi2" class="form-control" name="choose2">
        <option value="1">采取严厉防控措施（如封城、封路、限制出行）</option>
        <option value="2">召开新闻发布会，说明疫情进展信息</option>
        <option value="3">采取较严厉防控措施（停课、公共场所关闭、隔离）</option>
        <option value="4">隐瞒实情，号召民众不佩戴口罩</option>
        </select>
        </div>
        <!--干预措施三-->
        <div class="form-group" style="margin-top: 20px;">
        <h5 style="font-weight: bold;">干预措施三</h5>
        <label for="time3" style="font-weight: normal;">干预时间：</label>
        <input id="time3" type="date" placeholder="输入干预时间" class="form-control" name="time3"/>
        <br>

        <label for="cuoshi3" style="font-weight: normal; margin-top: 5px;">采取措施：</label>
        <select id="cuoshi3" class="form-control" name="choose3">
        <option value="1">采取严厉防控措施（如封城、封路、限制出行）</option>
        <option value="2">召开新闻发布会，说明疫情进展信息</option>
        <option value="3">采取较严厉防控措施（停课、公共场所关闭、隔离）</option>
        <option value="4">隐瞒实情，号召民众不佩戴口罩</option>
        </select>
        </div>
        <input type="hidden" name="pagename" value="China" >



        <div style="margin-top: 10px; text-align: right;">
        <input type="submit" class="form-control btn-primary" value="开始预测"/>
        </div>
        </div>

        </form>


        </div>

        <div class="col-md-3" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        严格管控
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterChinaServlet?flag=1">
        <button type="button" class="btn btn-primary">中国</button>
        </a>
        </div>
        <div class="btn-group" role="group">
        <a href="EnterKoreanServlet?flag=1">
        <button type="button" class="btn btn-default">韩国</button>
        </a>
        </div>
        <div class="btn-group" role="group">
        <a href="EnterItalyServlet?flag=1">
        <button type="button" class="btn btn-default">意大利</button>
        </a>

        </div>
        </div>
        </div>
        <div class="col-md-1" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        消极应对
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterUSServlet?flag=1">
        <button type="button" class="btn btn-default">美国</button>
        </a>

        </div>
        </div>
        </div>
        <div class="col-md-2" style="text-align: center; box-shadow: 1px 1px 4px rgba(3,3,19,0.25);">
        <h5 style="font-weight: bold;">
        大规模检测
        </h5>
        <div class="btn-group btn-group-justified" role="group" style="margin-bottom: 5px;">
        <div class="btn-group" role="group">
        <a href="EnterSpainServlet?flag=1">
        <button type="button" class="btn btn-default">西班牙</button>
        </a>
        </div>
        </div>
        </div>

        <div class="col-md-6">
        <img id="myimage2" src="<%=request.getContextPath()%>/images/<%=result9 %>" style="margin-left: 15px; margin-top: 20px; margin-bottom: 20px;width: 554px; height: 419px;">
        </div>
        <div class="col-md-1">
        </div>
        </div>
        </div>
        </section>
        </div>
        </div>


        <!--footer底部区域-->
        <footer>
        <div class="container">
        <div class="row">
        <div class="col-md-12">
        <p>©copyright&nbsp;2020&nbsp;武汉大学信息管理学院</p>
        </div>
        </div>
        </div>
        </footer>
        <!--footer底部区域-->


        <!--jquery一定要比bootstrap先引入！-->
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        </body>
        </html>