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
	<script language="javascript" type="text/javascript">
		function clearText(object,value){
		if(object.value==value)object.value="";
		}
		function resumeText(object,value){
		if(object.value=="")object.value=value;
		}
		function login(){ 
		if(form1.username.value==""){ 
		alert("请输入用户名！"); 
		return false; 
		} 
		if(form1.password.value==""){ 
		alert("请输入密码！"); 
		return false; 
		} 
		if(form1.checkcode.value==""){ 
		alert("请输入验证码！"); 
		return false; 
		} 
		if(form1.checkcode.value!=document.getElementById("verifycode").innerHTML){ 
		alert("验证码不正确！"); 
		createcode();
		return false; 
		} 
		form1.submit(); 
		}
		function RandNo(){
		var code="";
		var array=new Array(0,1,2,3,4,5,6,7,8,9);
		for(var i=0;i<4;i++){
		   var index = Math.floor(Math.random()*10); 
		   code+=array[index];
		}
		document.getElementById("verifycode").innerHTML=code; 
		}
</script>
  </head>
  
  <body onload="RandNo();">
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
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>用户登录</div>
        
        	<div class="feat_prod_box_details">
            <p class="details"> 
             请输入用户名和密码 
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">登陆账户</div>
		<table  align="center">
		<tr>
		<td>${errorMsg }</td>
		</tr>
		</table> 
                 <form name="form1" method="POST" action="${pageContext.request.contextPath }/logIn">         
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input type="text" class="contact_input" value="请输入用户名" name="username" onfocus="clearText(this,'请输入用户名')" onblur="resumeText(this,'请输入用户名')">
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input type="password" class="contact_input" name="password" />
                    </div>                     

				   <div class="form_row">
                    <label class="contact"><strong>验证码:</strong></label>
                    <input type="text" name="checkcode" maxlength="4" size="4"><label class="label" id="verifycode" style="background:gray">8888</label>
                    </div>  
           
                    <div>
                    <input type="button" class="register" value="登陆" onclick="login()">
                    </div>   
                    
                  </form>     
                    
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
</html>