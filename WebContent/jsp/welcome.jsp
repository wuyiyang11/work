<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();//得到当前系统时间
	String str_date1 = formatter.format(currentTime); //将日期时间格式化
	String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
 <meta charset="UTF-8">
 <title>客户管理系统</title>
 <meta name="renderer" content="webkit">
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
 <link rel="shortcut icon" href="<%=basePath%>jsp/favicon.ico" type="image/x-icon" />
 <link rel="stylesheet" href="<%=basePath%>css/font.css">
 <link rel="stylesheet" href="<%=basePath%>css/xadmin.css">
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎管理员：
            <span class="x-red">${user_session.userName}</span>！登录时间:<%= str_date1%></blockquote>
        
        <fieldset class="layui-elem-field">
            <legend >系统通知</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                       
                        <tr>
                            <td >
                                <span class='x-a'>欢迎登录本系统！</span>
                            </td>
                            
                        </tr>
                        <tr>
                        <td >
                             <span >本系统功能逐渐完善！</span>
                        </td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
       
        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        
                        <tr>
                            <th>开发者</th>
                            <td>吴贻洋-王冠贻-赵朋朋</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote>
    </div>
    </body>
</html>