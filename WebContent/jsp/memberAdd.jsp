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
        <form class="layui-form" action="${pageContext.request.contextPath }/memberAdd.action">
          <div class="layui-form-item">
              <label for="L_custName" class="layui-form-label">
                  <span class="x-red">*</span>客户名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custName" class="layui-input">
              </div>
              <label  class="layui-form-label">
                  <span class="x-red">${message}</span>
              </label>
          </div>
          <div class="layui-form-item">
              <label for="L_custAge" class="layui-form-label">
                  <span class="x-red">*</span>年龄
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custAge" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="custGender" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
                  <select  name="custGender">
                  	<option value="男">男</option>
                  	<option value="女">女</option>
                  </select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="L_custSource" class="layui-form-label">
                  <span class="x-red">*</span>信息来源
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custSource" class="layui-input">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="L_custIndustry" class="layui-form-label">
                  <span class="x-red">*</span>所属行业
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custIndustry" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_custLevel" class="layui-form-label">
                  <span class="x-red">*</span>级别
              </label>
              <div class="layui-input-inline">
                  <select name="custLevel">
                  	<option value="vip">vip</option>
                  	<option value="guest">普通客户</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_custPhone" class="layui-form-label">
                  <span class="x-red">*</span>电话
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custPhone"class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_custEmail" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custEmail" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_custAddress" class="layui-form-label">
                  <span class="x-red">*</span>地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="custAddress"class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <!-- <input type="submit" class="layui-btn">添加</input> -->
              <input type="submit" value="添加" class="layui-btn"/>
              <%-- <a href="${pageContext.request.contextPath }/memberAdd.action" class="layui-btn">添加</a> --%>
              
          </div>
      </form>
    </div>
    
</html>