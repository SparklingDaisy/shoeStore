<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoe.cart.*" %>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO" scope="session"></jsp:useBean>
<%
String id = (String)session.getAttribute("sid");
System.out.println("**cart.jsp입장**"); //test
System.out.println(id);

%>
<!-- No paging -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/item.css">
<script>
function offClick(){
	for(var i=0; i<document.toBuy.ccheck.length; i++){
		document.toBuy.ccheck[i].checked = false;
	}
	document.toBuy.preSum.value = 0;
	document.toBuy.saleSum.value = 0;
	document.toBuy.postSum.value = 0;
}
function show(csum, mtier){
	var result = new Array();
	var presum = 0;
	for(var i=0; i<document.toBuy.ccheck.length; i++){
		document.toBuy.ccheck[i].value = document.toBuy.csum[i].value;
		if(document.toBuy.ccheck[i].checked){
			result[i] = document.toBuy.ccheck[i].value;
			presum += parseInt(result[i]);
		}
	}
	document.toBuy.preSum.value = presum;
	
	var resultSale = 0;
	switch(mtier){
	case 'bronze': resultSale = document.toBuy.preSum.value*0.05; break;
	case 'silver': resultSale = document.toBuy.preSum.value*0.1; break;
	case 'gold': resultSale = document.toBuy.preSum.value*0.15; break;
	case 'platinum': resultSale = document.toBuy.preSum.value*0.2; 
	}
	document.toBuy.saleSum.value = resultSale;
	
	var postsum=0;
	postsum = document.toBuy.preSum.value-resultSale;
	document.toBuy.postSum.value = postsum;
	
	for(var i=0; i<document.toBuy.ccheck.length; i++){
		document.toBuy.ccheck[i].value = document.toBuy.cidx[i].value;
	}
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section class="itemCartSect"> 
<!-- category 삭제 -->
	<article>
	<h2>장바구니</h2>
	<form name="toBuy"> 
		<table>
			<colgroup>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="*%"/>
			</colgroup>
			<thead>
				<tr>
					<td colspan="9">&nbsp;</td>
					<td colspan="1"><input type="button" value="전체선택 해제" onclick="offClick();"></td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<th>No.</th>
					<th>상품번호</th> <!-- sho_item의 iidx값. 나중에 이 항목은 삭제해도 됨. 값 넘기는 용 -->
					<th>상품이미지</th> 
					<th>상품명</th>
					<th>금액</th>
					<th>사이즈</th>
					<th>구매수량</th>
					<th>구매액</th>
					<th>담은 날짜</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
			<%
			DecimalFormat df = new DecimalFormat();
			df.applyLocalizedPattern("#,##0");
			
			ArrayList<Shoe_cartDTO> arr = cdao.cartList(id);
			if(arr==null || arr.size()==0){
				%>
				<tr>  
					<td colspan="10" align="center">
					등록된 상품이 없습니다.
					</td>
				</tr>
				<%
			} else{
				for(int i=0; i<arr.size(); i++){
					int cidx = arr.get(i).getCidx();
					int ciidx = arr.get(i).getCiidx();
					String cimg = arr.get(i).getCimg();
					String cname = arr.get(i).getCname();
					int cprice = arr.get(i).getCprice();
					String csize = arr.get(i).getCsize();
					int ccnt = arr.get(i).getCcnt();
					int csum = arr.get(i).getCsum();
					java.sql.Date cputdate = arr.get(i).getCputdate();
					String mtier = arr.get(i).getMtier();
					%>
					<input type="hidden" name="cidx" value="<%=cidx %>">
					<input type="hidden" name="mtier" value="<%=mtier %>">
					<input type="hidden" name="csum" value="<%=csum %>">
					<tr>
						<td><%=cidx %></td>
						<td><%=ciidx %></td> <!-- sho_item의 iidx값 -->
						<td>
						<%
						if(cimg!=null){
							%>
							<img src="/shoeStore/item/itemimg/<%=cimg %>" alt="<%=cimg %>">
							<%
						} else if(cimg==null){
							%>
							<img src="/shoeStore/img/noimage.gif">
							<%
						}
						%>
						</td>
						<td><%=cname %></td>
						<td><%=df.format(cprice) %>원</td>
						<td><%=csize %></td>
						<td><%=ccnt %></td>
						<td><%=df.format(csum) %>원</td>
						<td><%=cputdate %></td>
						<td>
							<input type="checkbox" name="ccheck" value="<%=cidx %>" onclick="show(<%=csum %>,'<%=mtier%>');">
						</td>
					</tr>
					<%
				}
			}	
		%>
			</tbody>
			<tfoot> 
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10" id="itemCartReadTxt">※ 상품 선택 시 금액이 보입니다.</td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr rowspan="3">
					<td colspan="10" id="itemCartReadTxt">
						선택한 상품 총 금액 : <input type="text" name="preSum" id="readTxt" readonly> 원 
					</td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10" id="itemCartReadTxt">
						할인금액 : <input type="text" name="saleSum" id="readTxt" readonly> 원 
					</td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10" id="itemCartReadTxt">
						최종 결제 금액 : <input type="text" name="postSum" id="readTxt" readonly> 원
					</td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="10" class="itemCartButton">
						<button type="submit" formaction="buy.jsp">주문하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" formaction="itemCartDelete_ok.jsp">선택삭제</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</article>
</section>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/footer.jsp" %>
</body>
</html>