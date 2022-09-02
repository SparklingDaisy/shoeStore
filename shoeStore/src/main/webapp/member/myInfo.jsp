<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.shoe.member.*" %>

<%@ page import="com.shoe.bbs.*" %>


<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	
	var pwidth=400;
	var pheight=600;

	var popupX=(window.screen.width/2)-(pwidth/2);
	var popupY=(window.screen.height/2)-(pheight/2);
	function payGo(){
		window.open('/shoeStore/payInfo/payPopup.jsp','충전','width='+pwidth+',height='+pheight+',left='+popupX+',top='+popupY);
	}

</script>
</head>
<body>
<%@include file="memberSid.jsp" %>
<%@include file="/header.jsp" %>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">
				<div class="my_menu">
				<h1><br><a href="myPage.jsp">마이페이지</a></h1>
					<div class="my_menu_in">
							<ul>
								<li><a href="/shoeStore/item/itemCart.jsp"><div>장바구니</div></a></li>
								<li><a href="/shoeStore/item/itemCart.jsp"><div>구매내역</div></a></li>
								<li><a href="/shoeStore/member/myTier.jsp"><div>나의 등급</div></a></li>
								<li><a href="/shoeStore/member/myWrite.jsp"><div>나의 질문</div></a></li>
								<li><a href="/shoeStore/member/memberInfo.jsp"><div>회원정보변경</div></a></li>
							</ul>
					</div>
					<div>
					</div>
				</div>
				<div class="my_main">
					<div class="myInfo_main">
						<div class="myInfo1">
							<table class="myinfotable1">
								<tr>
									<td><%=sname %>님</td><td><button>내정보관리</button></td>
								</tr>
								<tr>
									<td>이메일</td><td><%=dto.getMemail() %></td>
								</tr>
								<tr>
									<td>연락처</td><td><%=dto.getMtel() %></td>
								</tr>
								<tr>
									<td>주소</td><td><%=dto.getMaddr() %></td>
								</tr>
								
							</table>
						</div>
						<div class="myInfo2">
							<table class="myinfotable2">
								<tr>
									<td>나의 쇼핑정보</td><td><button>장바구니</button></td>
								</tr>
								<tr>
									<td>주문내역</td><td><%=dto.getMaddr() %></td>
								</tr>
								<tr>
									<td>잔여금액</td><td><%=dto.getMsum() %></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="충전" onclick="payGo()"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
	</section>
</section>

</body>
<%@include file="/footer.jsp" %>
</html>