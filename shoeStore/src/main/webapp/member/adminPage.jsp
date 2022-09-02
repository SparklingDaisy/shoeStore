<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

article{
	margin:auto;
}

table{
	margin:auto;
}

th,td{
	padding:20px;
}

last_td{
	text-align:center;
}
</style>
<%String search=request.getParameter("search");
String select=request.getParameter("select");
%>
<script>

function turnAround(){
window.location.href="/shoeStore/member/myPage.jsp";
}

function searching(){
	var search=document.getElementById("search").value
	var select=document.getElementById("memberSearch").value
	window.location.href="adminPage.jsp?search="+search+"&select="+select;
}



</script>
</head>
<%
int totalCnt=mdao.getTotalCnt(); //실제 디비로부터 가져오는 정보
int listSize=5; //한 페이지에 보여줄 게시글 수
int pageSize=5; //한 페이지에 보여줄 페이지 수

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s); //사용자 현재 페이지 위치

int totalPage=totalCnt/listSize+1; //총 페이지 수
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize; // 사용자 현재위치에서 보여줄 페이지의 그룹
if(cp%pageSize==0)userGroup--;

%>
<body>
<%@include file="memberSid.jsp" %>
<%@include file="/header.jsp" %>
<section>
	<article>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>ID</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<%
						if(userGroup!=0){
							%>
							<a href="adminPage.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
							<%
						}		
					%>
					
					<%
						for(int i=userGroup*pageSize+1;i<=(userGroup*pageSize+pageSize);i++){
							%>&nbsp;&nbsp;<a href="adminPage.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
							if(i==totalPage)break;
						}
					%>
					
					<%
						if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
							%>
							<a href="adminPage.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
							<%
						}		
					%>
					</td>
				</tr>
			</tfoot>
			<tbody>
			<%
			ArrayList<Shoe_memberDTO> arr=mdao.memberFind(listSize,cp);
			
			if(search!=null){
				arr = mdao.memberSearchList(search, select, listSize, cp);
			}
			
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="7" align="center">
					등록된 회원이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
				
					%>
						<tr>
							<td><%=arr.get(i).getMidx() %></td>
							<td><%=arr.get(i).getMid() %></td>
							<td><%=arr.get(i).getMname() %></td>
							<td><%=arr.get(i).getMbirthdate() %></td>
							<td><%=arr.get(i).getMjoindate() %></td>
							<td><a href="adminControl.jsp?mid=<%=arr.get(i).getMid()%>"><input class="but1" type="submit" value="회원정보"></a></td>
						</tr>
			<%	}
			}
			%>
						<tr>
							<td colspan="6" class="last_td">
								<select id="memberSearch">
									<option value="midx">회원번호</option>
									<option value="mid">ID</option>
									<option value="mname">이름</option>
								</select>
							<input type="text" id="search"><button onclick="searching()">검색</button></td>
						</tr>
			</tbody>
		</table>
	</article>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>