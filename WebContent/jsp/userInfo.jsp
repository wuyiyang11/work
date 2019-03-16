<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
    <script language="javascript">
    function close()
    {
    	 window.opener=null;
    	 window.open('','_self');
    	 window.close();
    }
    </script>
  </head>
<body>
<div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  用户ID:
              </label>
              <div class="layui-input-inline">
                  <label for="L_email" class="layui-form-label">
                  ${userInfo.userId}
              	</label>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  用户账号:
              </label>
              <div class="layui-input-inline">
                  <label for="L_email" class="layui-form-label">
                  ${userInfo.userCode}
              	</label>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  用户名称:
              </label>
              <div class="layui-input-inline">
                  <label for="L_email" class="layui-form-label">
                  ${userInfo.userName}
              	</label>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  用户状态:
              </label>
              <div class="layui-input-inline">
                  <label for="L_email" class="layui-form-label">
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
          </div>
      </form>
    </div>
    
  </body>
</html>