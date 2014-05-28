<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="edu.iss.ects.entity.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
           prefix="c" %>
<c:choose>
	    <c:when test="${empty sessionScope.user}">
		<span class="red">您好，欢迎来到馨馨书店，请
		<a href="login.jsp">登录</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.jsp">没有注册
        </a>
        </span>
	    </c:when>
	    <c:otherwise>
		<span class="red"> 
        <p>欢迎&nbsp;&nbsp; <blink>${sessionScope.user.name}  </blink> 光临我们网站</p>
        <p>您可以进行　<a href="userUpdate">注册信息修改</a>　或者
        <a href="logout.jsp">注销</a>
        
        </p>
        </span>
	    </c:otherwise>
		</c:choose>	
        
        <div class="cart">
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>购物车</div>
                 
                 
                 
         <c:choose>
	    <c:when test="${empty sessionScope.cart}">
		<div class="home_cart_content">
		<span class="red">
		您还没有购买商品 
        </span>
        </div>
	    </c:when>
	    <c:otherwise>
	    <div class="home_cart_content">
		<span class="red"> 
        ${sessionScope.cart.count}件商品 | 总价: ${sessionScope.cart.total}元</span>
        </div>
        <span class="red"> 
        <a href="cart.jsp" class="view_cart">去看看</a>    
        </span>
	    </c:otherwise>
		</c:choose>	
                 
     </div>
