<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("username") == null || session.getAttribute("username").toString().equals(""))
	{
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}
%>