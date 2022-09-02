<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.shoe.item.*" %>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
String id = (String)session.getAttribute("sid");
System.out.println(id);

/*category parameter*/
String icategory = request.getParameter("category"); //temporary variable
System.out.println(icategory);
char cat_i = icategory.charAt(0);
String subtitle = "";	
switch(cat_i){
case '2': subtitle = "자체제작"; break;
case '3': subtitle = "로퍼/플랫"; break;
case '4': subtitle = "스니커즈/슬립온"; break;
case '5': subtitle = "힐/펌프스"; break;
case '6': subtitle = "부츠"; break;
case '7': subtitle = "샌들"; break;
default: subtitle = "상품 전체보기";
}

/*ordering*/
String order="new";
if(request.getParameter("order")!=null){
	order=request.getParameter("order");
}
%>
<%
/*paging*/
int totalCnt = sdao.getTotalCnt(icategory);	
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
<title><%=subtitle %></title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/category2.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/item.css">
<!-- add order -->
<script>
function order(){
	var order=document.getElementById('order');
	order=order.options[order.selectedIndex].value;
	location.href='itemList.jsp?category=<%=icategory%>&order='+order;
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<%@include file="/category.jsp" %>
<section class="itemListSect">
	<article><br/>	
	<h2><%=subtitle %></h2>
	<table>
		<colgroup>
			<col width="15%"/>
			<col width="25%"/>
			<col width="40%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="3">&nbsp;</th>
				<th id="itemListOrder">
				<select id="order" onchange="order();">
					<option value="new" <%if(order.equals("new")){%>selected<% } %>>최신순</option>
					<option value="high" <%if(order.equals("high")){%>selected<% } %>>높은 금액순</option>
					<option value="low" <%if(order.equals("low")){%>selected<% } %>>낮은 금액순</option>
				</select>	
				</th>
			</tr>
			<th colspan="4">&nbsp;</th>
			<tr>
				<th>No.</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>금액</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
		<%
			if(userGroup!=0){
				%>
				<a href="itemList.jsp?category=<%=icategory %>&cp=<%=(userGroup-1)*pageSize+pageSize %>&order=<%=order %>" class="groupLink">&lt;&lt;</a>
				<%
			}
			for(int i=userGroup*pageSize+1; i<=(userGroup*pageSize+pageSize); i++){
				%>
				&nbsp;&nbsp;<a href="itemList.jsp?category=<%=icategory %>&cp=<%=i %>&order=<%=order %>" class="groupLink"><%=i %></a>&nbsp;&nbsp;
				<%
				if(i==totalPage){
					break;
				}
			}
			if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
				%>
				<a href="itemList.jsp?category=<%=icategory %>&cp=<%=(userGroup+1)*pageSize+1 %>&order=<%=order %>" class="groupLink">&gt;&gt;</a>
				<%
			}
			%>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<%
			DecimalFormat df = new DecimalFormat();
			df.applyLocalizedPattern("#,##0");
			
			ArrayList<Shoe_itemDTO> arr = null;
			if(order.equals("high")){
				arr = sdao.itemListHighCost(icategory, listSize, cp);
			}else if(order.equals("low")){
				arr = sdao.itemListLowCost(icategory, listSize, cp);
			}else{
				arr = sdao.itemList(icategory, listSize, cp);
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
						<td class="itemListSectbottomLine"><%=iidx %></td>
						<td class="itemListSectbottomLine">
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
						<td class="itemListSectbottomLine"><a href="itemContent.jsp?category=<%=icategory %>&iidx=<%=iidx%>&iimg=<%=iimg %>&iname=<%=iname %>&iprice=<%=iprice %>" class="itemClickLink"><%=iname %></a></td>
						<td class="itemListSectbottomLine"><%=df.format(iprice) %>원</td>
					</tr>
					<%
				}
			}	
		%>
		</tbody>
	</table>
	</article>
</section>
<div id="clear">&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/footer.jsp" %>
</body>
</html>