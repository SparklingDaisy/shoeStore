<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>



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
function turnAround(){
window.location.href="/shoeStore/member/myPage.jsp";
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
						<form method="post" action="memberInfo_ok.jsp">
						      <div class="container">
							    <div class="insert">
							    
							        <table class="info_table">
							    <caption><h2>내 정보 변경</h2></caption>
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
							        <td class="col1">name</td>
							        <td class="col2"><input type="text" value="<%=dto.getMname()%>" readonly></td>
							    </tr>
							   	<tr>
							        <td class="col1">birthdate</td>
							        <td class="col2"><input type="text" name="mbirthdate" value="<%=dto.getMbirthdate()%>"></td>
							    </tr>
							    <tr>
							        <td class="col1">Phone number</td>
							        <td class="col2"><input type="text" name="mtel" value="<%=dto.getMtel()%>"></td>
							    </tr>
							    <tr>
							        <td class="col1">Address</td>
							        <td class="col2"><input type="text" name="maddr" value="<%=dto.getMaddr()%>"></td>
							    </tr>
							    <tr>
							        <td class="col1">E-mail Address</td>
							        <td class="col2"><input type="text" name="memail" value="<%=dto.getMemail()%>"></td>
							    </tr>
							<!--  <tr>
							        <td class="col1">E-mail</td>
							        <td class="col2">
							            <input type="text" name="mailid">
							            <span class="a">@</span>
							            <input type="text" name="email">
							            <select name="mailslc">
							                <option value="self" selected>직접입력</option>
							                <option value="naver">naver.com</option>
							                <option value="gm">gmail.com</option>
							                <option value="da">daum.com</option>
							                <option value="yah">yahoo.com</option>
							            </select>
							            <input class='but2' type="button" value="이메일 중복확인" onclick="">
							        </td>
							    </tr>-->
							    <tr>
							 
							    </tr>
							    </table>
							    
							  </div>
							 
							  <div class="create">    
							        <input class="but1" type="submit" value="정보변경" onclick="">
							        <input class="but2" type="button" value="취소" onclick="turnAround()">    
							  </div>
							  <div>
						  		<a href="leave.jsp"><input class="but_leave" type="button" value="회원탈퇴" ></a>
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
