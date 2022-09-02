<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드결제</title>
<style>
body{
  background-color: #000000;
  color: white;
}
h1{
  text-align: center;
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
</style>
<script>
function Checkform(){
	if(pcardfm.pname.value=="none"){
		window.alert('카드사를 선택해주세요');
		return false;
	}else if(pcardfm.pnum.value==""){
		pcardfm.pnum.focus();
		window.alert('카드번호를 입력해주세요');
		return false;
	}else if(pcardfm.ppwd.value==""){
		pcardfm.ppwd.focus();
		window.alert('비밀번호를 입력해주세요');
		return false;
	}
}
</script>
</head>
<body>
<section>
	<article>
		<h1>신용카드결제</h1>
			<form action="pay_ok.jsp" name="pcardfm" onsubmit="return Checkform();">
			<input type="hidden" value="카드" name="ppayment">
				<table>
					<tr>
						<th>카드정보</th>
						<td><select name="pname">
							<option value="none">=선택=</option>
							<option value="우리">우리</option>
							<option value="신한">신한</option>
							<option value="농협">농협</option>
							<option value="현대">현대</option>
							<option value="국민">국민</option>
							<option value="하나">하나</option>
							<option value="롯데">롯데</option>
						</select></td>
						<td colspan="3">
							<input type="text" size="12" maxlength="12" name="pnum">
						</td>
					</tr>
					<tr>
						<th>결제방식</th>
						<td colspan="4"><select name="pinfo">
							<option value="12개월">12개월</option>
							<option value="6개월">6개월</option>
							<option value="3개월">3개월</option>
							<option value="일시불">일시불</option>
						</select></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="4"><input type="password" size="4" maxlength="4" name="ppwd"></td>
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