<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="rdao" class="com.shoe.resultInfo.Shoe_resultInfoDAO"></jsp:useBean>

<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</script>
</head>
<body>
<%@include file="memberSid.jsp" %>
<%@include file="/header.jsp" %>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">
				<div class="my_menu">
				<h1><br><a href="myPage.jsp">마이페이지</a></h1>
					<div class="my_menu_in">
							<ul>
								<li><a href="/shoeStore/item/itemCart.jsp"><div>장바구니</div></a></li>
								<li><a href="/shoeStore/item/itemCart.jsp"><div>구매내역</div></a></li>
								<li><a href="/shoeStore/member/myTier.jsp"><div>나의 등급</div></a></li>
								<li><a href="/shoeStore/member/myWrite.jsp"><div>나의 질문</div></a></li>
								<li><a href="/shoeStore/member/memberInfo.jsp"><div>회원정보변경</div></a></li>
								<li><a href="/shoeStore/member/adminPage.jsp"><div>관리자 페이지</div></a></li>
							</ul>
					</div>
					<div>
					</div>
				</div>
				<div class="my_main">
				<div class="my_category">
					<%
					String nid=(String)session.getAttribute("sid");
					Calendar now=Calendar.getInstance();
					int nm=now.get(Calendar.MONTH)-1;
					String nm_s=String.valueOf(nm);
					if(String.valueOf(nm).length()==1){
						nm_s="0"+String.valueOf(nm);
					}
					int nmo=now.get(Calendar.MONTH);
					String nmo_s=String.valueOf(nmo);
					if(String.valueOf(nmo).length()==1){
						nmo_s="0"+String.valueOf(nmo);
					}
					int nmon=now.get(Calendar.MONTH)+1;
					String nmon_s=String.valueOf(nmon);
					if(String.valueOf(nmon).length()==1){
						nmon_s="0"+String.valueOf(nmon);
					}
					int nm_sum=rdao.sumPrice(nid, nm_s);
					int nmo_sum=rdao.sumPrice(nid, nmo_s);
					int nmon_sum=rdao.sumPrice(nid, nmon_s);
					int nu=nm_sum+nmo_sum+nmon_sum;
					String tier="브론즈";
					if(nu>=100000&&nu<500000){
						tier="실버";
					}else if(nu>=500000&&nu<1000000){
						tier="골드";
					}else if(nu>=1000000){
						tier="플래티넘";
					}
					int ne=0;
					switch(tier){
					case "브론즈":ne=100000-nu;break;
					case "실버":ne=500000-nu;break;
					case "골드":ne=1000000-nu;break;
					}
					%>
					<section>
						<article>
							<h2>나의 등급</h2>
							<table align="center">
									<tr>
										<th><%=nm %>월 승급누적금액</th>
										<td><%=nm_sum %></td>
										<th>현재등급</th>
									</tr>
									<tr>
										<th><%=nmo %>월 승급누적금액</th>
										<td><%=nmo_sum %></td>
										<td rowspan="3"><img src="/shoeStore/img/<%=tier %>.png"></td>
									</tr>
									<tr>
										<th><%=nmon %>월 승급누적금액</th>
										<td><%=nmon_sum %></td>
									</tr>
									<tr>
										<th>총 승급누적금액</th>
										<td><%=nu %></td>
									</tr>
									<tr>
										<th>다음등급까지 남은 승급누적금액</th>
										<td><%=ne %></td>
										<td><%=tier %></td>
									</tr>
							</table>
						</article>
					</section>
					</div>
				</div>
	</section>
</section>

</body>
<%@include file="/footer.jsp" %>
</html>