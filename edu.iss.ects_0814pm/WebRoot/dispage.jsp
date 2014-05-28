<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table width=450 class="fontwhite"  bordercolor="green" align="center">
    <tr>
	<td class='fontwhitetitle' align="center">

              共有 <font color=red>${pageController.totalRowsAmount}</font> 条记录
              共有 <font color=red>${pageController.totalPages}</font> 页
              当前是第 <font color=red>${pageController.currentPage}</font> 页
            ( 每页显示 <font color=red>${pageController.pageSize}</font> 条记录 )    
              &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    <tr>
    	<td align="center">
    	      <c:if test="${pageController.hasNext}">
              	<a href ="<%=request.getContextPath()%>/product.do?method=findAll&currentPageNo=${pageController.currentPage}&toPageNo=${pageController.nextPage}"><font class='fontwhite1'>下一页</font></a>
              </c:if>

              <c:forEach var="i" begin="1" end="${pageController.totalPages}">
              	<a href ="<%=request.getContextPath()%>/product.do?method=findAll&currentPageNo=${pageController.currentPage}&toPageNo=${i}"s><font class='fontwhite1'>${i}</font></a>
              </c:forEach>

              <c:if test="${pageController.hasPrevious}">
              	<a href="<%=request.getContextPath()%>/product.do?method=findAll&currentPageNo=${pageController.currentPage}&toPageNo=${pageController.previousPage}"><font class='fontwhite1'>上一页</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
              </c:if>
              
    	</td>
    </tr>
</table>
