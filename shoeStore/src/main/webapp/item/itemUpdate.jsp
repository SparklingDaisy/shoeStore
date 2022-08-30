<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.shoe.item.Shoe_itemDTO"%>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdto" class="com.shoe.item.Shoe_itemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<%
String id = request.getParameter("id");

String iidx_s = request.getParameter("iidx");
if(iidx_s==null || iidx_s.equals("")){
	iidx_s = "0";
}
int iidx = Integer.parseInt(iidx_s);

Shoe_itemDTO dto = sdao.itemBeforeUpdate(sdto);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 글 또는 잘못된 접근입니다.');
	window.location.href = 'adminPage.jsp';
	</script>
	<%	
}

String cp_s = request.getParameter("cp");
if(cp_s == null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s); 
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
table th{
	background-color: lightgray;
}
img{
	width: 300px;
	height: 230px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<h4>수정 시 기본 이미지가 있는 경우 삭제되오니 유의바랍니다!</h4> <!-- popup? -->
<h4>카테고리 설명 입력(-)</h4>
	<article>
	<form name="itemUpdate_ok" action="itemUpdate_ok.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%=id%>">
	<table>
		<colgroup>
			<col width="30%"/>
			<col width="40%"/>
			<col width="30%"/>
		</colgroup>
			<tr>
				<th>No.</th>
				<th>상품명</th>
				<th>카테고리</th>
			</tr>
			<tr>
				<td><input type="hidden" name="iidx" value="<%=dto.getIidx() %>"><%=dto.getIidx() %></td>
				<td><input type="text" name="iname" value="<%=dto.getIname() %>" style="width:500px"></td>
				<td>
					<%
					String icategory = "";
					for(int i=0; i<dto.getIcategory().length; i++){
						icategory += dto.getIcategory()[i] + " ";
					}
					%>
					<%=icategory %>
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<th>사이즈</th>
				<th>작성일</th>
			</tr>	
			<tr>
				<td><input type="text" name="iprice" value="<%=dto.getIprice() %>"></td>
				<td><input type="text" name="isize" value="<%=dto.getIsize() %>" style="width:500px"></td>
				<td><%=dto.getIwritedate() %></td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<th colspan="2">상품설명</th>
			</tr>
			<tr>
				<td><input type="File" name="iimg">
					<%
					if(dto.getIimg()!=null){
						%>
						<img src="/shoeStore/item/itemimg/<%=dto.getIimg() %>">
						<%
					} else if(dto.getIimg()==null){
						%>
						<img src="/shoeStore/img/noimage.gif">
						<%
					}
					%>
				</td>
				<td colspan="2"><textarea name="iview" rows="20" cols="100"><%=dto.getIview().replaceAll("\r", "<br/>") %></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="수정">
					<input type="button" value="돌아가기" onclick="window.location.href ='adminPage.jsp?cp=<%=cp%>';">
				</td>
			</tr>
	</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>