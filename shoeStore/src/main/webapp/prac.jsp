<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go(i){
		var value=i;
		window.location.href='prac_ok.jsp?tab='+i;
	}
</script>
</head>
<body>
<button onclick="go(1)"></button>
</body>
</html>