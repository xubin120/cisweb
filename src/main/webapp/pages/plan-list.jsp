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
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/logo.jpg">
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css" />

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

		<!-- content start -->
		<div class="admin-content">
		
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">方案管理</strong>
				</div>
			</div>

			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-btn-toolbar am-fl am-cf">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-default btn-click" onclick="location.href='preAddPlan'">
								<span class="am-icon-plus"></span> 新增
							</button>
							<!-- 
							<button type="button" class="am-btn am-btn-default">
								<span class="am-icon-trash-o"></span> 删除
							</button>
							 -->
						</div>
					</div>
				</div>
				<!-- 
				<form class="am-form" action="findByKeyword" method="post">
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field" name="keyword" value="${keyword}"> 
							<span class="am-input-group-btn">
								<input type="submit" value="搜索" class="am-btn am-btn-default">
							</span>
						</div>
					</div>
				</div>
				</form>
				 -->
			</div>
			
			<div class="am-g">
				<div class="am-u-sm-12">
					<table class="am-table am-table-striped am-table-hover table-main">
						<thead>
							<tr>
								<th class="table-check"><input type="checkbox" /></th>
								<th >方案名称</th>
								<th width="220px">方案价格（￥）</th>
								<th width="280px">操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator var="plan" value="planList"> 
							<tr>
								<td><input type="checkbox" value="<s:property value='id'/> " /></td>
								<td><s:property value="name"/></td>
								<td><s:property value="price"/></td>
								<td>
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary btn-click" onclick="location.href='<s:url action="preEditPlan"><s:param name="planId" value="id" /></s:url>'">
												<span class="am-icon-pencil-square-o"></span> 编辑
											</button>
											<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger btn-click" onclick="location.href='<s:url action="deletePlan"><s:param name="planId" value="id" /></s:url>'">
												<span class="am-icon-trash-o"></span> 删除
											</button>
										</div>
									</div>
								</td>
							</tr>
							</s:iterator>								
						</tbody>
					</table>
					<div class="am-cf">
						<div class="am-fl">
							共 ${pi.total} 条记录
						</div>
						
						<div class="am-fr">
							<ul class="am-pagination">
								<li class="<c:if test="${pi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
									<a href="findAllPlan?currentPage=${pi.firstPage}">首页</a>
								</li>
								
								<c:forEach items="${pi.navigatepageNums}" var="pageNums">
									<li class="" value="${pageNums}" id="pageNum">
										<a href="findAllPlan?currentPage=${pageNums}">${pageNums}</a>
									</li>
								</c:forEach>
								
								<li class="<c:if test="${pi.hasNextPage=='false'}">am-disabled</c:if>">
									<a href="findAllPlan?currentPage=${pi.lastPage}">尾页</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		
		</div>
		<!-- content end -->
	</div>

	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>
