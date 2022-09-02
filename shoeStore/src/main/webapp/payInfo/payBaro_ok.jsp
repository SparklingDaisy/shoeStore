<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.cart.Shoe_cartDTO" %>
<jsp:useBean id="pdao" class="com.shoe.payInfo.Shoe_payInfoDAO"/>
<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"/>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO"/>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"/>
<jsp:useBean id="cdto" class="com.shoe.cart.Shoe_cartDTO"/>
<jsp:useBean id="idto" class="com.shoe.item.Shoe_itemDTO"/>
<script>
var pwidth=400;
var pheight=400;

var popupX=(window.screen.width/2)-(pwidth/2);
var popupY=(window.screen.height/2)-(pheight/2);
function payGo(){
	window.open('payPopup.jsp','충전','width='+pwidth+',height='+pheight+',left='+popupX+',top='+popupY);
}
</script>
 <%
String ciidx_s=request.getParameter("ciidx");
String id=(String)session.getAttribute("sid");
mdto=mdao.myInfo(id);
int ciidx=Integer.parseInt(ciidx_s);
idto=pdao.itemSearch(ciidx);
int cprice=idto.getIprice();
int per=pdao.goSale(mdto);
int price=(cprice*(100-per))/100;
if(mdto.getMsum()-price>0){
	%>
	<script>
	var result=window.confirm('<%=price%>원 결제하시겠습니까?');
	if(result){
		<%int result=pdao.itemSell(mdto, price);
		int uptier=pdao.upTier(mdto);
		int update=pdao.baroSave(mdto, idto);
		%>
		window.alert('결제완료');
	}else{
		window.location.href='/shoeStore/item/itemContent.jsp';
	}
	</script>
	<%
}else{
	%>
	<script>
	var result=window.confirm('금액이 부족합니다. 충전하시겠습니까?');
	if(result){
		payGo();
		window.location.href='/shoeStore/item/itemContent.jsp';
	}else{
		window.location.href='/shoeStore';
	}
	</script>
	<% 
}
%>