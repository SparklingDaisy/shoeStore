<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핸드폰결제</title>
<style>
h1{
	text-align:center;
}
table{
  width: 380px;
  margin:  0px auto;
  border-spacing: 0cm 1em;
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
body{
  background-color: #000000;
  color: white;
}
</style>
<script>
function Checkform(){
	if(pcellfm.pname.value==""){
		pcellfm.pname.focus();
		window.alert('이름을 적어주세요');
		return false;
	}else if(pcellfm.ptel.value==""){
		pcellfm.ptel.focus();
		window.alert('핸드폰번호를 적어주세요');
		return false;
	}else if(pcellfm.ppwd.value!="1111"){
		pcellfm.ppwd.focus();
		return false;
	}
}
function Ptelcf(){
	window.alert('인증번호발송!');
	return;
}
function Ptelcf1(){
	if(pcellfm.ppwd.value!="1111"){
		window.alert('인증실패');
	}else{
		window.alert('인증성공!');
	}
}
</script>
</head>
<body>
<section>
	<article>
		<h1>핸드폰 결제</h1>
			<form action="pay_ok.jsp" name="pcellfm" onsubmit="return Checkform();">
			<input type="hidden" value="핸드폰" name="ppayment">
				<table>
					<tr>
						<th>이름</th>
						<td colspan="4"><input type="text" name="pname"></td>
					</tr>
					<tr>
						<th>번호</th>
						<td><select name="pinfo">
							<option value="SKT">SKT</option>
							<option value="KT">KT</option>
							<option value="LG">LG</option>
						</select></td>
						<td colspan="2"><input type="text" name="pnum" size="10" maxlength="13"></td>
						<td><input type="button" value="인증번호" onclick="Ptelcf();"></td>
					</tr>
					<tr>
						<th>인증번호</th>
						<td colspan="3"><input type="text" name="ppwd"></td>
						<td><input type="button" value="확인" onclick="Ptelcf1();"></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><input type="radio" name="pcharge" value="10000" checked>1만원</td>
						<td><input type="radio" name="pcharge" value="30000">3만원</td>
						<td><input type="radio" name="pcharge" value="50000">5만원</td>
						<td><input type="radio" name="pcharge" value="100000">10만원</td>
					</tr>
				</table>
				<div><input type="submit" value="결제" class="cardbtn" id="paysub"></div>
			</form>
			<div><button onclick="javascript:window.close();" class="cardbtn">취소</button>
			<button onclick="javascript:window.location.href='/shoeStore/payInfo/payPopup.jsp'" class="cardbtn" >뒤로가기</button></div>
	</article>
</section>
</body>
</html>