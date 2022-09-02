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
<title>상품 업로드</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/item.css">
<script>
function closeUpload(){
	window.self.close();
	opener.location.reload();
}
</script>
</head>
<body>
<section class="itemUploadSect">
	<article>
	<h2>상품 업로드</h2><br/>
	<form name="itemUpload" action="itemUpload_ok.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%=id%>"> <!-- session이후 삭제 -->
		<label>상품명:</label>
		<input type="text" name="iname" id="itemUploadIname">
		<br/><br/>
		<label>판매가:</label>
		<input type="text" name="iprice"> (쉼표없이 숫자만 입력)
		<br/><br/>
		<label>상품 상세설명:</label>
		<textarea name="iview" cols="100" rows="7"></textarea>
		<br/><br/>
		<label>업로드 이미지:</label>
		<input type="file" name="iimg">
		<br/><br/>
		<label>카테고리:</label>
		<input type="checkbox" name="icategory" value="1" checked>상품 전체보기
		<input type="checkbox" name="icategory" value="2">자체제작
		<input type="checkbox" name="icategory" value="3">로퍼/플랫
		<input type="checkbox" name="icategory" value="4">스니커즈/슬립온
		<input type="checkbox" name="icategory" value="5">힐/펌프스
		<input type="checkbox" name="icategory" value="6">부츠
		<input type="checkbox" name="icategory" value="7">샌들
		<br/><br/><br/>
		<div class="itemUploadSectbutton">
			<input type="submit" value="올리기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="닫기" onclick="closeUpload();">
		</div>
	</form>
	</article>
</section>
</body>
</html>