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
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<style>
h2{
	text-align: center;
}
table{
	width:550px;
	margin:0px auto;
}
img{
	width: 550px;
	height:550px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
int breadnum=dto.getBreadnum();
breadnum++;
bdao.breadnum(dto.getBidx(), breadnum);
String sid=(String)session.getAttribute("sid");
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
					<img src="/shoeStore/bbs/img/<%=dto.getBimg()%>" style="width:300px; height:300px;"/>
					<%
				}
					%>
					<br><%=dto.getBcontent().replaceAll("\r", "<br>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<%if(dto.getBid().equals(sid)){%><a href="bbsUpdate.jsp?bidx=<%=dto.getBidx()%>&bid=<%=dto.getBid()%>&bsubject=<%=dto.getBsubject()%>&bcontent=<%=dto.getBcontent()%>">수정</a>
				<%}%><a href="bbsList.jsp">목록</a>
				<%if(sid=="admin"){ %><a href="bbsReWrite.jsp?bsubject=<%=dto.getBsubject() %>&bref=<%=dto.getBref() %>&blev=<%=dto.getBlev() %>&bsunbun=<%=dto.getBsunbun() %>">답변</a></td>
				<%} %>
			</tr>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>