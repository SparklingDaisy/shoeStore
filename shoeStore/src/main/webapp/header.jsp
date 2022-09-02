<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
function openLogin(){
	window.open('/shoeStore/member/sign.jsp','login','width=450,height=850');
}
</script>
</head>
<header>
<div class="back_top">
<%
String sname=(String)session.getAttribute("sname");
String sessId=(String)session.getAttribute("sid");
%>
<br>
<%if(sessId==null||sessId.equals("")){ %>


	<div class="login">
		<a href="javascript:openLogin()"><font size=3px;>Login</font></a>
	</div>
	<%
	  }else if(sessId.equals("administer")){
      %>
      <div class="login">
         <a href="/shoeStore/item/adminPage.jsp"><span class="material-symbols-outlined">person</span></a> <!-- revision(-) -->
         <a href="/shoeStore/member/myPage.jsp"><span class="material-symbols-outlined">person</span></a>
         <a href="/shoeStore/member/logout_ok.jsp"><span class="material-symbols-outlined">logout</span></a>
      </div>

<%}else{
		%>
		<div class="login">
		<a href="/shoeStore/item/itemCart.jsp"><span class="material-symbols-outlined" style="color:white" class="login">shopping_cart</span></a>
		<a href="/shoeStore/member/myPage.jsp"><span class="material-symbols-outlined">person</span></a>
		<a href="/shoeStore/member/logout_ok.jsp"><span class="material-symbols-outlined">logout</span></a>
		</div>
		<%
	}%>
	
	<div class="nav">
		<div class="logo">
			<a href="/shoeStore"><h1>shoeIssue</h1></a>
		</div>
	
			<div class="nav_menu">
				<a href="/shoeStore">main</a>
				<a href="/shoeStore/shoeIssue.jsp">about</a>
				<a href="/shoeStore/item/itemMain.jsp">store</a>
				<a href="/shoeStore/member/myPage.jsp">my page</a>
				<a href="/shoeStore/bbs/bbsList.jsp">Q&A</a>
				<a href=""></a>
			</div>		
	</div>
</div>
</header>
</body>
</html>