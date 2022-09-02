<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page import="com.shoe.item.Shoe_itemDTO"%>    
<jsp:useBean id="sdao" class="com.shoe.item.Shoe_itemDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdto" class="com.shoe.item.Shoe_itemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>
<%
String id = (String)session.getAttribute("sid");
//String id = request.getParameter("id");

String iidx_s = request.getParameter("iidx");
if(iidx_s==null || iidx_s.equals("")){
   iidx_s = "0";
}
int iidx = Integer.parseInt(iidx_s);

String icategory = request.getParameter("category");
Shoe_itemDTO dto = sdao.detailPage(sdto);
if(dto==null){
   %>
   <script>
   window.alert('삭제된 글 또는 잘못된 접근입니다.');
   window.location.href = 'itemContent.jsp?category=<%=icategory %>';
   </script>
   <%   
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=dto.getIname() %></title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/main.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/category.css">
<link rel="stylesheet" type="text/css" href="/shoeStore/css/item.css">
</head>
<body>
<%@include file="/header.jsp" %>
<%@include file="/category.jsp" %>
<section class="itemContentSect">
<form name="cart">
<input type="hidden" name="ciidx" value="<%=dto.getIidx() %>"> 
<input type="hidden" name="cid" value="<%=id %>"> 
<input type="hidden" name="cname" value="<%=dto.getIname() %>">
<input type="hidden" name="cprice" value="<%=dto.getIprice() %>">
   <article><br/>
      <h2>상품 상세 페이지</h2><br/>
   </article>
   <article id="itemContentpic">
      <%
      if(dto.getIimg()!=null){
         %>
         <img src="/shoeStore/item/itemimg/<%=dto.getIimg() %>" alt="<%=dto.getIimg() %>">
         <input type="hidden" name="cimg" value="<%=dto.getIimg() %>">
      <%
      } else if(dto.getIimg()==null){
      %>
         <img src="/shoeStore/img/noimage.gif">
         <input type="hidden" name="cimg" value=""><!-- null -->
      <%
      }
      %>
   </article>
   <article id="itemContentInfo">
   <table>
      <tr>
         <th>상품명</th>
         <td><%=dto.getIname() %></td>
      </tr>
      <tr>
         <th>금액</th>
         <td>
            <%
            DecimalFormat df = new DecimalFormat();
            df.applyLocalizedPattern("#,##0");
            int iprice = dto.getIprice(); 
            %>
            <%=df.format(iprice) %>원
         </td>
      </tr>
      <tr>
         <th>사이즈</th>
         <td>
            <select name="csize" id="itemSize">
            <%
            if(dto.getIsize()==null){
               %>
               <script>
               window.alert('삭제된 글 또는 잘못된 접근입니다.');
               window.history.back();
               </script>
               <%
               return;
            }
            String isizeArr[] = dto.getIsize().split(",");
            for(int i=0; i<isizeArr.length; i++){
               %>
               <option value="<%=isizeArr[i] %>"><%=isizeArr[i] %></option>
               <%
            }
            %>
            </select>
         </td>
      </tr>
      <tr>
         <th>구매수량</th>
         <td>
            <select name="ccnt" id="itemCount">
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="10">10</option>
            </select>
         </td>
      </tr>
      <tr>
         <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
         <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
         <td style="text-align: right">
            <button type="submit" formaction="itemContentToCart.jsp">장바구니</button>
         </td>
         <td>
            <button type="submit" formaction="/shoeStore/payInfo/payPopup.jsp" onclick="window.alert('바로결제 페이지로 이동합니다.');">바로결제</button>
         </td>
      </tr>
   </table>
   </article>
   <article id="itemContentBin">
      <div>&nbsp;</div>
   </article>
   <article id="itemContentDetails">
      <h4>상품 상세 설명</h4>
      <%=dto.getIview() %>
   </article>
</form>
</section>
<div id="itemContentClear">&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%@include file="/footer.jsp" %>
</body>
</html>