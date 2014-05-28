<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
           prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
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
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
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
        	<div class="crumb_nav">
            <a href="index.jsp">主页</a> &gt;&gt; 书目
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Product name</div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="details.jsp"><img src="images/独唱团1.jpg" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="images/big-独唱团1.jpg" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">详情</div>
                    <p class="details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.<br />
                   Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.                    </p>
                    <div class="price"><strong>价格:</strong> <span class="red">100 元</span></div>
                    <div class="price"><strong>颜色:</strong> 
                    <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>                    </div>
                    
                    <a href="details.jsp" class="more"><img src="images/order_now.gif" alt="" title="" border="0" ></a>                  
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
              
            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">更多详情</a></li>
                <li><a class="" href="#tab2">相关图书</a></li>
                </ul>
    
            <div class="tabs-container">
            
                    <div style="display: block;" class="tab" id="tab1">
                                        <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                        </p>
                            <ul class="list">
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>                                          
                            </ul>
                                         <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                        </p>                           
                    </div>	
                    
                            <div style="display: none;" class="tab" id="tab2">
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>    

                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.jsp">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.jsp"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>  


                   
                    <div class="clear"></div>
                            </div>	
            
            </div>


			</div>
            

            
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


<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>
</html>