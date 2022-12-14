<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>회원의 성별과 연령대를 분석</title>
<style>
.panel-heading, .panel-footer {
	background-image: url("asset/image/bgbg5.JPG");
	background-repeat: no-repeat;
	background-size: cover;
}

body {
	background-image: url("asset/image/bgbg5.JPG");
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	height: 100%;
}

/* 네비게이션바 스타일*/
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: rgba(0,24,113,1);
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li b {
	display: block;
	color: rgba(255,181,73,1);
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}


li a:hover {
	background-color: #111;
}

#chart1{
	bottom:20%;
	left:12%;
	background-color :white;
	width: 300px;
	height: 300px;
	position:absolute;
}


</style>
</head>
<body>
<div id="header">
         <ul>
            <li><b>LunchBoxsimulator</b></li>
            <li><a href="GoMain.do"> Main</a></li>
            <li><a href="GoNutrition.do">영양소 및 칼로리</a></li>
            <li><a href="GoAsk.do">자주묻는질문</a></li>
            <li><a href="SelectAll.do">도시락정보공유게시판</a></li>
         </ul>
		</div>


	<%
		response.setCharacterEncoding("UTF-8");
		int countGenderM = (int)session.getAttribute("countGenderM");
		System.out.println(countGenderM);
		int countGenderF = (int)session.getAttribute("countGenderF");
		System.out.println(countGenderF);
		int countGenderMBirth20 = (int)session.getAttribute("countGenderMBirth20");
		System.out.println(countGenderMBirth20);
		int countGenderMBirth30 = (int)session.getAttribute("countGenderMBirth30");
		System.out.println(countGenderMBirth30);
		int countGenderMBirth40 = (int)session.getAttribute("countGenderMBirth40");
		System.out.println(countGenderMBirth40);
		int countGenderMBirth50 = (int)session.getAttribute("countGenderMBirth50");
		System.out.println(countGenderMBirth50);
		int countGenderFBirth20 = (int)session.getAttribute("countGenderFBirth20");
		System.out.println(countGenderFBirth20);
		int countGenderFBirth30 = (int)session.getAttribute("countGenderFBirth30");
		System.out.println(countGenderFBirth30);
		int countGenderFBirth40 = (int)session.getAttribute("countGenderFBirth40");
		System.out.println(countGenderFBirth40);
		int countGenderFBirth50 = (int)session.getAttribute("countGenderFBirth50");
		System.out.println(countGenderFBirth50);
	%>
	<table id="chart1">
		<tr>
			<td><div id="gender" style="width: 500px; height: 500px;"></div><td>
			<td><div id="genderMBirth" style="width: 500px; height: 500px;"></div><td>
			<td><div id="genderFBirth" style="width: 500px; height: 500px;"></div><td>
		</tr>
	</table>
	
	<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']}); 
	google.charts.setOnLoadCallback(drawChart1);
	google.charts.setOnLoadCallback(drawChart2);
	google.charts.setOnLoadCallback(drawChart3);
        function drawChart1() {
        	var GenderMBirth20 = <%=countGenderMBirth20%>;
    		var GenderMBirth30 = <%=countGenderMBirth30%>;
    		var GenderMBirth40 = <%=countGenderMBirth40%>;
    		var GenderMBirth50 = <%=countGenderMBirth50%>;
            var data = new google.visualization.arrayToDataTable([
            	['연령대','명'],
            	['20대',GenderMBirth20],
                ['30대',GenderMBirth30],
                ['40대',GenderMBirth40],
                ['50대',GenderMBirth50]
            ]);
            var opt = {
                    'title':'남자 회원의 연령대별 분포',
            };
            var chart = new google.visualization.PieChart(document.getElementById('genderMBirth'));
            chart.draw(data,opt);
        }
        
        function drawChart2() {
        	var GenderFBirth20 = <%=countGenderFBirth20%>;
            var GenderFBirth30 = <%=countGenderFBirth30%>;
            var GenderFBirth40 = <%=countGenderFBirth40%>;
            var GenderFBirth50 = <%=countGenderFBirth50%>;
            var data = new google.visualization.arrayToDataTable([ 
            	['연령대','명'],
            	['20대',GenderFBirth20],
                ['30대',GenderFBirth30],
                ['40대',GenderFBirth40],
                ['50대',GenderFBirth50]
            ]);
            var opt = {
                    'title':'여자 회원의 연령대별 분포',
            };
            var chart = new google.visualization.PieChart(document.getElementById('genderFBirth'));
            chart.draw(data,opt);
        }
        function drawChart3() {
        	var GenderM = <%=countGenderM%>;
            var GenderF = <%=countGenderF%>;
            var data = new google.visualization.arrayToDataTable([ 
            	['성별','명'],
            	['남자',GenderM],
                ['여자',GenderF]
            ]);
            var opt = {
                    'title':'전체 회원의 성별 분포',
            };
            var chart = new google.visualization.PieChart(document.getElementById('gender'));
            chart.draw(data,opt);
        }
        </script>
</body>
</html>