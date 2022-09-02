<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.cart.Shoe_cartDTO" %>
<jsp:useBean id="pdao" class="com.shoe.payInfo.Shoe_payInfoDAO"/>
<jsp:useBean id="mdto" class="com.shoe.member.Shoe_memberDTO"/>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO"/>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"/>
<jsp:useBean id="cdto" class="com.shoe.cart.Shoe_cartDTO"/>
 <%
String price_s=request.getParameter("price");
String id=(String)session.getAttribute("sid");
mdto=mdao.myInfo(id);
int price=Integer.parseInt(price_s);
int result=pdao.itemSell(mdto, price);
String msg=result>0?price+"원 결제 완료!":"결제 실패!";
%>
<script>
window.alert('<%=msg %>');
window.location.href='/shoeStore/item/itemCart.jsp';
</script>
<%
int uptier=pdao.upTier(mdto);
ArrayList<Shoe_cartDTO> arr=(ArrayList<Shoe_cartDTO>)session.getAttribute("cdto");
Shoe_cartDTO dto[]=arr.toArray(new Shoe_cartDTO[arr.size()]);
int cidx[]=new int[arr.size()];
for(int i=0; i<arr.size(); i++){
	cidx[i]=arr.get(i).getCidx();
}
int delete=cdao.itemCartDel(cidx);
int update=pdao.sellSave(mdto, dto);
session.removeAttribute("cdto");
%>
	