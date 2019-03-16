<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script>
    	function check()
    	{
    		var usercode = $("#userCode").val();
    		var userpassword = $("#userPassword").val();
    		if(usercode==""||userpassword=="")
    		{
    			$("#message").text("账号或密码不能为空！");
    			return false;
    		}
    		return true;
    	}
    </script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">客户管理登录</div>
        <div id="darkbannerwrap"></div>
        <form method="post"  class="login-form" 
        action="${pageContext.request.contextPath }/login.action">
            <input id="userCode" name="userCode" placeholder="账名"  type="text"/>
            <hr class="hr15">
            <input id="userPassword" name="userPassword" placeholder="密码"  type="password"/>
            <hr class="hr15">
            <input value="登录" style="width:100%;" type="submit" onclick="return check()"/>
            <hr class="hr20" >
        </form>
        <font color="red">
        	<span id="message">${msg}</span>
        </font>
    </div>
</body>
</html>