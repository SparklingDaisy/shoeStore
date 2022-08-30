<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shoe.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.shoe.bbs.*" %>


<jsp:useBean id="bdao" class="com.shoe.bbs.Shoe_bbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="mdao" class="com.shoe.member.Shoe_memberDAO"></jsp:useBean>

    
<%
	String sid=(String)session.getAttribute("sid"); //세션은 오브젝트 이므로 다운캐스팅 필수
	if(sid==null){
		
		%>
		<script>
			window.alert('로그인 후 이용가능합니다.');
			window.location.href="/shoeStore";
		</script>
		<%
		return; //조건을 쓸 때 밑에 밑에 있는 자바코드가 먼저 번역될 수 있으므로 우선 리턴으로 끊어줌
	}

	Shoe_memberDTO dto=mdao.myInfo(sid);

int totalCnt=bdao.getTotalCnt();
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link rel="stylesheet" type="text/css" href="../css/bb2.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	function deleteAccount(){
		var result=window.confirm('정말 탈퇴하시겠습니까?');		
		if(!result){
			return;
		}else{
			window.location.href='deleteAccount_ok.jsp';
		}
	}

</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section class="my_all">
	<div class="my_top"></div>
		<section class="my_container">
				<div class="my_menu">
					<ul>
						<li><a href="#"><div>마이페이지</div></a></li>
						<li><a href="#"><div>장바구니</div></a></li>
						<li><a href="#"><div>구매내역</div></a></li>
						<li><a href="#"><div>나의 등급</div></a></li>
						<li><a href="myWrite.jsp"><div>나의 질문</div></a></li>
						<li><a href="memberInfo.jsp"><div>회원정보변경</div></a></li>
						<li><a href="javascript:memberInfo();"><div> 회원탈퇴</div></a></li>
					</ul>
				</div>
				<div class="my_main">
					<section class="bbs">
						<article>
							<div>
							<table class="bbs_table">
								<thead>
									<tr>
										<th>번호</th>
										<th>이미지</th>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>조회수</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<%
								ArrayList<Shoe_bbsDTO> arr=bdao.bbsList(listSize,cp,sid);
								if(arr==null||arr.size()==0){
									%>
									<tr>
										<td colspan="7" align="center">
										등록된 게시물이 없습니다.
										</td>
									</tr>
									<%
								}else{
									for(int i=0;i<arr.size();i++){
										%>
										<tr>
											<td><%=arr.get(i).getBidx() %></td>
											<td>
											<%
											for(int z=0;z<arr.get(i).getBlev();z++){
												out.println("&nbsp;&nbsp;");
											}
											
											if(arr.get(i).getBimg()==null){
												%><%="없음" %><%
											}else{%>
												<img src="/shoeStore/bbs/img/<%=arr.get(i).getBimg()%>" class="img"></td>
											<% }%>
											<td><a href="bbsContent.jsp?bidx=<%=arr.get(i).getBidx()%>" style="text-decoration:none; color:black;"><%=arr.get(i).getBsubject() %></a></td>
											<td><%=arr.get(i).getBid() %></td>
											<td><%=arr.get(i).getBwritedate() %></td>
											<td><%=arr.get(i).getBreadnum() %></td>
											<td><%if(arr.get(i).getBid().equals(sid)||sid=="admin"){ %><a href="javascript:deleteB(<%=arr.get(i).getBref()%>,'<%=arr.get(i).getBid()%>','<%=arr.get(i).getBimg()%>');"><button class="black">delete</button></a>
											<%} %></td>
										</tr>
										<%
										
									}
								}
								%>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="5" align="center">
										<%
										if(userGroup!=0){
											%>
											<a href="bbsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
											<%
										}
										%>
										<%
										for(int i=userGroup*pageSize+1;i<=(userGroup*pageSize+pageSize);i++){
											%>&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i%>" style="text-decoration:none; color:black;"><%=i %></a>&nbsp;&nbsp;<%
											
											if(i==totalPage)break;
										}
										%>
										<%
										if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
											%>
											<a href="myWrite.jsp?cp=<%=(userGroup+1)*pageSize+1 %>" style="text-decoration:none; color:black;">&gt;&gt;</a>
											<%
										}
										%>
										</td>
										<td>
										</td>
									</tr>
								</tfoot>
							</table>
							</div>
							<div class="bbs_bot"></div>
						</article>
					</section>
				</div>
		</section>
	<div class="my_bot"></div>
</section>

</body>
<%@include file="/footer.jsp" %>
</html>
