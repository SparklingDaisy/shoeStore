<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="com.shoe.cart.Shoe_cartDAO" scope="session"></jsp:useBean>

<%
String cidx_s[] = request.getParameterValues("ccheck");
if(cidx_s==null || cidx_s.length==0){
	%>
	<script>
	window.alert('선택한 상품이 없습니다.');
	window.location.href = 'itemCart.jsp';
	</script>
	<%
	return;
}
int cidx[] = new int[cidx_s.length];
for(int i=0; i<cidx_s.length; i++){
	cidx[i] = Integer.parseInt(cidx_s[i]);
}
int result = cdao.itemCartDel(cidx);
String msg = result>0? "선택한 상품이 장바구니에서 삭제되었습니다.":"선택한 상품이 장바구니에서 해제되는 데에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
window.location.href = 'itemCart.jsp';
</script>

