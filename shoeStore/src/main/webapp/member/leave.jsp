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
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	
	var pwidth=400;
	var pheight=600;

	var popupX=(window.screen.width/2)-(pwidth/2);
	var popupY=(window.screen.height/2)-(pheight/2);
	function payGo(){
		window.open('/shoeStore/payInfo/payPopup.jsp','충전','width='+pwidth+',height='+pheight+',left='+popupX+',top='+popupY);
	}
	
	function realLeave(){
		if (window.confirm("정말 탈퇴하시겠습니까?")) {
			  window.open("deleteAccount_ok.jsp");
			}
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
					<div class="my_category">
												<form method="post" action="memberInfo_ok.jsp">
						      <div class="container">
							    <div class="insert">
							    
							        <table class="info_table">
							    <caption><h2>회원 탈퇴</h2></caption>
							    <tr>
							        <td class="col1">ID</td>
							        <td class="col2"><input type="text" name="mid" value="<%=dto.getMid() %>" readonly></td>
							    </tr>
							    <tr>
							        <td class="col1">Password</td>
							        <td class="col2">
							            <input type="password"  name="mpwd">
							        </td>
							    </tr>
							    <tr>
							        <td class="col1">Password Confirm</td>
							        <td class="col2">
							            <input type="password" name="mpwd2">
							        </td>
							    </tr>
							    <tr>
							    </tr>
							    </table>
							    
							  </div>
							 
							  <div class="create">    
							        <input class="but1" type="submit" value="회원탈퇴" onclick="realLeave()">
							        <input class="but2" type="button" value="취소" onclick="turnAround()">    
							  </div>
							  <div>
						  </div>
					  </div>
					  </form>
				   </div>
				</div>
	</section>
</section>

</body>
<%@include file="/footer.jsp" %>
</html>