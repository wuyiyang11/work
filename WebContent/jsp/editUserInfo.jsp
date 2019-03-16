<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>客户管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="<%=basePath%>jsp/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>css/font.css">
    <link rel="stylesheet" href="<%=basePath%>css/xadmin.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>js/xadmin.js"></script>
</head>
<body> 
<div class="x-body">
        <form class="layui-form" action="${pageContext.request.contextPath }/editUserInfo.action">
        <input type="hidden" value="${user_session.userId }" name="userId">
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  用户账号：
              </label>
              <div class="layui-input-inline">
                  <label for="L_email" class="layui-form-label">
                  ${user_session.userId}
              	</label>
              	<label  class="layui-form-label">
                  <span class="x-red">${message}</span>
              </label>
              </div>
          </div>
          <!-- <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>旧密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="oldpass" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div> -->
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="userPassword" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repassword" class="layui-input">
                  <label  class="layui-form-label">
                  <span class="x-red">${message2}</span>
              </label>
              </div>
          </div>
          <div class="layui-form-item">
          <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value="修改" class="layui-btn"/>
          </div>
      </form>
    </div>
    
  </body>
</html>