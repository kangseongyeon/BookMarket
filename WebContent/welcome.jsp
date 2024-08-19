<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>	
	<%@ include file="menu.jsp" %>
	
	<%!
		String greeting = "도서 웹 쇼핑몰";
		String tagline = "Welcome to Book Market";
	%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<main role="main">

	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
			<% 
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시각 : " + CT);
			%>
		</div>
		<hr>
	</div>
	</main>
	
	<%@ include file = "footer.jsp" %>
</body>
</html>