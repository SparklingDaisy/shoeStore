<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.item.*" %>    
<%@ page import="com.shoe.member.*" %>
<%@ page import="com.shoe.cart.*" %>
<jsp:useBean id="cdto" class="com.shoe.cart.Shoe_cartDTO"/>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO"/>
<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"/>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"/>
<jsp:useBean id="pdao" class="com.shoe.payInfo.Shoe_payInfoDAO"/>
<%
String id=(String)session.getAttribute("sid");
String idx_s[]=request.getParameterValues("ccheck");

int idx[]=new int[idx_s.length];
for(int i=0; i<idx.length; i++){
	idx[i]=Integer.parseInt(idx_s[i]);
}
ArrayList<Shoe_cartDTO> arr=cdao.confirmParam(idx);
mdto=mdao.myInfo(id);
int mymoney=pdao.goMoney(id);
int sum=0;
for(int i=0; i<arr.size(); i++){
	sum=sum+arr.get(i).getCsum();	
}
int per=pdao.goSale(mdto);
int price=(sum*(100-per))/100;
%>
<%
session.setAttribute("cdto", arr);
%>
<%
Shoe_cartDTO dto[]=arr.toArray(new Shoe_cartDTO[arr.size()]);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제정보확인</title>
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
	text-align: center;
}
.tooltip {
  display: inline;
  color:#25688a;
  font-weight: bold;
}
.tooltip-text {
  display: none;
  position: absolute;
  max-width: 200px;
  border: 1px solid;
  border-radius: 5px;
  padding: 5px;
  font-size: 0.8em;
  color: white;
  background: #25688a;
}
.tooltip:hover .tooltip-text {
  display: inline;
}
.alert{
	color:red;
}
.btn{
	text-align:center;
}
</style>
<script>
var pwidth=400;
var pheight=400;

var popupX=(window.screen.width/2)-(pwidth/2);
var popupY=(window.screen.height/2)-(pheight/2);
function payGo(){
	window.open('payPopup.jsp','충전','width='+pwidth+',height='+pheight+',left='+popupX+',top='+popupY);
}
</script>
<%@include file="/header.jsp" %>
<body>
<section>
	<article>
		<h1 align="center">결제 정보 확인</h1>
		<table class="paytable">
			<tr>
				<th>상품갯수</th>
				<td><span class="tooltip"><%=idx.length %>종의 상품<span class="tooltip-text">
				<%for(int i=0; i<dto.length; i++){
						%>
						<p><%=dto[i].getCname() %>&nbsp;<%=dto[i].getCsize() %>mm&nbsp;<%=dto[i].getCcnt() %>개</p>
						<% 
					} %>
				</span></span></td>
			</tr>
			<tr>
				<th>나의 등급</th>
				<td><span class="tooltip"><%=mdto.getMtier() %><span class="tooltip-text">
				<h5>등급 할인</h5>
				<h6>platinum : 20%</h6>
				<h6>  gold   : 15%</h6>
				<h6> silver  : 10%</h6>
				<h6> bronze  :  5%</h6>
				</span></span></td>
			</tr>
			<tr>
				<th>등급 할인율</th>
				<td><%=pdao.goSale(mdto) %>%</td>
			</tr>
			<tr>
				<th>할인 후 결제금액</th>
				<td><%=price %></td>
			</tr>
			<tr>
				<th>충전된 금액</th>
				<td><%=mymoney %></td>
			</tr>
			<%
			if(mymoney-price>=0){
				%>
				<tr>
					<th>결제 후 금액</th>
					<td><%=mymoney-price %>원</td>
				</tr>
				<form action="payPurchase_ok.jsp">
				<tr>
					<input type="hidden" value="<%=price%>" name="price">
					<td colspan="2" class="btn"><input type="submit" value="결제하기"></td>
				</tr>
				</form>
				<% 
			}else{
				%>
				<tr>
					<td colspan="2" class="alert"><%=price-mymoney %>원이 부족합니다.</td>
				</tr>
				<tr>
					<td colspan="2" class="cardbtn"><input type="button" value="충전하기" onclick="payGo();"></td>
				</tr>
				<% 
			}
			%>
			</table>
			
	</article>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>
				
				
