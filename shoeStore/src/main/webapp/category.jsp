<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
   function search(){
      var sea=document.getElementById("sear").value
      window.location.href="itemList.jsp?search="+sea
   }
</script>

<div class="cateGrouping">
   <nav>
       <ul>
          <li><a href="/shoeStore/item/itemList.jsp?category=1" class="groupLink"><strong>상품 전체보기</strong></a></li>
          <li><a href="/shoeStore/item/itemList.jsp?category=2" class="groupLink">자체제작</a></li>
         <li><a href="/shoeStore/item/itemList.jsp?category=3" class="groupLink">로퍼/플랫</a></li>
         <li><a href="/shoeStore/item/itemList.jsp?category=4" class="groupLink">스니커즈/슬립온</a></li>
         <li><a href="/shoeStore/item/itemList.jsp?category=5" class="groupLink">힐/펌프스</a></li>
         <li><a href="/shoeStore/item/itemList.jsp?category=6" class="groupLink">부츠</a></li>
         <li><a href="/shoeStore/item/itemList.jsp?category=7" class="groupLink">샌들</a></li>   
         <li>&nbsp;</li>
         <li>&nbsp;</li>
         <li>
            상품명 입력: <input type="text" id="sear">
            <button onclick="search()">검색</button>
         </li>
       </ul>
    </nav>
</div>