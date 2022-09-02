<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
//String id = (String)session.getAttribute("sid");

String savepath = request.getRealPath("/item/itemimg/");
MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*10, "UTF-8"); 
int result = sdao.uploadItem(mr);
///////////////test
String test1 = mr.getParameter("id"); 
String catearr[] = mr.getParameterValues("icategory");
String test2 = catearr[0];
for(int i=0; i<catearr.length; i++) {
	test2 = test2 + " " + catearr[i];
}
System.out.println(test1);
System.out.println(test2);
///////////////
String msg = result>0? "상품 업로드에 성공하였습니다.":"상품 업로드에 실패하였습니다.";
%>

<script>
	window.alert('<%=msg %>');
	window.location.href = 'itemUpload.jsp';
</script>