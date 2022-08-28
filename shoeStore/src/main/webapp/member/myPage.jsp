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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">

<script>

	function deleteAccount(){
		var result=window.confirm('정말 탈퇴하시겠습니까?');
		
		if(!result){
			return;
			
		}else{
			window.location.href='deleteAccount_ok.jsp';
		}
	}
	
</script>
</head>
<body>
	<%
	Shoe_memberDTO dto=mdao.myInfo(sid);
	%>
	<%@include file="/header.jsp" %>
	
	<img src="../img/myPage.png">

		<ul>
			<li><%=dto.getMname() %>님 환영합니다!<img src="../img/<%=dto.getMtier() %>.png" class="tier" ></li>
			<li><a href="#">주문내역 조회</a></li>
			<li><a href="#">찜한 상품(개발예정)</a></li>
			<li><a href="#">나의 등급(개발예정)</a></li>
			<li><a href="myWrite.jsp">나의 질문</a></li>
			<li><a href="memberInfo.jsp">회원정보변경</a></li>
			<li><a href="javascript:deleteAccount();">회원탈퇴</a></li>
		</ul>

</body>
<%@include file="/footer.jsp" %>
</html>