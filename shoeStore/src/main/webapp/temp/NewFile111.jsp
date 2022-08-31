<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    width: 900px;
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
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
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
</style>
</head>
 <body>
  <form method="post" action="">
      <div class="container">
    <div class="insert">
    
        <table>
    <caption><h2>내 정보 수정</h2></caption>
    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="name" maxlength="5"></td>
    </tr>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="id" maxlength="10">
            <input class='but1' type="button" value="중복확인" onclick="">
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호</td>
        <td class="col2">
            <input type="password" name="pwd" maxlength="16">
            <p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
            10 ~ 16자리</span>로 입력이 가능합니다.</p>
        </td>
    </tr>
    <tr>
        <td class="col1">비밀번호 확인</td>
        <td class="col2"><input type="password" name="pwdCheck" maxlength="16"></td>
    </tr>
    <tr>
        <td class="col1">이메일</td>
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
    </tr>
    <tr>
        <td class="col1">학년/반</td>
        <td class="col2"><select name="grade">
            <option value="slc1" selected>선택</option>
            <option value="g1">1</option>
            <option value="g2">2</option>
            <option value="g3">3</option>
            <option value="g4">4</option>
            <option value="g5">5</option>
            <option value="g6">6</option>
        </select>
 
        <span class="g">학년</span>
 
        <select name="cls">
            <option value="slc2" selected>선택</option>
            <option value="c1">1</option>
            <option value="c2">2</option>
            <option value="c3">3</option>
            <option value="c4">4</option>
            <option value="c5">5</option>
        </select>
 
        <span class="c">반</span>
        
        </td>
 
    </tr>
    </table>
    
  </div>
 
  <div class="create">
    
        <input class="but3" type="button" value="가입취소" onclick="">
        <input class="but4" type="button" value="회원가입" onclick="formCheck(this.form)">
    
  </div>
  </div>
  </form>
 </body>
</html>