<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.resultInfo.Shoe_resultInfoDTO" %>
<jsp:useBean id="rdto" class="com.shoe.resultInfo.Shoe_resultInfoDTO"/>
<jsp:useBean id="pdao" class="com.shoe.payInfo.Shoe_payInfoDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역조회</title>
<style>
body{
  background: #fff;
}
.paytable th{
  color: #168;
  background : #f0f6f9;
}
.paytable th, .paytable td{
  padding:  10px;
  border: 1px solid #ddd;
}
.paytable th:first-child,
.paytable td:first-child{
  border-left: 0;
}
.paytable th:last-child,
.paytable td:last-child{
  border-right: 0;
}
.paytable{
  border-collapse: collapse;
  border-top:  3px solid #168;
}
table{
	width:600px;
	margin: 0px auto;
}
</style>
</head>
<%
String id=(String)session.getAttribute("sid");
int totalResult=pdao.getRef(id);
int listSize=10;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);
ArrayList<Shoe_resultInfoDTO> arr=new ArrayList<Shoe_resultInfoDTO>();
arr=pdao.sellSearch(cp,listSize);

int totalPage=totalResult/listSize+1;
if(totalResult%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<%@include file="/header.jsp" %>
<body>
<h1 align="center">구매내역</h1>
<section>
	<article>
		<table class="paytable">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>상품 가격</th>
				<th>구매일시</th>
			</tr>
		</thead>
		<tbody>	
			<%
			if(arr==null||arr.size()==0){
				%>
				<tr>
				<td colspan="5" align="center">결제 내역이 존재하지 않습니다.</td>
				</tr>
				<% 
			}
			%>
			<%
			for(int i=0; i<arr.size(); i++){
				%>
				<tr>
					<td><%=arr.get(i).getRidx() %></td>
					<td><%=arr.get(i).getRimg() %></td>
					<td><%=arr.get(i).getRname() %></td>
					<td><%=arr.get(i).getRprice() %></td>
					<td><%=arr.get(i).getRdate() %></td>
				</tr>
				<% 
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
					<%
					if(userGroup!=0){
						%>
						<a href="payResult.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
						<%
					}
					%>
					<%
					for(int i=userGroup*pageSize+1;i<=(userGroup*pageSize+pageSize);i++){
						%>&nbsp;&nbsp;<a href="payResult.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
						
						if(i==totalPage)break;
					}
					%>
					<%
					if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
						%>
						<a href="payResult.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
						<%
					}
					%>
				</td>
			</tr>
		</tfoot>
		</table>
	</article>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>