<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

    
<%
	String sid=(String)session.getAttribute("sid"); //세션은 오브젝트 이므로 다운캐스팅 필수
	if(sid==null){
		
		%>
		<script>
			window.alert('로그인 후 이용가능합니다.');
			window.location.href="/shoeStore";
		</script>
		<%
		return; //조건을 쓸 때 밑에 밑에 있는 자바코드가 먼저 번역될 수 있으므로 우선 리턴으로 끊어줌
	}

	Shoe_memberDTO dto=mdao.myInfo(sid);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
  .tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
  .tab_menu .list .btn{font-size:13px;}
  .tab_menu .cont_area .cont{position:absolute; top:25px; left:0; background:#555; color:#fff; text-align:center; width:250px; height:100px; line-height:100px;}
</style>
<script>
function show(){ 

	document.getElementById("test_div1").style.display = "none"; 




</script>


</head>
<body>
<%@include file="/header.jsp" %>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">
				<div class="my_menu">
					<ul class="list">
						<li class="turn_on"><a href="#tab1" class="btn" onclick="show();"><div>마이페이지</div></a></li>
						<li><a href="#tab2" class="btn" onclick="show(2)"><div>장바구니</div></a></li>
						<li><a href="#tab3" class="btn"><div>구매내역</div></a></li>
						<li><a href="#tab4" onclick="tabView(3)"><div>나의 등급</div></a></li>
						<li><a href="#tab5" onclick="tabView(4)"><div>나의 질문</div></a></li>
						<li><a href="#tab6" onclick="tabView(5)"><div>회원정보변경</div></a></li>
						<li><a href="#tab7" onclick="tabView(6)"><div>회원탈퇴</div></a></li>
					</ul>
				</div>
				<div class="my_menu">
				<div style="border: 1px solid" id="test_div1">내용입니다.11</div>
				</div>
	</body>
</html>