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
<link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css" />

<script src="assets/js/jquery-1.11.2.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datetimepicker.min.js"></script>
<script src="assets/js/cis.js"></script>
<script>
$(function() {

	$('[tabindex=1]').focus();

    $('#datetimepicker-birthday').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd',
    	minView: 2
    });

    $('#datetimepicker-entryDate').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd',
    	minView: 2
    });

    $('#datetimepicker-departureDate').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd',
    	minView: 2
    });

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
		    	<form id="fm1" class="am-form am-form-horizontal" action="edit" method="post" data-am-validator>
		    	<fieldset>
		    		<input type="hidden" name="employeeVO.id" value="${employeeVO.id}" />
		    		<input type="hidden" name="employeeVO.name" value="${employeeVO.name}" />
					<div class="am-form-group">
						<label for="employeeVO-name" class="am-u-sm-2 am-form-label">姓名</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">${employeeVO.name}</label>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">&nbsp;</label>
						<label for="employeeVO-birthday" class="am-u-sm-2 am-form-label">出生年月</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-birthday" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="employeeVO.birthday" placeholder="请选择出生年月" required readonly value="${employeeVO.birthday}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
					</div>
					
					<div class="am-form-group">
						<label for="employeeVO-sex" class="am-u-sm-2 am-form-label">性别</label>
			          	<div class="am-u-sm-3">
				            <div class="am-form-group" id="employeeVO-sex">
				            	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option1" value="1" required <s:if test='%{employeeVO.sex == 1}'>checked</s:if>/> 男
				              	</label>
				              	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.sex" id="option2" value="2" <s:if test='%{employeeVO.sex == 2}'>checked</s:if>/> 女
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
							<div class="am-input-group am-form-icon date" id="datetimepicker-entryDate" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="employeeVO.entryDate" placeholder="请选择入职日期" required readonly value="${employeeVO.entryDate}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
						<label for="employeeVO-departureDate" class="am-u-sm-2 am-form-label">离职日期</label>
			          	<div class="am-u-sm-3">
				            <div class="am-input-group am-form-icon date" id="datetimepicker-departureDate" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="employeeVO.departureDate" placeholder="请选择离职日期" readonly value="${employeeVO.departureDate}">
							</div>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="employeeVO-status" class="am-u-sm-2 am-form-label">状态</label>
			          	<div class="am-u-sm-3">
				            <div class="am-form-group" id="employeeVO-status">
				            	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.status" id="status1" value="1" <s:if test='%{employeeVO.status == 1}'>checked</s:if>/> 在职
				              	</label>
				              	<label class="am-radio am-radio-inline">
				                	<input type="radio" name="employeeVO.status" id="status2" value="2" <s:if test='%{employeeVO.status == 2}'>checked</s:if>/> 离职
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
		        </fieldset>
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