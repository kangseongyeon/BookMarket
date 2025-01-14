<%@page import="dao.BookRepository"%>
<%@page import="vo.Book"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 정보</h1>
		</div>
	</div>
	<!--
		1) 넘겨받은 책 ID를 꺼내주세요.
		2) BookRepository를 이용해 instance를 받아주세요
		3) instance에서 책 id에 해당하는 책 정보를 꺼내주세요.
	-->
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			
			<div class="col-md-4">
				<img alt="" src="${pageContext.request.contextPath }/resources/images/<%=book.getFilename() %>" style="width: 100%" />
			</div>
			
			<div class="col-md-12">
				<h4><b>[<%=book.getCategory() %>] <%=book.getName() %></b></h4>
				<p><%=book.getDescription() %></p>
				<p><b>도서코드 : </b><span class="badge badge-danger"><%=book.getBookId() %></span></p>
				<p><b>출판사</b> : <%=book.getPublisher() %></p>			
				<p><b>저자</b> : <%=book.getAuthor() %></p>			
				<p><b>재고수</b> : <%=book.getUnitsInStock() %></p>
				<p><b>총 페이지수</b> : <%=book.getTotalPages() %></p>
				<p><b>출판일</b> : <%=book.getReleaseDate() %></p>
				<h4><%=book.getUnitPrice() %></h4>
				<form name="addForm" action="./addCart.jsp?id=" method="post">
					<input type="hidden" value="" name="id"/>
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문&raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니&raquo;</a> 
					<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
