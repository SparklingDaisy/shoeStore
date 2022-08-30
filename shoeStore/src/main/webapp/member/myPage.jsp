<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoe.bbs.*" %>


<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

<%@include file="memberSid.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	
	window.onload=function(){

			document.getElementById('tap1').style.display = 'none';
			document.getElementById('tap2').style.display = 'none';
			document.getElementById('tap3').style.display = 'none';
			document.getElementById('tap4').style.display = 'none';
			document.getElementById('tap5').style.display = 'none';
			document.getElementById('tap6').style.display = 'none';
	}

	function show(i){
		for(var z=1; z<=6; z++){
			document.getElementById('tap'+z).style.display='none';
		}
		
		document.getElementById('tap'+i).style.display='block';
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">
				<div class="my_menu">
					<ul>
						<li><a href="myPage.jsp"><div>마이페이지</div></a></li>
						<li><a href="#" onclick="show(1)"><div>장바구니</div></a></li>
						<li><a href="#" onclick="show(2)"><div>구매내역</div></a></li>
						<li><a href="#" onclick="show(3)"><div>나의 등급</div></a></li>
						<li><a href="#" onclick="show(4)"><div>나의 질문</div></a></li>
						<li><a href="#" onclick="show(5)"><div>회원정보변경</div></a></li>
						<li><a href="#" onclick="show(6)"><div>회원탈퇴</div></a></li>
					</ul>
				</div>
				<div class="my_main">
					<div id="tap1"><%@include file="myBasket.jsp" %></div>
					<div id="tap2"><%@include file="myHistory.jsp" %></div>
					<div id="tap3"><%@include file="myTier.jsp" %></div>
					<div id="tap4"><%@include file="myWrite.jsp" %></div>
					<div id="tap5"><%@include file="memberInfo.jsp" %></div>
					<div id="tap6"><%@include file="myResign.jsp" %></div>
				</div>
	
		<div class="my_bot"></div>
	</section>
</section>

</body>
<%@include file="/footer.jsp" %>
</html>