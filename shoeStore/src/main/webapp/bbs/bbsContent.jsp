<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.bbs.*" %>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<%
String bidx_s=request.getParameter("bidx");
if(bidx_s==null||bidx_s.equals("")){
	bidx_s="0";
}
int bidx=Integer.parseInt(bidx_s);
Shoe_bbsDTO dto=bdao.bbsContent(bidx);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href='bbsList.jsp';
	</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int breadnum=dto.getBreadnum();
breadnum++;
bdao.breadnum(dto.getBidx(), breadnum);
%>
<section>
	<article>
		<h2>질문게시판 본문보기</h2>
		<table border="1" width="550" cellspacing="0">
			<tr>
				<th>번호</th>
				<td><%=dto.getBidx() %></td>
				<th>작성날짜</th>
				<td><%=dto.getBwritedate() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getBid() %></td>
				<th>조회수</th>
				<td><%=dto.getBreadnum() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=dto.getBsubject() %></td>
			</tr>
			<tr height="250">
				<td colspan="4">
				<%
				if(dto.getBimg()!=null){
					%>
					<img src="/shoeStore/img/<%=dto.getBimg()%>">
					<%
				}
					%>
					<br><%=dto.getBcontent().replaceAll("\r", "<br>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<a href="bbsList.jsp">목록</a>
				<a href="bbsReWrite.jsp?bsubject=<%=dto.getBsubject() %>&bref=<%=dto.getBref() %>&blev=<%=dto.getBlev() %>&bsunbun=<%=dto.getBsunbun() %>">답변</a></td>
			</tr>
		</table>
	</article>
</section>
</body>
</html>