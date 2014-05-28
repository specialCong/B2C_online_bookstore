<%@ page language="java" import="java.util.*,edu.iss.ects.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
           prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



        
       <div class="feat_prod_box_details">
       
       <table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 width=""><b>序号</b></td>
			<td valign=middle align=center height=25 width=""><b>产品名称</b></td>
			<td valign=middle align=center height=25 width=""><b>价格</b></td>
			<td valign=middle align=center height=25 width=""><b>数量</b></td>
			<td valign=middle align=center height=25 width=""><b>合计</b></td>
			<td valign=middle align=center height=25 width=""><b>操作</b></td>
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
			onblur="javascript:if(this.value<1){alert('对不起，产品数量不能小于 1 ');this.focus();}else{number.value=this.value;}"/></td>
			<td class=tablebody2 valign=middle align=left width="">&nbsp;&nbsp;${line.product.price *line.amount}</td>
			<td class=tablebody2 valign=middle align=center width="">
			<!-- 隐藏表单域，传递必要的参数 -->
			<input type="hidden" value="${line.product.productId }"  name="product_id" />
			<input type="hidden" value="updateCart"  name="method" />
			
			
			<input type="button" value="返回" onclick="history.go(-1)"> 
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
                <td colspan="4" class="cart_total"><span class="red">购买商品总价为:</span></td>
                <td> ${total}</td>                
                </tr>                  
              </c:if>
            
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
            
            
            </table>
            </div>	
            
              

            


        
    
          
        
            
         
        
       
       
 
       
      
        
       


