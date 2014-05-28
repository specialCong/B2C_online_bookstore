<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"  %>
<%@page import="edu.iss.ects.entity.*" %>

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
                	<td>书名</td>
                	<td>作者</td>
                	<td>单价</td>
                    <td>数量</td>
                    <td>总计</td>
				</tr>
                 <c:forEach items="${list }" var="line" varStatus="status">     
		<tr>
		    <td class=tablebody2 valign=middle align=center width="">${line.product.name}</td>
		    <td class=tablebody2 valign=middle align=center width="">${line.product.author }</td>
			<td class=tablebody2 valign=middle align=center width="">${line.product.price }</td>
			<td class=tablebody2 valign=middle align=center width="">${line.amount }</td>
			<td class=tablebody2 valign=middle align=left width="">&nbsp;&nbsp;${line.product.price *line.amount}</td>
		</tr>
        </c:forEach>  
        
        <c:if test="${empty  list }">
        
          <td height="50" colspan="10" align="center">对不起，购物车中暂时没有商品信息</td>
        
        </c:if>      
		
		<c:if test="${ list != null }">
		<tr>
			<td class=tablebody2 valign=middle align=center colspan="2">　</td>
			<td class=tablebody2 valign=middle align=center width="">件 &nbsp;数:
			</td>
			<td class=tablebody2 valign=middle align=left width="">
			<font color="#ff0000"><b>${count}</b></font></td>
			<td class=tablebody2 valign=middle align=left width="">总 &nbsp;计:</td>
			<td class=tablebody2 valign=middle align=left width=""><font color="#ff0000"><b>${total}元</b></font></td>

		</tr>
		</c:if>
		 </table>
		 <br>


        
        <p align="Center"><h2>以下是用户注册送货信息确认,如果变化请先进行更新操作</h2></p>
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" >
			<b>用户注册信息确认</b></td>
		</tr>
		<input  type="hidden"  name="id"  value="${user.userId}" />
		<input  type="hidden"  name="info.id"  value="${user.info.contactinfoId}" />
		<tr>
			<td width="40%" class="tablebody2"><b>用户名</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			${user.name} 
		</tr>
		
		<tr>
			<td class="tablebody2"><b>联系地址1</b>：</td>
			<td class="tablebody1">
		    ${user.info.street1 }
			</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>联系地址2</b>：</td>
			<td class="tablebody1">
			 ${user.info.street2 }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>邮编</b>：</td>
			<td class="tablebody1">
			 ${user.info.zip }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>家庭电话</b>：</td>
			<td class="tablebody1">
			 ${user.info.homephone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>办公室电话</b>：</td>
			<td class="tablebody1">
			 ${user.info.officephone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>手机</b>：</td>
			<td class="tablebody1">
			 ${user.info.cellphone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>Email地址</b>：<br>
			</td>
			<td class="tablebody1">
			${user.info.email }</td>
		</tr>
		
	</table>
		<form   method="post"  
		        action="${pageContext.request.contextPath }/order.do" >
	    <input type="hidden" name="method" value="saveOrder" />  
	   
	    <table cellpadding="3" cellspacing="1" align="center"  id="table1">
		<tr>
			<td valign="middle"  class="tablebody2" colspan="2" align="center" height="25" >
			请选择付款方式
			</td>
			<td>
			<select  name="payway"> 
			<option value="1" checked>----现金付款----</option>
			<option value="2">----网银转帐----</option>
			<option value="3">----电子汇款----</option>
			
			</select>
			</td>
		</tr>
		</table>
		<p align="center">
		<input type="submit" value="提交订单" > 
		  &nbsp; &nbsp; &nbsp; &nbsp;
		  	<input type="button" value="取 &nbsp; 消"  onclick="history.go(-1)" > 
		</p>
		</form>

             </div>
           

            

            
        <div class="clear"></div>
        </div>
        
        <!--end of left content-->
        
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


       
<!-- 
<p align="Center">以下是购物车清单列表,请仔细检查所购商品</p>
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25  width=""><b>序号</b></td>
			<td valign=middle align=center height=25  width=""><b>价格</b></td>
			<td valign=middle align=center height=25  width=""><b>数量</b></td>
			<td valign=middle align=center height=25  width=""><b>合计</b></td>
			</tr>
         
        <c:forEach items="${list }" var="line" varStatus="status">     
		<tr>
		    <td class=tablebody2 valign=middle align=center width="">${status.count}</td>
			<td class=tablebody2 valign=middle align=center width="">${line.product.price }</td>
			<td class=tablebody2 valign=middle align=center width="">${line.amount }</td>
			<td class=tablebody2 valign=middle align=left width="">&nbsp;&nbsp;${line.product.price *line.amount}</td>
		</tr>
        </c:forEach>  
        
        <c:if test="${empty  list }">
        
          <td height="50" colspan="10" align="center">对不起，购物车中暂时没有商品信息</td>
        
        </c:if>      
		
		<c:if test="${ list != null }">
		<tr>
			<td class=tablebody2 valign=middle align=center colspan="2">　</td>
			<td class=tablebody2 valign=middle align=center width="">件 &nbsp;数:
			</td>
			<td class=tablebody2 valign=middle align=left width="">
			<font color="#ff0000"><b>${count}</b></font></td>
			<td class=tablebody2 valign=middle align=left width="">总 &nbsp;计:</td>
			<td class=tablebody2 valign=middle align=left width=""><font color="#ff0000"><b>${total}元</b></font></td>

		</tr>
		</c:if>
		 </table>
		 <br>
		 
<p align="Center">以下是用户注册送货信息确认,如果变化请先进行更新操作</p>
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" >
			<b>用户注册信息确认</b></td>
		</tr>
		<input  type="hidden"  name="id"  value="${user.userId}" />
		<input  type="hidden"  name="info.id"  value="${user.info.contactinfoId}" />
		<tr>
			<td width="40%" class="tablebody2"><b>用户名</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			${user.name} 
		</tr>
		
		<tr>
			<td class="tablebody2"><b>联系地址1</b>：</td>
			<td class="tablebody1">
		    ${user.info.street1 }
			</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>联系地址2</b>：</td>
			<td class="tablebody1">
			 ${user.info.street2 }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>邮编</b>：</td>
			<td class="tablebody1">
			 ${user.info.zip }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>家庭电话</b>：</td>
			<td class="tablebody1">
			 ${user.info.homephone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>办公室电话</b>：</td>
			<td class="tablebody1">
			 ${user.info.officephone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>手机</b>：</td>
			<td class="tablebody1">
			 ${user.info.cellphone }</td>
		</tr>
		<tr>
			<td class="tablebody2"><b>Email地址</b>：<br>
			</td>
			<td class="tablebody1">
			${user.info.email }</td>
		</tr>
		
	</table>
		<form   method="post"  
		        action="${pageContext.request.contextPath }/order.do" >
	    <input type="hidden" name="method" value="saveOrder" />  
	   
	    <table cellpadding="3" cellspacing="1" align="center"  id="table1">
		<tr>
			<td valign="middle"  class="tablebody2" colspan="2" align="center" height="25" >
			请选择付款方式
			</td>
			<td>
			<select  name="payway"> 
			<option value="1" checked>----现金付款----</option>
			<option value="2">----网银转帐----</option>
			<option value="3">----电子汇款----</option>
			
			</select>
			</td>
		</tr>
		</table>
		<p align="center">
		<input type="submit" value="提交订单"   /> 
		  &nbsp; &nbsp; &nbsp; &nbsp;
		  	<input type="button" value="取 &nbsp; 消"  onclick="history.go(-1)" /> 
		</p>
		</form>
 -->		
               


