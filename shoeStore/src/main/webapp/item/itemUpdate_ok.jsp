<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
//String id = (String)session.getAttribute("id");
 
String savepath = request.getRealPath("/item/itemimg/");
MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*10, "UTF-8"); 
System.out.println("["+ mr.getParameter("iidx") +"]"); //test용
String iidx_s = mr.getParameter("iidx");
int iidx = Integer.parseInt(iidx_s);
int result = sdao.itemUpdate(mr, iidx, savepath);
String msg = result>0? "상품 정보가 수정되었습니다.":"수정에 실패하였습니다.";
%>

<script>
window.alert('<%=msg %>');
window.location.href='adminPage.jsp';
</script>