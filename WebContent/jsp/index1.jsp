<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>仪器管理系统</title>
  <link rel="stylesheet" type="text/css" href="../introduce/easyui-1.5.2/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="../introduce/easyui-1.5.2/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="../introduce/easyui-1.5.2/themes/color.css">
  <link rel="stylesheet" type="text/css" href="../introduce/easyui-1.5.2/themes/demo.css">
  <script type="text/javascript" src="../introduce/easyui-1.5.2/jquery.min.js"></script>
  <script type="text/javascript" src="../introduce/easyui-1.5.2/jquery.easyui.min.js"></script>
  
  <script type="text/javascript">

    $(function () {

    });

    function addPanel(title, url) {
      if ($("#tt").tabs('exists', title)) {
        $("#tt").tabs('select', title);
      } else {
        var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
        $("#tt").tabs('add', {
          title: title,
          content: content,
          closable: true
        });
      }
    }

    function logout() {
      $.messager.confirm('退出', '您确定要退出本系统吗?', function (r) {
        if (r)
          location.href = '${pageContext.request.contextPath}/user/logout.action';
      })
    }

  </script>

</head>

<body class="easyui-layout">

  <div data-options="region:'north'" style="height: 65px; background-color: #0aA1E2;">
    <img alt="" src="../img/logo.jpg" style="height: 63px;">

    <div style="padding-right: 40px; float: right;height:50px;vertical-align:middle;line-height: 80px;">
      <font size="3" style="color:#FDFDFD; align:center;">操作者：${user.name}</font>&nbsp;&nbsp;
      <a id="loginOut" href=javascript:logout() style="color:#FDFDFD;text-decoration:none;font-size:12pt; align:center">退出系统</a>
    </div>
  </div>
  <div data-options="region:'south',split:true" style="height: 38px; text-align: center; line-height: 30px;">
    &nbsp;系统问题请联系管理员</div>

  <div data-options="region:'west',split:true" title="功能菜单" style="width: 200px; height: 100%">

    <c:if test="${user.type=='校内'}">
      <div class="easyui-accordion" style="width: 198; height: 100%;">
        <div title="业务管理" data-options="iconCls:'icon-ok'" style="overflow: auto; paddding-top: 10px; padding-left: 20px;">

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'" onclick="addPanel('仪器管理（负责人）','instrument/instrument.jsp');">仪器管理（负责人）</a>
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tip'" onclick="addPanel('服务时间','servicetime/servicetime.jsp');">仪器服务时间设置</a><br>


          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
            onclick="addPanel('预约管理','order/teacherSearch.jsp');">预约管理</a><br>

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
            onclick="addPanel('工作量统计（负责人）','workload/teacherWorkload.jsp');">工作量统计（负责人）</a><br>

          <c:if test="${user.lead=='是'}">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
              onclick="addPanel('预约信息查询(领导)','order/leaderSearch.jsp');">预约信息查询（领导）</a><br>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
              onclick="addPanel('工作量统计（领导）','workload/totalWorkload.jsp');">工作量统计（领导）</a><br>
          </c:if>
        </div>
        <c:if test="${user.admin=='是'}">
          <div title="管理员功能" data-options="iconCls:'icon-ok'" style="overflow: auto; paddding-top: 10px; padding-left: 20px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
              onclick="addPanel('实验室管理','admin/laboratory.jsp');">实验室管理</a><br>

            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'" onclick="addPanel('仪器','instrument/instrumentManager.jsp');">仪器管理</a>
            <br>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-man'" onclick="addPanel('用户管理','admin/user.jsp');">用户管理</a>

          </div>
        </c:if>
        <div title="系统管理" data-options="iconCls:'icon-ok'" style="overflow: auto; paddding-top: 10px; padding-left: 20px;">

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
            onclick="addPanel('修改密码','admin/modify.jsp');">修改密码</a><br>
        </div>

    </c:if>


  </div>

  </div>
  <div data-options="region:'center',iconCls:'icon-ok'">
    <div id="tt" class="easyui-tabs" style="width: 100%; height: 100%">
      <div title="欢迎页" iconCls="icon-ok" style="padding: 5px 10px; display: block; font-size:16px;">
        <p>本系统推荐使用最新版的Chrome浏览器、Firefox浏览器、360极速浏览器、360安全浏览器极速模式等浏览器。IE浏览器与Edge浏览器不推荐使用，尤其是IE浏览器。</p>
      </div>
    </div>
  </div>
</body>

</html>