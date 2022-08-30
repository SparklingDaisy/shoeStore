<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
%>

<%if(sname==null||sname.equals("")){ %>
	<div class="login">
		<a href="javascript:openLogin()">Sign in</a>
	</div>
	<%	
	}else{
		%>
		<div class="login"><a href="/shoeStore/member/myPage.jsp"><%=sname %>님</a>|<a href="/shoeStore/member/logout_ok.jsp">로그아웃</a></div>
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