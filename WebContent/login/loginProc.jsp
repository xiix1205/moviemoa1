<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="sign.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String url = "login.jsp";
String msg = "로그인에 실패 하였습니다.";

boolean result = mMgr.loginMember(id, pwd);
if (result) {
	session.setAttribute("idKey", id);
	msg = "로그인에 성공 하였습니다.";
	url = "../main/main.jsp";
}
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>
