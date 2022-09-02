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
<title>my page</title>
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
								<li><a href="/shoeStore/member/adminPage.jsp"><div>관리자 페이지</div></a></li>
							</ul>
					</div>
					<div>
					</div>
				</div>
				<div class="my_main">
					<div class="my_category">
						<div class="myInfo_main">
							<div class="myInfo1">
								<table class="myinfotable1">
									<tr>
										<td class="table_first_line" colspan="2"><b><%=sname %></b> 님</td>
									</tr>
									<tr>
										<td><img src="/shoeStore/img/platinum.png"></a></td>
									</tr>
									<tr>
										<td colspan="2"><a href="/shoeStore/member/memberInfo.jsp"><button>내정보</button></a></td>
									</tr>
									
								</table>
							</div>
							<div class="myInfo2">
								<table class="myinfotable2">
									<tr>
										<td><b>나의 쇼핑정보</b></td><td><a href="/shoeStore/item/itemCart.jsp"><button>장바구니</button></a></td>
									</tr>
									<tr>
										<td><span class="material-symbols-outlined">shopping_bag</span>주문내역</td><td><%=dto.getMaddr() %></td>
									</tr>
									<tr>
										<td><span class="material-symbols-outlined">database</span>잔여금액</td><td><%=dto.getMsum() %></td>
									</tr>
									<tr>
										<td colspan="2"><button onclick="payGo()">충전</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>	
				</div>
	</section>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>