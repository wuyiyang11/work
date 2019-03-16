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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
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
    <!-- <script type="text/javascript">
    function search() {
            location.href = '${pageContext.request.contextPath}/selectCustomer.action';
      }
    </script> -->
</head>
 <body class="layui-anim layui-anim-up">
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
        <form class="layui-form layui-col-md12 x-so" action="<%=basePath%>selectCustomer.action">
          <input class="layui-input" placeholder="开始日" name="startTime" id="start" >
          <input class="layui-input" placeholder="截止日" name="endTime" id="end">
          <input type="text" name="custName"  placeholder="请输入客户名称" class="layui-input">

          <input type="submit" class="layui-btn" value="查询"/>
        </form>
      </div>
      <xblock>
<!--         <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> -->
        <button class="layui-btn" onclick="x_admin_show('添加用户','<%=basePath%>jsp/memberAdd.jsp',500,500)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${page.total }条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <!-- <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th> -->
            <th>ID</th>
            <th>用户名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>负责人ID</th>
            <th>来源</th>
            <th>所属行业</th>
            <th>级别</th>
            <th>电话</th>
            <th>地址</th>
            <th>创建时间</th>
            <th>操作</th>
            
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.rows }" var="customer">
        	<tr>
            <!-- <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td> -->
            <td>${customer.custId }</td>
            <td>${customer.custName}</td>
            <td>${customer.custAge}</td>
            <td>${customer.custGender}</td>
            <td>${customer.custUserId }</td>
            <td>${customer.custSource}</td>
            <td>${customer.custIndustry}</td>
            <td>${customer.custLevel }</td>
            <td>${customer.custPhone }</td>
            <td>${customer.custAddress }</td>
            <td><fmt:formatDate value="${customer.custCreatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','<%=basePath%>memberEdit.action?custId=${customer.custId }',600,400)" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>

              <a title="删除" onclick="member_del(${customer.custId })" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <itheima:page url="${pageContext.request.contextPath }/selectCustomer.action"></itheima:page>
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
      /*用户-删除*/
      function member_del(id){
    	  layer.confirm('确认要删除吗？',function(index){
    		  $.post("${pageContext.request.contextPath}/deleteCustomer.action",{"custId":id},function(data){
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
  </body>

</html>