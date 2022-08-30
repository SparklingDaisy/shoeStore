<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	Shoe_memberDTO dto=mdao.myInfo(sid);

%>
