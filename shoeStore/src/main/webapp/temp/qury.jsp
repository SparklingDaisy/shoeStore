<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 
      div.container{
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 500px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but3 {
	background:black;
	border:2px solid white;
	border-radius:5px;
	padding:10px 30px;
	font-size:14px;
	transition:.5s ease;
	color:white;
    }
 
    .but4{
 	background:black;
	border:2px solid white;
	border-radius:5px;
	padding:10px 30px;
	font-size:14px;
	transition:.5s ease;
	color:white;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    p{
    font-size: 0.7em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
 
  </style>
</head>
<body>
  <form method="post" action="">
      <div class="container">
    <div class="insert">
    
        <table>
    <caption><h2>내 정보 양식</h2></caption>
    <tr>
        <td class="col1">ID</td>
        <td class="col2"><input type="text" name="mid" value="<%=dto.getMid() %>" readonly></td>
    </tr>
    <tr>
        <td class="col1">Password Confirm</td>
        <td class="col2">
            <input type="password"  name="mpwd">
        </td>
    </tr>
    <tr>
        <td class="col1">Password</td>
        <td class="col2">
            <input type="password" name="mpwd2">
        </td>
    </tr>
    <tr>
        <td class="col1">name</td>
        <td class="col2"><input type="password" value="<%=dto.getMname()%>" readonly></td>
    </tr>
   	<tr>
        <td class="col1">birthdate</td>
        <td class="col2"><input type="password" name="mbirthdate" value="<%=dto.getMbirthdate()%>"></td>
    </tr>
    <tr>
        <td class="col1">Phone number</td>
        <td class="col2"><input type="password" name="mtel" value="<%=dto.getMtel()%>"></td>
    </tr>
    <tr>
        <td class="col1">Address</td>
        <td class="col2"><input type="password" name="maddr" value="<%=dto.getMaddr()%>"></td>
    </tr>
    <tr>
        <td class="col1">E-mail Address</td>
        <td class="col2"><input type="password" name="memail" value="<%=dto.getMemail()%>"></td>
    </tr>
<!--  <tr>
        <td class="col1">E-mail</td>
        <td class="col2">
            <input type="text" name="mailid">
            <span class="a">@</span>
            <input type="text" name="email">
            <select name="mailslc">
                <option value="self" selected>직접입력</option>
                <option value="naver">naver.com</option>
                <option value="gm">gmail.com</option>
                <option value="da">daum.com</option>
                <option value="yah">yahoo.com</option>
            </select>
            <input class='but2' type="button" value="이메일 중복확인" onclick="">
        </td>
    </tr>-->
    <tr>
 
    </tr>
    </table>
    
  </div>
 
  <div class="create">
    
        <input class="but3" type="button" value="정보변경" onclick="">
        <input class="but4" type="button" value="취소" onclick="">
    
  </div>
  </div>
  </form>
 </body>
</html>
