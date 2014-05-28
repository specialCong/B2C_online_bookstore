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
	<script language="JavaScript" type="text/javascript">
	function checkUserInfo() {
		var pw = document.userinfo.password.value;
		var s1 = document.userinfo.street1.value;
		var s2 = document.userinfo.street2.value;
		var city = document.userinfo.city.value;
		var zip = document.userinfo.zip.value;
		var email = document.userinfo.email.value;
		var hp = document.userinfo.homephone.value;
		var cp = document.userinfo.cellphone.value;
		var op = document.userinfo.officephone.value;
		var pat = new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]", "i");
		var em = new RegExp("^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$","gi");
		var zc= new RegExp("^[1-9][0-9]{5}$");
		var hpn=new RegExp("^ \\d{3}-\\d{7,8}|\\d{4}-\\d{7,8}$");
		var cpn=new RegExp("^(13[0-9]|15[0-9]|18[7-9])[0-9]{8}$");
		var opn=new RegExp("^ \\d{3}-\\d{7,8}|\\d{4}-\\d{7,8}$");
		if (pw == "") {
			alert("密码不能为空");
			document.userinfo.username.focus();
			return false;
		}  else if (pat.test(pw) == true) {
			alert('用户名或者密码含有非法字符');
			document.userinfo.username.focus();
			return false;
		} else if (s1 == "") {
			alert('至少需要填一个地址');
			document.userinfo.street1.focus();
			return false;
		} else if (city == "" || pat.test(city) == true) {
			alert('城市为空或者格式错误');
			document.userinfo.city.value = "";
			document.userinfo.city.focus();
			return false;
					} else if (zip == "" || zc.test(zip) == false) {
			alert('邮编为空或者格式错误');
			document.userinfo.zip.value = "";
			document.userinfo.zip.focus();
			return false;
		} else if (email == "" || em.test(email) == false) {
			alert('E-mail为空或者格式错误');
			document.userinfo.email.value = "";
			document.userinfo.email.focus();
			return false;

			} else if (hp != "") {if (hpn.test(hp) ==false) {
			alert('住宅电话格式错误');
			document.userinfo.homephone.value = "";
			document.userinfo.homephone.focus();
			return false;}
			} else if (cp == "" || cpn.test(cp) == false) {
			alert('移动电话为空或者格式错误');
			document.userinfo.cellphone.value = "";
			document.userinfo.cellphone.focus();
			return false;
			} else if(op != "") { if(opn.test(op) == false) {
			alert('办公电话格式错误');
			document.userinfo.officephone.value = "";
			document.userinfo.officephone.focus();
			return false;}
		} else {
			alert('修改成功');
			document.userinfo.submit();
			
		}
	}
</script>
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
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>用户信息</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
             请仔细填写以下详细信息
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">用户信息修改</div>
		<table  align="center">
		<tr>
		<td>${errorMessage }</td>
		</tr>
		</table> 
          <body>
  	<form name="userinfo" id="userinfo" action="${pageContext.request.contextPath }/userUpdate_1" method="post">
        <table width="320" border="0" align="center" cellspacing="10">
     	<input type="hidden" name="id" value="${sessionScope.user.userId}" >
          <tr>
            <th width="100" align="center" valign="middle" scope="row">用户名:<span></span></th>
            <td align="left" valign="middle"><input type="text" value="${sessionScope.user.name }" readonly/></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">密码:</th>
            <td align="left" valign="middle"><input name="password" type="password" value="${sessionScope.user.password }" id="password" size="20" maxlength="16" onkeypress="if(event.keyCode == 13) userinfo.password2.focus();" />
            <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">性别:</th>
            <td align="left" valign="middle"><input name="sex" type="radio" value="${sessionScope.userInfo1.sex }" checked="checked">男   
     <input type="radio" name="sex" value="女">女</td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">地址1:</th>
            <td align="left" valign="middle"><input name="street1" type="text" value="${sessionScope.userInfo1.street1 }" id="street1" size="20" maxlength="64" onkeypress="if(event.keyCode == 13) userinfo.street2.focus();" />
              <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">地址2:</th>
            <td align="left" valign="middle"><input name="street2" type="text" value="${sessionScope.userInfo1.street2 }" id="street2" size="20" maxlength="64" onkeypress="if(event.keyCode == 13) userinfo.city.focus();" /></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">城市:</th>
            <td align="left" valign="middle"><input name="city" type="text" value="${sessionScope.userInfo1.city }" id="city" size="20" maxlength="32" onkeypress="if(event.keyCode == 13) userinfo.zip.focus();" />
              <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">邮编:</th>
            <td align="left" valign="middle"><input name="zip" type="text" value="${sessionScope.userInfo1.zip }" id="zip" size="20" maxlength="16" onkeypress="if(event.keyCode == 13) userinfo.province.focus();" />
              <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">省份:</th>
            <td align="left" valign="middle"><select name="province" id="province">
              <option value="${sessionScope.province.provinceId}" selected="selected">${sessionScope.province.name }</option>
              <option value="1">安徽</option>
              <option value="2">北京</option>
              <option value="3">重庆</option>
            </select></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">国家:</th>
            <td align="left" valign="middle"><select name="country" id="country">
              <option value="1" selected="selected">${sessionScope.country.name}</option>
              <option value="1">中国</option>
            </select></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">E-mail:</th>
            <td align="left" valign="middle"><input name="email" type="text"  value="${sessionScope.userInfo1.email }" id="email" size="20" maxlength="64" onkeypress="if(event.keyCode == 13) userinfo.homephone.focus();" />
            <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">住宅电话:</th>
            <td align="left" valign="middle"><input name="homephone" type="text" value="${sessionScope.userInfo1.homephone }" id="homephone" size="20" maxlength="32" onkeypress="if(event.keyCode == 13) userinfo.cellphone.focus();" /></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">移动电话:</th>
            <td align="left" valign="middle"><input name="cellphone" type="text" value="${sessionScope.userInfo1.cellphone }" id="cellphone" size="20" maxlength="32" onkeypress="if(event.keyCode == 13) userinfo.officephone.focus();" />
              <span class="star">*</span></td>
          </tr>
          <tr>
            <th align="center" valign="middle" scope="row">办公电话:</th>
            <td align="left" valign="middle"><input name="officephone" type="text" value="${sessionScope.userInfo1.officephone }" id="officephone" size="20" maxlength="32" onkeypress="if(event.keyCode == 13) checkUserInfo();" /></td>
          </tr>
          <tr>
            <td align="center" valign="middle"><input class= "register" type="button" value="提交"  onclick="checkUserInfo()"/></td>
          </tr>
        </table>
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

