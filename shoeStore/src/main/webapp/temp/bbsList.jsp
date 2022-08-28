<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoe.bbs.*" %>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/bbs.css">
<%
String sid=(String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function deleteB(bref,bid,bimg){
	if(bid!='<%=sid%>'){
		return;
	}
	var result=window.confirm('진짜 삭제하시겠습니까?');
	if(!result){
		return;
	}
	window.location.href='bbsDelete.jsp?bref='+bref+'&bid='+bid+'&bimg='+bimg;
}
</script>
<style>
table{
	text-align:center;
}
</style>
</head>
<%
int totalCnt=bdao.getTotalCnt();
int listSize=5;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section class="bbs">
	<article class="article">
		<div class="title"><h2>질문게시판</h2>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6"><a href="/shoeStore/bbs/bbsContent.jsp?bidx=1">자주하는 질문</a></td>
				</tr>
			<%
			ArrayList<Shoe_bbsDTO> arr=bdao.bbsList(listSize,cp);
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="5" align="center">
					등록된 게시물이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					%>
					<tr>
						<td><%=arr.get(i).getBidx() %></td>
						<td>
						<%
						for(int z=0;z<arr.get(i).getBlev();z++){
							out.println("&nbsp;&nbsp;");
						}
						%>
						<a href="bbsContent.jsp?bidx=<%=arr.get(i).getBidx()%>"><%=arr.get(i).getBsubject() %></a></td>
						<td><%=arr.get(i).getBid() %></td>
						<td><%=arr.get(i).getBwritedate() %></td>
						<td><%=arr.get(i).getBreadnum() %></td>
						<%if(arr.get(i).getBid().equals(sid)||sid=="admin"){ %><td><a href="javascript:deleteB(<%=arr.get(i).getBref()%>,'<%=arr.get(i).getBid()%>','<%=arr.get(i).getBimg()%>');">삭제</a></td>
						<%} %>
					</tr>
					<%
				}
			}
			%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="bbsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<=(userGroup*pageSize+pageSize);i++){
						%>&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
						
						if(i==totalPage)break;
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="bbsList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
						<%
					}
					%>
					</td>
					<td>
					</td>
					<td align="center">
						<a href="bbsWrite.jsp">글쓰기</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>