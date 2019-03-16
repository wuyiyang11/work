<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<%@ taglib uri="http://itcast.cn/common/"  prefix="itheima"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="renderer" content="webkit">
	<title>客户管理系统</title>
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
        <span class="x-right" style="line-height:40px">共有数据：${page.total } 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
          	<th>用户ID</th>
            <th>用户姓名</th>
            <th>状态</th>
            <th>客户编号</th>
            <th>客户姓名</th>
            <th>所属行业</th>
            <th>客户电话</th>
        </thead>
        <tbody>
          <c:forEach items="${page.rows }" var="userInfo">
          <c:forEach items="${ userInfo.customers}" var="customer">
	          <tr>
	            <td>${userInfo.userId }</td>
	            <td>${userInfo.userName }</td>
	            <div class="layui-input-inline">
	                  <label class="layui-form-label">
	                  <c:if test="${userInfo.userState==1 }">
						<td class="td-status">
	              		<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
					  </c:if>
					   <c:if test="${userInfo.userState==0 }">
					   <td class="td-status">
						<span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已停用</span></td>
					  </c:if>
	              	</label>
	              </div>
            	<td>${customer.custId }</td>
            	<td>${customer.custName }</td>
            	<td>${customer.custIndustry }</td>
            	<td>${customer.custPhone }</td>
            	</tr>
            	</c:forEach>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <itheima:page url="${pageContext.request.contextPath }/selectUserCustomer.action"></itheima:page>
      </div>

    </div>
</body>
</html>