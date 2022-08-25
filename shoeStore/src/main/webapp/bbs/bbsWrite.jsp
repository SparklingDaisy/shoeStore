<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkContent{
	if(document.bcontent.value=""){
		window.alert('내용을 입력해주세요!')
		location.href="bbsList.jsp"
	}
}
</script>
</head>
<%
//String bid=(String)session.getAttribute("bid");
String bid="tester";
%>
<body>
<section>
	<article>
		<h2>질문게시판</h2>
		<form name="bbsWrite" action="bbsWrite_ok.jsp"
		method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bid" value="<%=bid%>" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="bsubject"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="10" cols="55" name="bcontent"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>파일</label>
					<input type="file" name="upload">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="글쓰기" onclick="checkContent();">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
</body>
</html>