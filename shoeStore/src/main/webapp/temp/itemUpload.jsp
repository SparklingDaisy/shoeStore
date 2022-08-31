<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.item.*" %>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
String id = (String)session.getAttribute("sid");
//String id = request.getParameter("id");
System.out.println(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
article{
	font-family: '나눔고딕';
}
</style>
<script>
function closeUpload(){
	window.self.close();
	opener.location.reload();
}
</script>
</head>
<body>
<section>
	<article>
	<h2>상품 업로드</h2>
	<form name="itemUpload" action="itemUpload_ok.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%=id%>"> <!-- session이후 삭제 -->
		<label>상품명:</label>
		<input type="text" name="iname">
		<br/><br/>
		<label>판매가:</label>
		<input type="text" name="iprice"> (쉼표없이 숫자만 입력)
		<br/><br/>
		<label>상품 상세설명:</label>
		<input type="text" name="iview" >
		<br/><br/>
		<label>업로드 이미지:</label>
		<input type="file" name="iimg">
		<br/><br/>
		<label>카테고리:</label>
		<input type="checkbox" name="icategory" value="1" checked>신상품
		<input type="checkbox" name="icategory" value="2">인기상품
		<input type="checkbox" name="icategory" value="3">MD추천
		<input type="checkbox" name="icategory" value="4">Nike
		<input type="checkbox" name="icategory" value="5">adidas
		<input type="checkbox" name="icategory" value="6">New Balance
		<input type="checkbox" name="icategory" value="7">puma
		<br/><br/><br/>
		<div><input type="submit" value="올리기">　<input type="button" value="닫기" onclick="closeUpload();"></div>
	</form>
	</article>
</section>
</body>
</html>