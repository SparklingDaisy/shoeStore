<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<%
int bidx=Integer.parseInt(request.getParameter("bidx"));
String bid=request.getParameter("bid");
String bsubject=request.getParameter("bsubject");
String bcontent=request.getParameter("bcontent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/mainLayout.css">
<style>
h2{
	text-align: center;
}
table{
	width:550px;
	margin:0px auto;
	border-spacing:0px;
}
</style>
</head>
<body onload="javascrip:window.alert('수정 시 기본 이미지가 있는 경우 삭제되오니 유의바랍니다!')">
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>수정</h2>
		<form name="bbsUpdate" action="bbsUpdate_ok.jsp"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="bidx" value="<%=bidx%>">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bid" value="<%=bid%>" size="45" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bsubject" value="<%=bsubject%>" size="45"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="55" name="bcontent"><%=bcontent%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label>파일</label>
					<input type="file" name="upload">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>