<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shoe.member.*" %>
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
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
  table{
	border-spacing:0px;
	border-bottom:1px solid black;
	margin:0px auto;
  }
  
  div{
  	text-align:center;
  }
  
  .firTable{
	border-top:3px solid black;
	vertical-align:center;
	width:670px;

  }

  .table{

	border-bottom:1px solid black;
	background-color:#f0f0f0;
	border-bottom:1px solid #cecece;
	width:150px;

  }
  .td{
	border-bottom:1px solid #cecece;
  }
  .tdBlue{
	color:blue;
  }
  
  </style>
  
 </head>
 <body>
 
 	<%
  	Shoe_memberDTO dto=mdao.myInfo(sid);
  	%>
 <table class="firTable">
	<tr>
	<td align="center"><h2>내 정보</h2></td>
	</tr>
  </table>
  <form name="memberInfo" action="memberInfo_ok.jsp">
  <table>
	<tr>
		<td class="table">아이디</td>
		<td class="td"><input type="text" name="mid" value="<%=dto.getMid() %>" readonly>
	</tr>
	<tr>
		<td class="table">비밀번호변경</td>
		<td><input type="password" name="mpwd"></td>
	</tr>
	<tr>
		<td class="table">비밀번호변경 확인</td>
		<td><input type="password" name="mpwd2"></td>
	</tr>
	<tr>
		<td class="table">이름</td>
		<td><input type="text" name="mname" value="<%=dto.getMname()%>" readonly><br>
	</tr>
	<tr>
		<td class="table">생년월일</td>
		<td><input type="text" name="mbirthdate" value="<%=dto.getMbirthdate()%>"><br>
	</tr>
	<tr>
		<td class="table">전화번호</td>
		<td><input type="text" name="mtel" value="<%=dto.getMtel()%>"></td>
	</tr>
	<tr>
		<td class="table">주소</td>
		<td><input type="text" name="maddr" value="<%=dto.getMaddr()%>"></td>
	</tr>
	<tr>
		<td class="table">이메일 주소</td>
		<td><input type="text" name="memail" value="<%=dto.getMemail()%>"></td>
	</tr>
  </table>
  <br>
  <div>
	  <input type="submit" value="내정보변경">
	  <a href="/shoeStore.jsp"><input type="button" value="취소"></a>
  </div>
  </form>
 </body>
</html>