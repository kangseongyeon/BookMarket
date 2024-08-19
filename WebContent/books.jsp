<%@page import="dao.BookRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Book"%>
<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>
      
	<%
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	
	<div class="container">	
		<!-- row 클래스명을 가지고 있는 div를 셋트로 Repository에서 얻어온 Book 전체 목록 데이터를 이용해 반복문을 돌려주세요 -->
			<%
				for (int i=0; i<listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
			%>
		<div class="row">
			<div class="col-md-3" align="center">	
				<img src="${pageContext.request.contextPath }/resources/images/<%=book.getFilename() %>" width="60%">
			</div>
			
			<div class="col-md-8">	
				<h5 ><b>[<%=book.getCategory() %>] <%=book.getName() %></b></h5>
				<p style="padding-top: 10px"><%=book.getDescription() %>...</p> 
				<p><%=book.getAuthor() %> | <%=book.getPublisher() %> | <%=book.getUnitPrice() %> 원</p>
			</div>
			<div class="col-md-1"  style="padding-top: 60px">							    			 
				<a href="./book.jsp?id=<%=book.getBookId() %>" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>				
		</div>
		<hr>
		<%
			}
		%>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>
