<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta ht
	tp-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  	<form name="userinfo" id="userinfo" action="${pageContext.request.contextPath }/userUpdate_1" method="post">
        <table width="320" border="0" align="center" cellspacing="10">
     	<input type="hidden" name="id" value="${sessionScope.user.userId}" >
          <tr>
            <th width="100" align="center" valign="middle" scope="row">用户名:</th>
            <td width="186" align="left" valign="middle"><input name="username" type="text" value="${sessionScope.user.name }" size="20" maxlength="32" id="username" onkeypress="if(event.keyCode == 13) userinfo.password.focus() />
            <span class="star";>*</span></td>
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
            <td align="center" valign="middle"><input class= "register" type="submit" value="提交"  /></td>
          </tr>
        </table>
      </form> 
  	
  	
  	
  	
 </body>
</html>
