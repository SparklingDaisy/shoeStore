<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
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
<%
String sid=(String)session.getAttribute("sid");
if(sid==null){
	%><script>
	window.alert('로그인이 필요합니다.');
	window.location.href="bbsList.jsp";
	</script><%
}
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>질문게시판</h2>
		<form name="bbsWrite" action="bbsWrite_ok.jsp"
		method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bid" value="<%=sid%>" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bsubject" size="45" maxlength='20'></td>
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