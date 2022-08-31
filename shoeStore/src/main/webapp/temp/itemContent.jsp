<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page import="com.shoe.item.Shoe_itemDTO"%>    
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdto" class="com.shoe.item.Shoe_itemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<%
String id = (String)session.getAttribute("sid");
//String id = request.getParameter("id");

String iidx_s = request.getParameter("iidx");
if(iidx_s==null || iidx_s.equals("")){
	iidx_s = "0";
}
int iidx = Integer.parseInt(iidx_s);

String icategory = request.getParameter("category");
Shoe_itemDTO dto = sdao.detailPage(sdto);
if(dto==null){
	%>
	<script>
	window.alert('삭제된 글 또는 잘못된 접근입니다.');
	window.location.href = 'itemContent.jsp?category=<%=icategory %>';
	</script>
	<%	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/shoeStore/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<%@include file="/category.jsp" %>
	<article>
		<h2>상품 상세 페이지</h2>
		<form name="cart">
		<input type="hidden" name="cid" value="<%=id%>"> <!-- session이후 삭제 -->
		<input type="hidden" name="ciidx" value="<%=dto.getIidx() %>"> 
		<input type="hidden" name="cname" value="<%=dto.getIname() %>">
		<input type="hidden" name="cprice" value="<%=dto.getIprice() %>">
		<div>
		<%
		if(dto.getIimg()!=null){
			%>
			<img src="/shoeStore/item/itemimg/<%=dto.getIimg() %>" alt="<%=dto.getIimg() %>">
			<input type="hidden" name="cimg" value="<%=dto.getIimg() %>">
		<%
		} else if(dto.getIimg()==null){
		%>
			<img src="/shoeStore/img/noimage.gif">
			<input type="hidden" name="cimg" value="">
		<%
		}
		%>
		</div>
		<table>
			<tr>
				<th>상품명</th>
				<td><%=dto.getIname() %></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><%
					DecimalFormat df = new DecimalFormat();
					df.applyLocalizedPattern("#,##0");
					int iprice = dto.getIprice(); 
					%>
					<%=df.format(iprice) %>원
				</td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td>
				<select name="csize">
				<%
				if(dto.getIsize()==null){
					%>
					<script>
					window.alert('삭제된 글 또는 잘못된 접근입니다.');
					window.history.back();
					</script>
					<%
					return;
				}
				String isizeArr[] = dto.getIsize().split(",");
				for(int i=0; i<isizeArr.length; i++){
					%>
					<option value="<%=isizeArr[i] %>"><%=isizeArr[i] %></option>
					<%
				}
				%>
				</select>
				</td>
			</tr>
			<tr>
				<select name="ccnt">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" formaction="itemContentToCart.jsp">장바구니</button>
					<button type="submit" formaction="buy.jsp" onclick="window.alert('바로결제 페이지로 이동합니다.');">바로결제</button>
				</td>
			</tr>
		</table>
		<div>
			<h4>상품 상세 설명</h4>
			<%=dto.getIview() %>
		</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>