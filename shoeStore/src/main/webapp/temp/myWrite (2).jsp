<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.bbs.*" %>
<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>


<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/bb2.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@include file="/header.jsp" %>
<%

int totalCnt=bdao.getMyTotalCnt((String)session.getAttribute("sid"));
int listSize=5;
int pageSize=3;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<link rel="stylesheet" type="text/css" href="../css/myPage.css">

</script>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">	
			<div class="my_menu">
				<ul>
					<li><a href="/shoeStore/item/itemCart.jsp"><div>장바구니</div></a></li>
					<li><a href="/shoeStore/item/itemCart.jsp"><div>구매내역</div></a></li>
					<li><a href="/shoeStore/member/myTier.jsp"><div>나의 등급</div></a></li>
					<li><a href="/shoeStore/member/myWrite.jsp"><div>나의 질문</div></a></li>
					<li><a href="/shoeStore/member/memberInfo.jsp"><div>회원정보변경</div></a></li>
					<li><a href="/shoeStore/member/adminPage.jsp"><div>회원관리</div></a></li>
				</ul>
			</div>
			<div class="my_main">

			</div>
		<div class="my_bot"></div>
	</section>
</section>
					
<%@include file="/footer.jsp" %>
