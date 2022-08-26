<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
String c_new = "신상품";
c_new = URLEncoder.encode(c_new);
%>
<article id="subMenu">
	<h2>상품목록</h2>
	 	<ul>
	 		<li><a href="/shoeStore/item/itemNew.jsp?category=<%=c_new %>" class="hyper">● 신상품</a></li><br/>
	 		<li><a href="" class="hyper">● 인기상품</a></li><br/>
			<li><a href="" class="hyper">● MD추천</a></li><br/><br/><br/>
			<li><strong>[브랜드관]</strong></li><br/>
			<li><a href="" class="hyper">● Nike</a></li><br/>
			<li><a href="" class="hyper">● adidas</a></li><br/>
			<li><a href="" class="hyper">● New Balance</a></li><br/>
			<li><a href="" class="hyper">● puma</a></li>
	 	</ul>
	 <a href="/shoeStore/item/adminUpload.jsp?id=admin">업로드</a>
</article>