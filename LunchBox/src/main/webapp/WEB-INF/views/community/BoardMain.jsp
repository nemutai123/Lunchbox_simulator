<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.pagination a {
   color: black;
   float: left;
   padding: 8px 16px;
   text-decoration: none;
   transition: background-color .3s;
}

.pagination a.active {
   background-color: dodgerblue;
   color: red;
}

.pagination a:hover:not(.active) {
   color: orange;
}

body{
   background-image: url("asset/image/bgbg5.JPG");
   background-repeat: no-repeat;
   background-size: cover;
}
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

h1{
    font-size : 50px;
}

#textline :hover{
   background-color: #A9D0F5

}
th{
   text-align: center;
}

.mbid{
   text-align : center;
}
.date{
   text-align : center;
}
.click{
   text-align : center;
}
.like{
   text-align : center;
}
h3{
   text-align : center;
}
</style>
</head>
<body>
      <div id="header">
         <ul>
            <li><b>LunchBoxsimulator</b></li>
            <li><a href="GoMain.do"> Main</a></li>
            <li><a href="GoNutrition.do">????????? ??? ?????????</a></li>
            <li><a href="GoAsk.do">??????????????????</a></li>
            <li><a href="SelectAll.do">??????????????????????????????</a></li>
         </ul>


      </div>
   <div class="container">
      <div class="panel panel-default">
         <div class="panel-heading" align="center">
      <h1>?????? ????????? ???????????? ???????????? ??????????????????!</h1>
      <h2>????????? ?????????</h2>
         </div>
         <div class="panel-body">
            <table class="table table-striped table-hover">
               <colgroup>
                  <col width="45%">
                  <col width="15%">
                  <col width="20%">
                  <col width="8%">
                  <col width="8%">
               </colgroup>
               <tr>
                  <th>??????</th>
                  <th>?????????</th>
                  <th>?????????</th>
                  <th>?????????</th>
                  <th>?????????</th>
               </tr>

               <!-- el???????????? ???????????? scope????????? ??????????????? ??? ???????????? ?????? ????????? ??? ??????. -->
               <c:forEach var="board" items="${list2}">
                  <tr id="textline" onclick='location.href="UpdateRead.do?article_seq=${board.article_seq}&article_cnt=${board.article_cnt}&article_file=${board.article_file}"' style="cursor: pointer;">
                     <td>${board.article_title}</td>
                     <td class = mbid>${board.mb_id}</td>
                     <td class = date>${board.article_date}</td>
                     <td class = click>${board.article_cnt}</td>
                     <td class = like>${board.article_likes}</td>
                  </tr>
               </c:forEach>


               <tr>
                  <td colspan="5" align="right">
                     <button onclick="location.href='GoInsert.do'"
                        class="btn btn-primary btn-sm" id="write">?????????</button>
                  </td>
               </tr>

            </table>
         </div>
         <!-- a?????? ??????????????? ?????? ????????? ?????????? -->
         <div  align="center">
         <div class="pagination">
            <a href="#">&laquo;</a>
            <c:forEach begin="1" end="${sum}" var="i">
               <a href="SelectAll.do?page=${i}">${i}</a>
            </c:forEach>
            <a href="SelectAll.do?page=${i+1}">&raquo;</a>

         </div>
         </div>


         <div class="panel-footer">

            <h3>????????? ????????? TOP 3</h3>
            <table class="table table-striped table-hover">
            <colgroup>
                  <col width="60%">
                  <col width="25%">
                  <col width="15%">
                  </colgroup>
               <tr>
                  <th>??????</th>
                  <th>?????????</th>
                  <th>?????????</th>
               </tr>
               <c:forEach var="board" items="${list3}">
                  <tr id="textline" onclick='location.href="SelectOne.do?article_seq=${board.article_seq}"' style="cursor: pointer;">

                     <td>${board.article_title}</td>
                     <td class = date>${board.article_date}</td>
                     <td class = like>${board.article_likes}</td>

                  </tr>
               </c:forEach>
            </table>
         </div>
      </div>
   </div>

</body>
</html>