<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.item.*" %>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
/*category parameter*/
String icategory = request.getParameter("category"); //temporary variable
String subtitle = "";	//카테고리명 변경(-)
%>
<%
String search=request.getParameter("search");
%>
<%
/*paging*/
int totalCnt = sdao.getTotalSearchCnt(search);	
System.out.println(totalCnt);
int listSize = 5;
int pageSize = 5;

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s); 
//
int totalPage = totalCnt / listSize + 1;
if(totalCnt%listSize==0) totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0) userGroup--;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/item.css">
<style>
#searching{
	text-align: right;
}
table{
	margin: 0px auto;
	width: 850px;
	text-align: center;
}
img{
	width: 100px;
	height: 100px;
}
</style>
<script>
function search(){
	var sea=document.getElementById("sear").value
	window.location.href="itemMain.jsp?search="+sea
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<%@include file="/category.jsp" %>
<section class="container">
	<div class="item_left">
	</div>
	<article>
	<div class="item_center">
	<h2><%=subtitle %></h2>
	<br/>	
	<table>
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="50%"/>
			<col width="*%"/>
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>금액</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4" align="center">
		<%
			if(userGroup!=0){
				%>
				<a href="itemMain.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>" id="paging">&lt;&lt;</a>
				<%
			}
			for(int i=userGroup*pageSize+1; i<=(userGroup*pageSize+pageSize); i++){
				%>
				&nbsp;&nbsp;<a href="itemMain.jsp?cp=<%=i %>" id="paging"><%=i %></a>&nbsp;&nbsp;
				<%
				if(i==totalPage){
					break;
				}
			}
			if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
				%>
				<a href="itemMain.jsp?cp=<%=(userGroup+1)*pageSize+1 %>" id="paging">&gt;&gt;</a>
				<%
			}
			%>
				</td>
			</tr>
		</tfoot>
		<tbody>
				<input type="text" id="sear">
				<input type="button" value="검색" onclick="search();">
			<%
			ArrayList<Shoe_itemDTO> arr;
			if(search==null||search.equals("null")){
				arr = sdao.itemAllList(listSize, cp);
			}else{
				arr = sdao.itemSearchList(search, listSize, cp);
			}
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">
					등록된 상품이 없습니다.
					</td>
				</tr>
				<%
			} else{
				for(int i=0; i<arr.size(); i++){
					int iidx = arr.get(i).getIidx();
					String iimg = arr.get(i).getIimg();
					String iname = arr.get(i).getIname();
					int iprice = arr.get(i).getIprice();
					%>
					<tr>
						<td><%=iidx %></td>
						<td>
						<%
						if(iimg!=null){
							%>
							<img src="/shoeStore/item/itemimg/<%=iimg %>" alt="<%=iimg %>">
							<%
						} else if(iimg==null){
							%>
							<img src="/shoeStore/img/noimage.gif">
							<%
						}
						%>
						</td>
						<td><a href="itemContent.jsp?category=<%=icategory %>&iidx=<%=iidx%>&iimg=<%=iimg %>&iname=<%=iname %>&iprice=<%=iprice %>"><%=iname %></a></td>

						<td><%=iprice %>원</td>
					</tr>
					<%
				}
			}	
		%>
		</tbody>
	</table>
	</div>
	</article>
	<div class="item_right"></div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>