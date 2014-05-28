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
    <div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        	
        	<!--menu -->
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<jsp:include page="header2.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="header1.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>			
			<!--menu ends-->
            
            
       </div> 
       
       
       <div class="center_content">
       	<div class="left_content">
     <div id="search">
		<form action="product.do" method="post">
		  	<font size="3">图书搜索：</font>
		  	<select name="method">
			  	<option value="findByName">按书名查找</option>
			  	<option value="findByAuthor">按作者名查找</option>
			  	<option value="findByPublish">按出版社查找</option>
		  	</select>
		  	<input type="text" name="pName" />
		  	<input type="submit" name="" value="搜索" />	
		</form>
	</div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>图书列表</div> 
            
     <c:forEach items="${plist}" var="pp" varStatus="st">  
	     <div class="feat_prod_box">
            	<div class="prod_img">
            	<a href="product.do?method=findById&prodId=${pp.productId}">
            		<img src="${pp.image}" alt="" title="" border="0" width="90" height="120">
            	</a></div>
                
                <div class="prod_det_box">
                	<span class="special_icon" style="left: 318px; width: 1px;"></span>
                	<div class="box_top"></div>
                    <div class="box_center">
	                    <div class="prod_title"> 
	                    <a href="product.do?method=findById&prodId=${pp.productId}">
	                    ${pp.name}
	                    </a> 
	                    
	                    </div>
	                    <p class="details"> ${pp.description} </p> 
	                   
	                    <!-- 购物车 -->
	                    <a href="shopCart.do?method=addCar&prodId=${pp.productId}"> <img border="0" src="images/order_now.gif" alt="" title=""></a>
	                    <div class="clear"></div>
                    </div> 
                    <div class="box_bottom"></div>
                </div>    
            	<div class="clear"></div>
           </div>	
      </c:forEach>
	 	           
        <div class="pagination">
            <!-- 判断是否显示分页控制栏 -->
	        <c:if  test = "${not empty plist }" >
				<jsp:include  page="./dispage.jsp"></jsp:include>
			</c:if>  
         </div>
         
         <!-- 如果 集合对象中没有任何数据，提示用户，当前没有数据 -->
       <c:if test="${empty plist}">
       		<div class="feat_prod_box">
         			抱歉当前没有符合条件的商品信息!     
                    <div class="box_bottom"></div>
            </div>	
       </c:if> 	
            	   
        <br><br><br>
        
        <center>    
        <form action="product.do" method="post">
      	<input type="hidden" name="method" value="findAll"/>
      	<input type="submit" name="" value="返回图书列表"/>
        </form></center> 
                     
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
       <div class="right_content">
        
                <jsp:include page="items.jsp"></jsp:include>
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们</div> 
             <div class="about">
             <p> 
             <img src="images/about.gif" alt="" title="" class="right"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 馨馨网上书店 www.LLxb.cn 地理位置在昆山市花桥镇安博外包软件园，
             是一家经营计算机图书、经济管理图书、医学卫生图书、法律图书、旅游地理图书、生活休闲图书<a href="about.jsp">......</a>
<p> 
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>促销书</div> 
                    <div class="new_prod_box">
                        <a href="booklist.jsp">独唱团</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/duchangtuan.jpg" alt="" title="" class="thumb" border="0" width="60"></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="booklist.jsp">达芬奇密码</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/dafenqimima.jpg" alt="" title="" class="thumb" border="0" width="85" height="90"/></a>
                        </div>           
                    </div>                    
                    
                         
             
             </div>
             
             <div class="right_box">
             
             	
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>友情链接</div> 
                
                <ul class="list">
                <li><a href="http://www.taobao.com">淘宝网</a></li>
                <li><a href="http://www.dangdang.com">当当网</a></li>
                <li><a href="http://www.joyo.com">卓越亚马逊</a></li>
                <li><a href="http://http://www.bol.com.cn">贝塔斯曼书友会</a></li>                           
                </ul>      
                <br>
                <br>
                <br>
                <br>
				<br>
                
             <div class="new_prod_box">
                        <a href="booklist.jsp">单反圣经</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="booklist.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>        
             </div>         
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://csscreme.com"><img src="images/csscreme.gif" alt="by csscreme.com" title="by csscreme.com" border="0" /></a></div>
        <div class="right_footer">
        <a href="index.jsp">主页</a>
        <a href="about.jsp">关于我们</a>
        <a href="#">服务</a>
        <a href="#">隐私</a>
        <a href="contact.jsp">联系我们</a>
       
        </div>
        
       
       </div>
    

</div>
  </body>
</html>