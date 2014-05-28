<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>我的购物车</div>
        
        	<div class="feat_prod_box_details">
            
            <table class="cart_table">
            	<tr class="cart_title">
                	<td>编号</td>
                	<td>书名</td>
                    <td>作者</td>
                    <td>数量</td>
                    <td>价格</td>
		    <td>操作</td>               
                </tr>
                 
                 <c:if test="${empty  sessionScope.cart}">
        <tr >
        <td height="50" colspan="10" align="center">对不起，购物车中暂时没有商品信息</td>
        </tr>
        </c:if>     
        
        
        <c:if test="${ not empty  sessionScope.cart  }">
        <c:forEach items="${list }" var="line" varStatus="status">     
		<tr>
			<form method="post" action="${pageContext.request.contextPath }/shopCart.do" name="f1">
			<input type="hidden" name="productid" value="2">
			<input type="hidden" name="number" value="1">
			<td class=tablebody2 valign=middle align=center width="">${status.count}</td>
			<td class=tablebody2 valign=middle width="">&nbsp;&nbsp;${line.product.name }</td>
			<td class=tablebody2 valign=middle align=center width="">${line.product.price }</td>
			<td class=tablebody2 valign=middle align=center width="">
			<input type="text" name="num" value="${line.amount }" size="4" 
			onblur="javascript:if(this.value<1){alert('对不起，产品数量不能小于 1 ');this.focus();}
			else{number.value=this.value;}"/></td>
			<td class=tablebody2 valign=middle align=left width="">&nbsp;&nbsp;${line.product.price *line.amount}</td>
			<td class=tablebody2 valign=middle align=center width="">
			<!-- 隐藏表单域，传递必要的参数 -->
			<input type="hidden" value="${line.product.productId }"  name="product_id" />
			<input type="hidden" value="updateCart"  name="method" />
			
			

			<input type="submit" value="保存修改">
			<input type="button" value="删除" onclick="javascript:window.location='${pageContext.request.contextPath }/shopCart.do?method=deleteCart&pid=${line.product.productId }';">
			</td>
			</form>
		</tr>
		
        </c:forEach>  
               
            	
                <tr>
                <td colspan="4" class="cart_total"><span class="red">购买货物总件数为:</span></td>
                <td> ${count}</td>                
                </tr>  
                <tr>
                <td colspan="4" class="cart_total"><span class="red">购买商品总价格为:</span></td>
                <td> ${total}</td>                
                </tr>                  
              </c:if>

<!--  
             <c:if test="${not empty  sessionScope.cart }">
             <td class=tablebody2 valign=middle align=center colspan="6">
             <input type="button" value="立即购买" onclick="javascript:window.location='${pageContext.request.contextPath }/order.do?method=checkOrder';"> 
			   &nbsp;&nbsp;
			   <input type="button" value="清空购物车" onclick="javascript:window.location='${pageContext.request.contextPath }/shopCart.do?method=clearCart';">
	
			&nbsp;&nbsp;
			<input type="button" value="继续购物" onclick="javascript:window.location='${pageContext.request.contextPath }/product.do?method=findAll';">
            </td>
            </c:if>
             
            <c:if test="${empty  sessionScope.cart }">
             <br><input type="button" value="点我购物" onclick="javascript:window.location='${pageContext.request.contextPath }/product.do?method=findAll';">
            
            </c:if>
            
-->
                 
<!--                  
                <tr>
                <td colspan="4" class="cart_total"><span class="red">总价:</span></td>
                <td> 300$</td>                
                </tr>                  
-->          
            </table>
        <a href="product.do?method=findAll" class="continue">&lt; 继续购物</a>
        <c:if test="${not empty cart}">
	    <a href="order.do?method=checkOrder" class="checkout">生成订单 &gt;</a>
		<a href="shopCart.do?method=clearCart" class="checkout">清空购物车</a>
        </c:if>  
            

             
            
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
</html>
