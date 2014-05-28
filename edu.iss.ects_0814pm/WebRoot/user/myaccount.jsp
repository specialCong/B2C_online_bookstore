<%@ page language="java" import="java.util.*,edu.iss.ects.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
           prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>馨馨书店</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="style.css">
	
  </head>
  
  <body>
  <%
	User u = null;
	if(session.getAttribute("user")!=null)
	{
		u = (User)session.getAttribute("user");
	}
		
	%>
	
	<c:if test="${empty sessionScope.user}" >
		
	</c:if>
	
    <div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
       
        <!--menu -->
			<%
				if(u == null)
				{
			%>
			<jsp:include page="header2.jsp"></jsp:include>
			<%
				}else{
			%>
			<jsp:include page="header1.jsp"></jsp:include>
			<%
				}
			%>
	<!--menu ends-->   
            
            
       </div> 
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>订单列表</div>
 
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        
                	<div class="languages_box">
                  <span class="red">您好，欢迎来到馨馨书店，请<a href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.jsp">没有注册</a>?</span>
                </div>
                
                
                   <div class="cart">
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>购物车</div>
                  <div class="home_cart_content">
                  0件商品 | <span class="red">总价: 0元</span>
                  </div>
                  <a href="cart.jsp" class="view_cart">去看看</a>
              
              </div>
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" /> 馨馨书店</p><p>馨馨书店</p><p>馨馨书店<br></p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>促销书</div> 
                    <div class="new_prod_box">
                        <a href="booklist.jsp">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="booklist.jsp">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="booklist.jsp">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>             
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>类别</div> 
                
                <ul class="list">
                <li><a href="#">杂志</a></li>
                <li><a href="#">社会人文</a></li>
                <li><a href="#">艺术</a></li>
                <li><a href="#">小说</a></li>
                <li><a href="#">工具书</a></li>
                                                           
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>参与者</div> 
                
                <ul class="list">
                <li><a href="#">杂志</a></li>
                <li><a href="#">社会人文</a></li>
                <li><a href="#">艺术</a></li>
                <li><a href="#">小说</a></li>
                <li><a href="#">工具书</a></li>
                                           
                </ul>      
             
             </div>         
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://csscreme.com"><img src="images/csscreme.gif" alt="by csscreme.com" title="by csscreme.com" border="0" /></a></div>
        <div class="right_footer">
        <a href="#">主页</a>
        <a href="#">关于我们</a>
        <a href="#">服务</a>
        <a href="#">隐私</a>
        <a href="#">联系我们</a>
       
        </div>
        
       
       </div>
    

</div>

  </body>
</html>