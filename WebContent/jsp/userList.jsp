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
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="<%=basePath%>selectUser.action">
        <input type="text" name="userCode"  placeholder="请输入用户账号" autocomplete="off" class="layui-input">
          <input type="text" name="userName"  placeholder="请输入用户名称" autocomplete="off" class="layui-input">
          <input type="submit" class="layui-btn" value="查询"/>
        </form>
      </div>
      <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','<%=basePath%>jsp/userAdd.jsp',500,400)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${page.total } 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>用户账号</th>
            <th>用户名</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
          <c:forEach items="${page.rows }" var="userInfo">
        	<tr>
            <!-- <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td> -->
            <td>${userInfo.userId }</td>
            <td>${userInfo.userCode }</td>
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
            <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','<%=basePath%>userEdit.action?userId=${userInfo.userId }',600,400)" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>

              <a title="删除" onclick="member_del(${userInfo.userId })" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <itheima:page url="${pageContext.request.contextPath }/selectUser.action"></itheima:page>
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      function member_del(id){
    	  layer.confirm('确认要删除吗？',function(index){
    		  $.post("${pageContext.request.contextPath}/deleteUser.action",{"userId":id},function(data){
  		  		if(data=="OK")
  		  			{
  		  				layer.msg('已删除!',{icon:1,time:1000});
  		  			}
  		  		else
  		  			{
  		  				layer.msg('未删除!',{icon: 5,time:1000});
  		  			}
  		  	})
    	  })
      }
    </script>
</html>