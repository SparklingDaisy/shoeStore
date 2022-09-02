<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoe.bbs.*" %>

<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>

<%
String sid=(String)session.getAttribute("sid");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/bbs2.css">

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
</head>
<%
int totalCnt=bdao.getTotalCnt();
int listSize=5;
int pageSize=3;

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
	<article>
		<div class="bbs_header"></div>
		<div class="bbs_table">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<Shoe_bbsDTO> arr=bdao.bbsList(listSize,cp,"");
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="7" align="center">
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
						
						if(arr.get(i).getBimg()==null){
							%><%="없음" %><%
						}else{%>
							<img src="/shoeStore/bbs/img/<%=arr.get(i).getBimg()%>" class="img"></td>
						<% }%>
						<td><a href="bbsContent.jsp?bidx=<%=arr.get(i).getBidx()%>" style="text-decoration:none; color:black;"><%=arr.get(i).getBsubject() %></a></td>
						<td><%=arr.get(i).getBid() %></td>
						<td><%=arr.get(i).getBwritedate() %></td>
						<td><%=arr.get(i).getBreadnum() %></td>
						<td><%if(arr.get(i).getBid().equals(sid)||sid=="admin"){ %><a href="javascript:deleteB(<%=arr.get(i).getBref()%>,'<%=arr.get(i).getBid()%>','<%=arr.get(i).getBimg()%>');"><button class="black">delete</button></a>
						<%} %></td>
					</tr>
					<%
					
				}
			}
			%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="bbsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<=(userGroup*pageSize+pageSize);i++){
						%>&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i%>" style="text-decoration:none; color:black;"><%=i %></a>&nbsp;&nbsp;<%
						
						if(i==totalPage)break;
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="bbsList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>" style="text-decoration:none; color:black;">&gt;&gt;</a>
						<%
					}
					%>
					</td>
					<td>
					</td>
					<td colspan="3" align="center">
						<button class="white"><a href="bbsWrite.jsp" style="text-decoration:none; color:black;">글쓰기</a></button>
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		<div class="bbs_bot"></div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>