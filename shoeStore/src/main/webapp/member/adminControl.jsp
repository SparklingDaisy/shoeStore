<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<%@ page import="java.util.*" %>

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

<%String mid=request.getParameter("mid");
System.out.println(mid);
Shoe_memberDTO dto2=mdao.myInfo(mid); %>

<script>

function deleteAccount(){
	
	var result = confirm("정말 삭제하시겠습니까?");
	
	if(result == true){
	window.location.href="/shoeStore/member/deleteAccount_ok.jsp";
	}else{
		
	}
}
</script>
</head>
<body>
<%@include file="memberSid.jsp" %>
<%@include file="/header.jsp" %>
<section>
	<article>
		<div class="my_category">
			<form method="post" action="adminControl_ok.jsp">
			      <div class="container">
				    <div class="insert">
				    
				        <table class="info_table">
				    <caption><h2>내 정보 변경</h2></caption>
				    <tr>
				        <td class="col1">ID</td>
				        <td class="col2"><input type="text" name="mid" value="<%=dto2.getMid() %>" readonly></td>
				    </tr>
				    <tr>
				        <td class="col1">Password</td>
				        <td class="col2">
				            <input type="text"  name="mpwd" value="<%=dto2.getMpwd() %>">
				        </td>
				    </tr>

				    <tr>
				        <td class="col1">name</td>
				        <td class="col2"><input type="text" value="<%=dto2.getMname()%>"></td>
				    </tr>
				   	<tr>
				        <td class="col1">birthdate</td>
				        <td class="col2"><input type="text" name="mbirthdate" value="<%=dto2.getMbirthdate()%>"></td>
				    </tr>
				    <tr>
				        <td class="col1">Phone number</td>
				        <td class="col2"><input type="text" name="mtel" value="<%=dto2.getMtel()%>"></td>
				    </tr>
				    <tr>
				        <td class="col1">Address</td>
				        <td class="col2"><input type="text" name="maddr" value="<%=dto2.getMaddr()%>"></td>
				    </tr>
				    <tr>
				        <td class="col1">E-mail Address</td>
				        <td class="col2"><input type="text" name="memail" value="<%=dto2.getMemail()%>"></td>
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
				        <a href="javascript:history.back();"><input class="but2" type="button" value="취소"></a>
				        <input class="but1" type="button" value="삭제" onclick="deleteAccount()">
 
				  </div>
		  </div>
		  </form>
	   </div>
	</article>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>