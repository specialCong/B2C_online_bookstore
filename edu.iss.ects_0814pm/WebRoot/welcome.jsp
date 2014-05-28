<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- 欢迎页面，一进入项目，通过该页面，跳转到  productServlet，查询所有产品 -->
<jsp:forward page="index.jsp" >
  <jsp:param value="findAll" name="method"/>
</jsp:forward>
