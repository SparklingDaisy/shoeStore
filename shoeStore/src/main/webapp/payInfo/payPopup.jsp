<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
h1,h6{
  color: white;
  text-align: center;
}
body{
  background: #000000;
}
.paybigbtn{
  width: 300px;
  height: 60px;
  border-radius: 6px;
  font-size: 200%;
  display:block;
  margin: 0px auto;
}
.paybigbtn:hover{
  background: #7f7e7e;
  margin-left:25px;
}
.paybtn{
  width:50px;
  margin-top:50px;
  margin-left: 175px;
}
.paybtn:hover{
	background: #7f7e7e;
}
</style>
<script>
function payCard(){
	window.location.href='/shoeStore/payInfo/payCard.jsp';
}
function payCell(){
	window.location.href='/shoeStore/payInfo/payCell.jsp';
}
function payTong(){
	window.location.href='/shoeStore/payInfo/payTong.jsp';
}
function payClose(){
	window.close();
}
</script>
</head>
<body>
<section>
	<article>
	<h1>결제 수단</h1>
	<h6>결제 수단을 클릭해주세요.</h6>
		<button class="paybigbtn" onclick="payCard();">카드결제</button>
		<button class="paybigbtn" onclick="payCell();">핸드폰결제</button>
		<button class="paybigbtn" onclick="payTong();">무통장입금</button>
		<br>
		<button class="paybtn" onclick="payClose();">취소</button>
	</article>
</section>
</body>
</html>