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
<div class="x-body layui-anim layui-anim-up">
        <form class="layui-form" action="${pageContext.request.contextPath }/userAdd.action">
          <div class="layui-form-item">
              <label for="L_userCode" class="layui-form-label">
                  <span class="x-red">*</span>用户账号
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="userCode" class="layui-input">
              </div>
              <label  class="layui-form-label">
                  <span class="x-red">${message}</span>
              </label>
          </div>
          <div class="layui-form-item">
              <label for="L_userName" class="layui-form-label">
                  <span class="x-red">*</span>用户名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="userName" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_userPassword" class="layui-form-label">
                  <span class="x-red">*</span>用户密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="userPassword" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="userState" class="layui-form-label">
                  <span class="x-red">*</span>用户状态
              </label>
              <div class="layui-input-inline">
                  <select  name="userState">
                  	<option value="1">启用</option>
                  	<option value="0">停用</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value="添加" class="layui-btn"/>
          </div>
      </form>
    </div>
</body>
</html>