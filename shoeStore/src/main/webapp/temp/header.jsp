<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input{
	height: 25px;
}
a {
  text-decoration: none;
}
</style>
<script>
function openLogin(){
	window.open('/shoeStore/member/login.jsp','login','width=450,height=300');
}
</script>

<%
String sname=(String)session.getAttribute("sname");
%>

<header>
<%if(sname==null||sname.equals("")){ %>
	<div>
		<a href="javascript:openLogin();">로그인</a>|<a href="/shoeStore/member/join.jsp">회원가입
	</div>
	<%	
	}else{
		%>
		<div><%=sname %>님 로그인중...|<a href="/shoeStore/member/logout_ok.jsp">로그아웃</a></div>
		<%
	}%>
	<a href="/shoeStore/index.jsp"><h1>shoe issue</h1></a>
	<nav> 
		<form name="" action="">
		<ul>
			<li>
				<input type="text" name="search" value="검색">
				<input type="submit" value="검색">
			</li>
			<li>
				<a href="/shoeStore/bbs/bbsList.jsp" class="linkStyle">질문게시판</a>
			</li>
			<li>
				<a href="/shoeStore/member/myPage.jsp" class="linkStyle">마이페이지</a>
			</li>
		</ul>
		</form>
	</nav>
	<hr>
</header>
