<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Cis 登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">

<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">  

<link rel="icon" type="image/png" href="assets/i/logo.jpg">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />

<script src="assets/js/jquery-1.11.2.min.js"></script>
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>

<script type="text/javascript">
$(function() {
	$("#username").focus();

	$("#btnSubmit").click(function(){
		//将input元素的name和value序列化成json数据格式
		var params=$('input').serialize();

		$.ajax({
			type:"POST",
			url:"login",			
			dataType:"text",
	        data:params,
	        success:function(data) {
		        
		        if("error"==data) {
		        	$("#msg").html("<font color='red'>用户名或密码错误，请重新输入！</font>"); 
		        	$("#username").val("");
		        	$("#password").val("");
		        	$("#username").focus(); 
			    } else {
					self.location.href="toMainPage";
				}
	        }
		});
	});

});
</script>
</head>
<body>
	<div class="header">
		<div class="am-g">
			<h1>Cis 紫琳美疗信息系统</h1>
		</div>
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<hr>
			<span id="msg"></span>
			<br>
			<form method="post" class="am-form" action="login">
				<label for="username">用户名:</label> 
					<input type="text" class="am-form-field" name="loginVO.username" id="username" placeholder="请输入用户名" required tabindex="1" maxlength="10"> <br> 
				<label for="password">密码:</label>
					<input type="password" class="am-form-field" name="loginVO.pwd" id="password" placeholder="请输入密码" required tabindex="2" maxlength="20"> <br>
				<div class="am-cf">
					<input type="button" id="btnSubmit" value="登 录" class="am-btn am-btn-default am-btn-sm am-fl"> 
				</div>
			</form>
			<!-- footer -->
			<br>
			<%@ include file="pages/footer.jsp" %>
		</div>
	</div>
</body>
</html>