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
$(function(){
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
	$("#hours").numeral();
	
	//获取选中选项的值
	//获取客户
    $("#customer-getValue").click(function(){
        var val;
        $("[name='customer-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='shopVO.customerId']").val(val);
    }); 

  	//获取美容师
    $("#employee-getValue").click(function(){
        var val;
        $("[name='employee-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='shopVO.employeeId']").val(val);
    });

  	//获取活动
    $("#activity-getValue").click(function(){
        var val;
        $("[name='activity-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='shopVO.activityId']").val(val);
    });

  	//获取方案
    $("#plan-getValue").click(function(){
        var val;
        $("[name='plan-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='shopVO.planId']").val(val);
    });

  	//获取项目
    $("#item-getValue").click(function(){
        var val;
        $("[name='item-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='shopVO.itemId']").val(val);
    });

  	//选中客户
    function selectCustomerChk (){
        var customerId = $("#hdn_customerId").val();
     	$("#radio_customer_id_"+customerId).attr("checked",true);
    }
    selectCustomerChk();

  	//选中美容师
    function selectEmployeeChk (){
        var employeeId = $("#hdn_employeeId").val();
     	$("#radio_employee_id_"+employeeId).attr("checked",true);
    }
    selectEmployeeChk();

  	//选中活动
    function selectActivityChk (){
        var activityId = $("#hdn_activityId").val();
     	$("#radio_activity_id_"+activityId).attr("checked",true);
    }
    selectActivityChk();

  	//选中方案
    function selectPlanChk (){
        var planId = $("#hdn_planId").val();
     	$("#radio_plan_id_"+planId).attr("checked",true);
    }
    selectPlanChk();

  	//选中项目
    function selectItemChk (){
        var itemId = $("#hdn_itemId").val();
     	$("#radio_item_id_"+itemId).attr("checked",true);
    }
    selectItemChk();

    $('#datetimepicker-arrivalTime').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd hh:ii'
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
		
		<!-- 新增店务记录star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">店务管理</strong> / <small>编辑店务记录</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="editShop" method="post" data-am-validator>
		    	<fieldset>
		    		<input type="hidden" name="shopVO.id" value="${shopVO.id}"/>
		    		<input type="hidden" id="hdn_customerId" name="shopVO.customerId" value="${shopVO.customerId}"/>
		    		<input type="hidden" id="hdn_employeeId" name="shopVO.employeeId" value="${shopVO.employeeId}"/>
		    		<input type="hidden" id="hdn_activityId" name="shopVO.activityId" value="${shopVO.activityId}"/>
		    		<input type="hidden" id="hdn_planId" name="shopVO.planId" value="${shopVO.planId}"/>
		    		<input type="hidden" id="hdn_itemId" name="shopVO.itemId" value="${shopVO.itemId}"/>
					<div class="am-g am-form-group">
						<label for="shop-arrival-time" class="am-u-sm-2 am-form-label">到店时间</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-arrivalTime" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="shopVO.arrivalTime" required readonly value="${shopVO.arrivalTime}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="shop-customer" class="am-u-sm-2 am-form-label">客户</label>
			          	<div class="am-u-sm-3">
			            	<label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-customer'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
			          	</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="shop-employee" class="am-u-sm-2 am-form-label">美容师</label>
						<div class="am-u-sm-3">
			            	<label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-employee'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
			          	</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
						<label for="shop-item" class="am-u-sm-2 am-form-label">项目</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-item'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
					</div>
					
					<div class="am-g am-form-group am-form-select">
						<label for="shop-room"  class="am-u-sm-2 am-form-label">房间</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="shop-room" name="shopVO.room" 
								placeholder="请输入房间" required maxlength="10" value="${shopVO.room}" />
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="shop-hours" class="am-u-sm-2 am-form-label">持续时间</label>
			          	<div class="am-u-sm-3">
			            	<input type="text" class="am-form-field am-input-sm" id="shop-hours" 
			            		name="shopVO.hours" placeholder="请输入持续时间" required maxlength="11" value="${shopVO.hours}">
			          	</div>
			          	<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
			        </div>
			        
			        <div class="am-g am-form-group am-form-select">
						<label for="shop-content"  class="am-u-sm-2 am-form-label">铺垫内容</label>
						<div class="am-u-sm-3">
							<textarea rows="4" cols="" class="am-form-field am-input-sm" id="shop-content" 
										name="shopVO.content" placeholder="请输入铺垫内容" maxlength="200">${shopVO.content}</textarea>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="shop-response" class="am-u-sm-2 am-form-label">客户反应</label>
			          	<div class="am-u-sm-3">
			            	<textarea rows="4" cols="" class="am-form-field am-input-sm" id="shop-response" 
										name="shopVO.response" placeholder="请输入客户反应" maxlength="200">${shopVO.response}</textarea>
			          	</div>
			          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
			        </div>
			        
			        <div class="am-g am-form-group">
						<label for="shop-activity" class="am-u-sm-2 am-form-label">活动</label>
						<div class="am-u-sm-3">
			            	<label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-activity'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
			          	</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="shop-plan" class="am-u-sm-2 am-form-label">方案</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-plan'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
			        
					<div class="am-popup" id="my-customer">
						<div class="am-popup-inner">
						    <div class="am-popup-hd">
						        <h4 class="am-popup-title">客户列表</h4>
						        <span data-am-modal-close class="am-close">&times;</span>
						    </div>
						    <div class="am-popup-bd">
						        <table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-check">&nbsp;</th>
											<th>客户姓名</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="customer" value="customerList"> 
										<tr>
											<td><input type="radio" id="radio_customer_id_<s:property value='id'/>" name="customer-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="customer-getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${cpi.total} 条记录
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${cpi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllCustomer?currentPage=${cpi.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${cpi.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllCustomer?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${cpi.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllCustomer?currentPage=${cpi.lastPage}">尾页</a>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						</div>
					</div>
			        
			        <div class="am-popup" id="my-employee">
						<div class="am-popup-inner">
						    <div class="am-popup-hd">
						        <h4 class="am-popup-title">美容师列表</h4>
						        <span data-am-modal-close class="am-close">&times;</span>
						    </div>
						    <div class="am-popup-bd">
						        <table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-check">&nbsp;</th>
											<th>美容师姓名</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="employee" value="employeeList"> 
										<tr>
											<td><input type="radio" id="radio_employee_id_<s:property value='id'/>" name="employee-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="employee-getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${epi.total} 条记录
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${epi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllEmployee?currentPage=${epi.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${epi.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllEmployee?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${epi.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllEmployee?currentPage=${epi.lastPage}">尾页</a>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						</div>
					</div>
			        
			        <div class="am-popup" id="my-activity">
						<div class="am-popup-inner">
						    <div class="am-popup-hd">
						        <h4 class="am-popup-title">活动列表</h4>
						        <span data-am-modal-close class="am-close">&times;</span>
						    </div>
						    <div class="am-popup-bd">
						        <table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-check">&nbsp;</th>
											<th>活动名称</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="activity" value="activityList"> 
										<tr>
											<td><input type="radio" id="radio_activity_id_<s:property value='id'/>" name="activity-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="activity-getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${api.total} 条记录
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${api.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllActivity?currentPage=${api.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${api.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllActivity?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${api.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllActivity?currentPage=${api.lastPage}">尾页</a>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						</div>
					</div>
			        
			        <div class="am-popup" id="my-plan">
						<div class="am-popup-inner">
						    <div class="am-popup-hd">
						        <h4 class="am-popup-title">方案列表</h4>
						        <span data-am-modal-close class="am-close">&times;</span>
						    </div>
						    <div class="am-popup-bd">
						        <table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-check">&nbsp;</th>
											<th>方案名称</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="plan" value="planList"> 
										<tr>
											<td><input type="radio" id="radio_plan_id_<s:property value='id'/>" name="plan-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="plan-getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${ppi.total} 条记录
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${ppi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllPlan?currentPage=${ppi.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${ppi.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllPlan?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${ppi.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllPlan?currentPage=${ppi.lastPage}">尾页</a>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						</div>
					</div>
			        
			        <div class="am-popup" id="my-item">
						<div class="am-popup-inner">
						    <div class="am-popup-hd">
						        <h4 class="am-popup-title">项目列表</h4>
						        <span data-am-modal-close class="am-close">&times;</span>
						    </div>
						    <div class="am-popup-bd">
						        <table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-check">&nbsp;</th>
											<th>项目名称</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="item" value="itemList"> 
										<tr>
											<td><input type="radio" id="radio_item_id_<s:property value='id'/>" name="item-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="item-getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${ipi.total} 条记录
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${ipi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllItem?currentPage=${ipi.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${ipi.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllItem?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${ipi.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllItem?currentPage=${ipi.lastPage}">尾页</a>
											</li>
										</ul>
									</div>
								</div>
						    </div>
						</div>
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