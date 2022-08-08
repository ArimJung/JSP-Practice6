<%@page import="model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mDAO" class="model.dao.MemberDAO" />
<jsp:useBean id="mVO" class="model.vo.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
    <%
    MemberVO data = mDAO.selectOne(mVO);
	if(data==null){
		response.sendRedirect("main.jsp");
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
</head>
<body>

<form action="controllerUpdate.jsp" method="post">
번호: <input type="number" name="mpk" value="<%=data.getMpk()%>" required readonly> <br>
이름: <input type="text" name="name" value="<%=data.getName()%>" required> <br>
성적: <input type="number" name="score" min="0" max="100" value="<%=data.getScore()%>" required> <br><br>
<input type="submit" value="변경">
<input type="button" id="btn" onclick="del(<%=mVO.getMpk() %>);" value="삭제">
</form>

<script type="text/javascript">
	function del(mpk){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="controllerDelete.jsp?mpk="+mpk;
		}
		else{
			return false;
		}
	}
</script>
</body>
</html>