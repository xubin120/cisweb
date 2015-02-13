<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	/*
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
	$("#employee-age").numeral();

    //alert("${employee.sex}");
    //alert($("input[id='option1']").val());
    if(${employeeVO.sex}==1) {
    	$("input[id='option1']").prop("checked",true);
    } else {
    	$("input[id='option2']").prop("checked",true);
    }
    
    if(${employeeVO.status}==1) {
    	$("input[id='status1']").prop("checked",true);
    } else {
    	$("input[id='status2']").prop("checked",true);
    }

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
		
		<!-- 编辑员工star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">员工管理</strong> / <small>编辑员工</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="edit" method="post">
		    		<input type="hidden" name="employeeVO.id" value="${employeeVO.id}" />
		    		<input type="hidden" name="employeeVO.name" value="${employeeVO.name}" />
					<div class="am-form-group">
						<label for="employeeVO-name" class="am-u-sm-2 am-form-label">姓名</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">${employeeVO.name}</label>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">&nbsp;</label>
						<label for="employeeVO-age" class="am-u-sm-2 am-form-label">年龄</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employeeVO-age" name="employeeVO.age" placeholder="请输入年龄" required value="${employeeVO.age}" tabindex="1" maxlength="2">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
					</div>
					
					<div class="am-form-group">
						<label for="employeeVO-sex" class="am-u-sm-2 am-form-label">性别</label>
			          	<div class="am-u-sm-3">
				            <div class="am-input-group" id="employeeVO-sex" data-am-input>
				            	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option1" value="1" /> 男
				              	</label>
				              	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option2" value="2" /> 女
				              	</label>
				            </div>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
			          	<label for="employeeVO-phone" class="am-u-sm-2 am-form-label">电话</label>
						<div class="am-u-sm-3">
							<input type="tel" class="am-form-field am-input-sm" id="employeeVO-phone" name="employeeVO.phone" placeholder="请输入电话" required maxlength="20" value="${employeeVO.phone}">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
			        </div>
					
					<div class="am-g am-form-group">
						<label for="employeeVO-number" class="am-u-sm-2 am-form-label">编号</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employeeVO-number" name="employeeVO.number" placeholder="请输入编号" required maxlength="4" value="${employeeVO.number}">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="employeeVO-qq" class="am-u-sm-2 am-form-label">QQ</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employeeVO-qq" name="employeeVO.qq" placeholder="请输入QQ号" maxlength="20" value="${employeeVO.qq}">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="employeeVO-email" class="am-u-sm-2 am-form-label">邮箱</label>
						<div class="am-u-sm-3">
							<input type="email" class="am-form-field am-input-sm" id="employeeVO-email" name="employeeVO.email" placeholder="请输入邮箱" maxlength="50" value="${employeeVO.email}">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="employeeVO-address" class="am-u-sm-2 am-form-label">住址</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="employeeVO-address" name="employeeVO.address" placeholder="请输入住址" maxlength="200" value="${employeeVO.address}">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>

					<div class="am-g am-form-group">
						<label for="employeeVO-entryDate" class="am-u-sm-2 am-form-label">入职日期</label>
						<div class="am-u-sm-3">
							<div class="am-form-group am-form-icon">
								<i class="am-icon-calendar"></i>
								<input type="date" class="am-form-field am-input-sm" name="employeeVO.entryDate" placeholder="请选择入职日期" required value="${employeeVO.entryDate}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="employeeVO-departureDate" class="am-u-sm-2 am-form-label">离职日期</label>
			          	<div class="am-u-sm-3">
				            <div class="am-form-group am-form-icon">
								<i class="am-icon-calendar"></i>
								<input type="date" class="am-form-field am-input-sm" name="employeeVO.departureDate" placeholder="请选择离职日期" value="${employeeVO.departureDate}">
							</div>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="employeeVO-status" class="am-u-sm-2 am-form-label">状态</label>
			          	<div class="am-u-sm-3">
				            <div class="am-input-group" id="employeeVO-status" data-am-input>
				            	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.status" id="status1" value="1" /> 在职
				              	</label>
				              	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.status" id="status2" value="2" /> 离职
				              	</label>
				            </div>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label class="am-u-sm-2 am-form-label">&nbsp;</label>
						<div class="am-u-sm-3">&nbsp;</div>
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