<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.MemberVO , model.dao.MemberDAO"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="dao" class="model.dao.MemberDAO"></jsp:useBean>
    <jsp:useBean id="vo" class="model.vo.MemberVO"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표지페이지</title>
</head>
<body>

<form action="controllerInsert.jsp" method="post"><!-- db를 이용하는 액션은 post -->
	
		이름: <input type="text" name="name" required><br>
		점수: <input tpe="number" min="0" max="100" name="score" required><br>
		<input type="submit" value="데이터 등록하기">
</form>


<h1>데이터 목록</h1>
<hr>

<%
	if(dao.selectAll(vo).size()==0){
		out.println("<h3>출력할 데이터가 없습니다.</h3>");
	}
	else{
%>
<table border="2">
	<tr>
		<th>번호</th>
		<th>이름</th>
	</tr>
	<%
		for(MemberVO v:dao.selectAll(vo)){
	%>
	<tr>
		<th><%=v.getMpk()%></th>
		<td><a href="NewFile1.jsp?mpk=<%=v.getMpk()%>"><%=v.getName()%></a></td>
	</tr>
	<%
		}
	%>
</table>
<%
	}
%>

</body>
</html>