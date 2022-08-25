<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
  <script>
 function openIdCheck(){
	 window.open('idCheck.jsp','idCheck','width=450,height=150');
 }

  </script>
  
 </head>
 <body>
 <table class="firTable">
	<tr>
	<td align="center">회원가입</td>
	</tr>
  </table>
  <form name="join" action="join_ok.jsp">
  <table>
	<tr>
		<td class="table">아이디</td>
		<td class="td"><input type="text" name="mid" readonly>
		<input type="button" value="중복검사" onclick="openIdCheck()"><br>
		<span class="tdBlue">중복되는 아이디는 사용할 수 없습니다.</span></td>
	</tr>
	<tr>
		<td class="table"> 비밀번호</td>
		<td><input type="password" name="mpwd"></td>
	</tr>
	<tr>
		<td class="table">비밀번호 확인</td>
		<td><input type="password" name="mpwd2"></td>
	</tr>
	<tr>
		<td class="table">이름</td>
		<td><input type="text" name="mname"><br>
	</tr>
		<tr>
		<td class="table">생년월일</td>
		<td><input type="text" name="mbirthdate"><br>
	</tr>
		<tr>
		<td class="table">성별</td>
		<td><input type="radio" name="mgender" value="man" checked>남자
		<input type="radio" name="mgender" value="woman">여자</td>
	</tr>
		<tr>
		<td class="table">전화번호</td>
		<td><input type="text" name="mtel"></td>
	</tr>
		<tr>
		<td class="table">주소</td>
		<td><input type="text" name="maddr"></td>
	</tr>
	<tr>
		<td class="table">이메일 주소</td>
		<td><input type="text" name="memail"></td>
	</tr>
	<tr>
		<td class="table">메일링 가입</td>
		<td><input type="checkbox" name="mad" checked>메일 수신<br>
		<span class="tdBlue">메일링 가입이 체크되지 않으면 단체메일 발송 시 메일을 받지 않습니다.</span></td>
	</tr>
  </table><br>
  <div>
	  <input type="submit" value="회원가입">
	  <a href="../index.jsp"><input type="button" value="가입취소"></a>
  </div>
  </form>
 </body>
</html>