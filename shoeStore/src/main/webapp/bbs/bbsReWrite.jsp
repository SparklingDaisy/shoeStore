<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String bid=(String)session.getAttribute("bid");
String bid="tester";
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
</head>
<body>
<section>
	<article>
		<h2>질문게시판 답변글쓰기</h2>
		<form name="bbsReWrite" action="bbsReWrite_ok.jsp"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="bref" value="<%=bref %>">
		<input type="hidden" name="blev" value="<%=blev %>">
		<input type="hidden" name="bsunbun" value="<%=bsunbun %>">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bid" value="<%=bid %>" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="bsubject" value="Re:)<%=bsubject %>"></td>
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
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
</body>
</html>