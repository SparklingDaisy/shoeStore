<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.shoe.item.*" %>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
String id = (String)session.getAttribute("sid");
//String id = request.getParameter("id");
System.out.println("admin="+id);

/*paging*/
int totalCnt = sdao.getTotalCntAdmin();	
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/mainLayout.css">
<style>
table{
	margin: 0px auto;
	width: 1100px;
	text-align: center;
}
img{
	width: 100px;
	height: 80px;
}
</style>
<script>
function openUpload(){
	window.open('itemUpload.jsp','itemUpload','width=800, height=350');
}
function openUpdate(){
	
}
function openDelete(iidx, iimg, iname, iprice, iview){
	var result = window.confirm('진짜 삭제하시겠습니까?');
	if(!result){
		return;
	}
	window.location.href = 'itemDelete.jsp?iidx='+iidx+'&iimg='+iimg+'&iname='+iname+'&iprice='+iprice+'&iview='+iview;
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<!-- <%@include file="/category.jsp" %> -->
	<article>
	<h2>관리자 페이지</h2>
	<div style="text-align: right">
		<input type="button" value="상품 업로드" onclick="openUpload();">
	</div>
	<article>
	<br/>
	<table>
		<colgroup>
			<col width="10%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="40%"/>
			<col width="5%"/>
			<col width="*%"/>
		</colgroup>
		<thead>
			<tr>
				<th>No.</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>금액</th>
				<th>상품설명</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="7" align="center">
		<%
			if(userGroup!=0){
				%>
				<a href="adminPage.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>" id="paging">&lt;&lt;</a>
				<%
			}
			for(int i=userGroup*pageSize+1; i<=(userGroup*pageSize+pageSize); i++){
				%>
				&nbsp;&nbsp;<a href="adminPage.jsp?cp=<%=i %>" id="paging"><%=i %></a>&nbsp;&nbsp;
				<%
				if(i==totalPage){
					break;
				}
			}
			if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
				%>
				<a href="adminPage.jsp?cp=<%=(userGroup+1)*pageSize+1 %>" id="paging">&gt;&gt;</a>
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
			ArrayList<Shoe_itemDTO> arr = sdao.itemListAdmin(listSize, cp);
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan="7" align="center">
					등록된 상품이 없습니다.
					</td>
				</tr>
				<%
			} else{
				for(int i=0; i<arr.size(); i++){
					int iidx = arr.get(i).getIidx();
					String iimg = arr.get(i).getIimg();
					String iname = arr.get(i).getIname();
					int iprice  = arr.get(i).getIprice();; 
					String iview = arr.get(i).getIview();
				%>
				<form name="adminUpdate" action="itemUpdate.jsp">
				<input type="hidden" name="cp" value="<%=cp %>">
				<input type="hidden" name="iidx" value="<%=iidx %>">
				<input type="hidden" name="iimg" value="<%=iimg %>">
				<input type="hidden" name="iname" value="<%=iname %>">
				<input type="hidden" name="iprice" value="<%=iprice %>">
				<input type="hidden" name="iview" value="<%=iview %>">
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
					<td><%=iname %></td>
					<td><%=df.format(iprice) %>원</td>
					<td><%=iview %></td>
					<td><input type="submit" value="수정"></td>
					<td><a href="javascript: openDelete(<%=iidx%>,'<%=iimg%>','<%=iname%>','<%=iprice%>','<%=iview%>');"><input type="button" value="삭제"></a></td>
				</tr>
				</form>
				<%
				}
			}	
			%>
		</tbody>
	</table>
	</article>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>