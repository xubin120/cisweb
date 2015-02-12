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
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/logo.jpg">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">

<script src="assets/js/jquery-1.11.2.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
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
					<strong class="am-text-primary am-text-lg">项目管理</strong> / <small>编辑项目</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="editItem" method="post">
					<div class="am-g am-form-group">
						<label for="item-name" class="am-u-sm-2 am-form-label">项目名称</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">${itemVO.name}</label>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="item-price" class="am-u-sm-2 am-form-label">项目价格</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="item-price" name="itemVO.price" 
								placeholder="请输入项目价格" value="${itemVO.price}" required maxlength="10">
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="item-description" class="am-u-sm-2 am-form-label">项目描述</label>
			          	<div class="am-u-sm-3">
			            	<textarea rows="4" cols="" class="am-form-field am-input-sm" id="item-description" 
									name="itemVO.description" placeholder="请输入项目描述" maxlength="50" required>${itemVO.description}</textarea>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
			          	<label for="item-phone" class="am-u-sm-2 am-form-label">&nbsp;</label>
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