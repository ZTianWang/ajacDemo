<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	if(request.getMethod().equals("GET")){
		out.println("Get:"+userName+","+userBirth);
		System.out.println("Get:"+userName+","+userBirth);
	}else{
		out.println("Post:"+userName+","+userBirth);
		System.out.println("Post:"+userName+","+userBirth);
	}
%>