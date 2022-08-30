<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdto" class="com.shoe.item.Shoe_itemDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<%
String path = request.getRealPath("");
int result = sdao.itemDelAdmin(sdto, path);
String msg = result>0? "해당 정보가 삭제되었습니다.":"삭제에 실패하였습니다.";
%>
<script>
window.alert('<%=msg %>');
window.location.href = 'adminPage.jsp';
</script>