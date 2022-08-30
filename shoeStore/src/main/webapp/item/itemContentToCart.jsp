<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<%
String icategory = request.getParameter("category");
String iid = request.getParameter("id"); //getAttribute로 변경(-)
String iidx = request.getParameter("iidx");
String iname = request.getParameter("iname");
String iprice = request.getParameter("iprice");
String isize = request.getParameter("isize");
String icnt = request.getParameter("icnt");
System.out.print(iid + " " + iidx + " " + iname + " " + iprice + " " + isize + " " + icnt);
System.out.println();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<section>
<h2>장바구니 페이지로 이동하시겠습니까?</h2>
	<article>
		<form name="cart" action="basket.jsp">
		<input type="hidden" name="id" value="<%=iid %>">
		<input type="hidden" name="iidx" value="<%=iidx %>">
		<input type="hidden" name="iname" value="<%=iname %>">
		<input type="hidden" name="iprice" value="<%=iprice %>">
		<input type="hidden" name="isize" value="<%=isize %>">
		<input type="hidden" name="icnt" value="<%=icnt %>">
		<input type="submit" value="예" onclick="openCart();">
		<input type="button" value="아니오" onclick="window.location.href='itemContent.jsp?category=<%=icategory %>&id=<%=iid%>&iidx=<%=iidx%>&iname=<%=iname%>&iprice=<%=iprice%>&isize=<%=isize%>&icnt=<%=icnt%>';">
	</form>
	</article>
</section>
</body>
</html>