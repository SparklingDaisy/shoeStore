<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무통장 입금</title>
<style>
body{
  background-color: #000000;
  color: white;
}
h1{
  text-align: center;
}
.cardbtn{
	background-color:white;
	border-radius:6px;
}
.cardbtn:hover{
	background-color:#7f7e7e;
}
div{
	text-align:center;
}
#paysub{
	width:100px;
}
#paysub:hover{
	width:120px;
	height:30px;
}
</style>
</head>
<body>
<section>
	<article>
		<h1>무통장입금</h1>
		<h3>은행 : 우리</h3>
		<h3>계좌 : 110-344-494932</h3>
		<h3>예금주 : 신발가게</h3>
		<form action="pay_ok.jsp">
			<table>
				<tr>
					<th>결제금액</th>
					<td><input type="radio" name="pcharge" value="10000" checked>10000</td>
					<td><input type="radio" name="pcharge" value="30000">30000</td>
					<td><input type="radio" name="pcharge" value="50000">50000</td>
					<td><input type="radio" name="pcharge" value="100000">100000</td>
				</tr>
			</table>
			<div><input type="submit" value="결제" class="cardbtn" id="paysub"></div>
		</form>
		<div><button onclick="javascript:window.close();" class="cardbtn">취소</button>
			<button onclick="javascript:window.location.href='/shoeStore/payInfo/payPopup.jsp'" class="cardbtn" >뒤로가기</button></div>
		<h6>입금이 확인되면 자동으로 창이 닫히며 결제가 진행됩니다...</h6>
	</article>
</section>
</body>
</html>