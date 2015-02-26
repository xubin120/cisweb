<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Cis 紫琳美疗信息系统</title>
<meta name="description" content="Cis 紫琳美疗信息系统">
<meta name="keywords" content="table">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">

<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">  

<link rel="icon" type="image/png" href="assets/i/logo.jpg">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">

<script src="assets/js/jquery-1.11.2.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script>
$(function() {
	//日历
	/**
	$( "#datepicker" ).datepicker({
		changeMonth: true,
    	changeYear: true
	});
	$( "#datepicker" ).datepicker( "option", "yyyy-MM-dd HH:mm:ss", $( this ).val() );
	*/

	$('[tabindex=1]').focus();

	//文本框只能输入数字，并屏蔽输入法和粘贴  
	$.fn.numeral = function() {     
    	$(this).css("ime-mode", "disabled");     
        this.bind("keypress",function(e) {     
	        var code = (e.keyCode ? e.keyCode : e.which);  //兼容火狐 IE      
	        if(!$.browser.msie&&(e.keyCode==0x8))  //火狐下不能使用退格键     
	        {     
	        	return ;     
	        }     
	        return code >= 48 && code<= 57;     
        });     
        this.bind("blur", function() {     
        	if (this.value.lastIndexOf(".") == (this.value.length - 1)) {     
            	this.value = this.value.substr(0, this.value.length - 1);     
            } else if (isNaN(this.value)) {     
                this.value = "";     
            }     
        });     
        this.bind("paste", function() {     
            var s = clipboardData.getData('text');     
            if (!/\D/.test(s));     
            value = s.replace(/^0*/, '');     
            return false;     
        });     
        this.bind("dragenter", function() {     
            return false;     
        });     
        this.bind("keyup", function() {     
        	if (/(^0+)/.test(this.value)) {     
            	this.value = this.value.replace(/^0*/, '');     
            }     
        });     
    };    
    //调用文本框的id  
	//$("#employee-age").numeral();

});
</script>
</head>

<body>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

	<!-- header -->
	<%@ include file="header.jsp" %>

	<!-- menu && content -->
	<div class="am-cf admin-main">
		<%@ include file="menu.jsp" %>
		
		<!-- 新增员工star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">员工管理</strong> / <small>新增员工</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="add" method="post">
		    		<input type="hidden" name="employeeVO.status" value="1" />
		    		<input type="hidden" name="employeeVO.isDelete" value="N" />
					<div class="am-g am-form-group">
						<label for="employee-name" class="am-u-sm-2 am-form-label">姓名</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employee-name" name="employeeVO.name" placeholder="请输入姓名" required maxlength="10" tabindex="1">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="employee-birthday" class="am-u-sm-2 am-form-label">出生年月</label>
						<div class="am-u-sm-3">
							<div class="am-form-group am-form-icon">
								<i class="am-icon-calendar"></i>
								<input type="date" class="am-form-field am-input-sm" name="employeeVO.birthday" placeholder="请选择出生年月" required>
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="employee-sex" class="am-u-sm-2 am-form-label">性别</label>
			          	<div class="am-u-sm-3">
				            <div class="am-input-group" id="employee-sex" data-am-input>
				            	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option1" value="1" /> 男
				              	</label>
				              	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option2" value="2" /> 女
				              	</label>
				            </div>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
			          	<label for="employee-phone" class="am-u-sm-2 am-form-label">电话</label>
						<div class="am-u-sm-3">
							<input type="tel" class="am-form-field am-input-sm" id="employee-phone" name="employeeVO.phone" placeholder="请输入电话" required maxlength="20">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
			        </div>
					
					<div class="am-g am-form-group">
						<label for="employee-number" class="am-u-sm-2 am-form-label">编号</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employee-number" name="employeeVO.number" placeholder="请输入编号" required maxlength="4">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="employee-qq" class="am-u-sm-2 am-form-label">QQ</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employee-qq" name="employeeVO.qq" placeholder="请输入QQ号" maxlength="20">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="employee-email" class="am-u-sm-2 am-form-label">邮箱</label>
						<div class="am-u-sm-3">
							<input type="email" class="am-form-field am-input-sm" id="employee-email" name="employeeVO.email" placeholder="请输入邮箱" maxlength="50">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="employee-address" class="am-u-sm-2 am-form-label">住址</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employee-address" name="employeeVO.address" placeholder="请输入住址" maxlength="200">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>

					<div class="am-g am-form-group">
						<label for="employee-address" class="am-u-sm-2 am-form-label">入职日期</label>
						<div class="am-u-sm-3">
							<div class="am-form-group am-form-icon">
								<i class="am-icon-calendar"></i>
								<input type="date" class="am-form-field am-input-sm" name="employeeVO.entryDate" placeholder="请选择入职日期" required>
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="employeeVO-departureDate" class="am-u-sm-2 am-form-label">离职日期</label>
			          	<div class="am-u-sm-3">
				            <div class="am-form-group am-form-icon">
								<i class="am-icon-calendar"></i>
								<input type="date" class="am-form-field am-input-sm" name="employeeVO.departureDate" placeholder="请选择离职日期">
							</div>
			          	</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-form-group">
						<label class="am-u-sm-2 am-form-label">&nbsp;</label>
			            <div class="am-u-sm-10">
			            	<input type="submit" name="" value="提交保存" class="am-btn am-btn-default">
			            </div>
		            </div>
				</form>
			</div>
			
		</div>
	</div>
	<!-- 新增员工end -->

	<!-- footer -->
	<%@ include file="footer.jsp" %>

	<!--[if (gte IE 9)|!(IE)]><!-->
	
	<!--<![endif]-->
	
</body>
</html>