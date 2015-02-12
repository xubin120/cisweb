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
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/logo.jpg">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
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

<script>
$(function() {
	$('[tabindex=1]').focus();

	$("#btnSubmit").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();

		var jsonUser = {username:username, password:password};
		var strUser = JSON.stringify(jsonUser); 
		$.post("login",{json:strUser},callback,"json");
	});

	function callback(json) {
		alert(json.msg);
		if (json.suc == 1) {
			window.location.href = "pages/main.jsp";
		}
	}
});

function login() {
	var username = $("#username").val();
	var password = $("#password").val();

	//var jsonUser = {username:username, password:password};
	//var strUser = JSON.stringify(jsonUser); 
	//$.post("login",{json:strUser},callback,"json");

	
	$.ajax({
		type:"POST",
		url:"login",
		//data:"username="+username+"&password="+password,
		success:function(data) {
			var tip = "登录失败！";
			alert(data.result);
			switch(data.result) {
				case "input":
					tip="帐号或密码错误！";
					break;
				case "success":
					tip="登录验证成功，正在进入系统，请稍候...";
					var indexUrl = "pages/main.jsp";
					var appPath ="/"+location.pathname.split("/")[1] +"/";  
                    window.location.href = appPath+ indexUrl;
					break;
			}
		},
		beforeSend: function(formData, jqForm, options) {  
            $("#msg").html("正在登录，请稍候...");  
        },  
       	async: true 
       	
	});
}
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
					<!-- <input type="submit" name="" value="登 录" class="am-btn am-btn-default am-btn-sm am-fl"> --> 
					<input type="button" id="btnSubmit" value="登 录" class="am-btn am-btn-default am-btn-sm am-fl" onclick="login();"> 
				</div>
			</form>
			<!-- footer -->
			<%@ include file="pages/footer.jsp" %>
		</div>
	</div>
</body>
</html>