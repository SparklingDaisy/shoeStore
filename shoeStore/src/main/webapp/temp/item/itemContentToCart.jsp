<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.cart.*" %>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cdto" class="com.shoe.cart.Shoe_cartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<%
String id = (String)session.getAttribute("sid");
System.out.println(id);
int result = cdao.UploadCart(cdto);
String msg = result>0? "장바구니에 성공적으로 담겼습니다.":"장바구니에 담는 것에 실패하였습니다.";
String icategory = request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goToCart(){
	var result = window.confirm('장바구니 페이지로 이동하시겠습니까?');
	if(!result){
		window.history.back();
	}
	window.location.href = 'itemCart.jsp';
}
</script>
<style>
</style>
</head>
<body onload="goToCart();">
<script>
window.alert('<%=msg %>');
</script>
</body>
</html>
