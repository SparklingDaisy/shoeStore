<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sid=(String)session.getAttribute("sid");
String bsubject=request.getParameter("bsubject");
String bref=request.getParameter("bref");
String blev=request.getParameter("blev");
String bsunbun=request.getParameter("bsunbun");
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
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>질문게시판 답변글쓰기</h2>
		<form name="bbsReWrite" action="bbsReWrite_ok.jsp"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="bref" value="<%=bref %>">
		<input type="hidden" name="blev" value="<%=blev %>">
		<input type="hidden" name="bsunbun" value="<%=bsunbun %>">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bid" value="<%=sid %>" size="45" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bsubject" value="Re:)<%=bsubject %>" size="45"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="55" name="bcontent"></textarea>
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