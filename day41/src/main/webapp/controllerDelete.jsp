<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mDAO" class="model.dao.MemberDAO" />
<jsp:useBean id="mVO" class="model.vo.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
<%
	if(mDAO.delete(mVO)){
	%>
	<script type="text/javascript">
		alert('<%=mVO.getMpk()%>번 데이터 삭제완료!');
		location.href='main.jsp';
	</script>
	<%
	}
	else{
	%>
	<script type="text/javascript">
		alert('<%=mVO.getMpk()%>번 데이터 삭제실패...');
		location.href='main.jsp';
	</script>
	<%	
	}
%>>