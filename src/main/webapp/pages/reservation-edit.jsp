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
<link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">

<script src="assets/js/jquery-1.11.2.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datetimepicker.min.js"></script>
<script src="assets/js/cis.js"></script>
<script>
$(function(){
	//获取选中选项的值 
    $("#getValue").click(function(){
        var val;
        $("[name='customer-id']").each(function(){ 
            if($(this).is(":checked")){
            	val = $(this).val(); 
            }
        }); 

        $("[name='reservationVO.customerId']").val(val);
    }); 

    selectChk();
    function selectChk (){
        var customerId = $("#hdn_customerId").val();
     	$("#radio_customer_id_"+customerId).attr("checked",true);
    }

    $('#datetimepicker-date').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd',
    	minView: 2
    });
    
    $('#datetimepicker-shopTime').datetimepicker({
    	language:  'zh-CN',
    	format: 'yyyy-mm-dd hh:ii'
    });

    $('#datetimepicker-antiShopTime').datetimepicker({
  	  	language:  'zh-CN',
    	format: 'yyyy-mm-dd hh:ii'
  	});

    $('#datetimepicker-antiShopRemindTime').datetimepicker({
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
		
		<!-- 新增员工star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">约客管理</strong> / <small>编辑约客记录</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="editReservation" method="post" data-am-validator>
		    	<fieldset>
		    		<input type="hidden" name="reservationVO.id" value="${reservationVO.id}" />
		    		<input type="hidden" id="hdn_customerId" name="reservationVO.customerId" value="${reservationVO.customerId}"/>
					<div class="am-g am-form-group">
						<label for="plan-name" class="am-u-sm-2 am-form-label">日期</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-date" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="reservationVO.date" readonly required value="${reservationVO.date}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label" style="color: red">* 必填</label>
						<label for="plan-price" class="am-u-sm-2 am-form-label">预约到店时间</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-shopTime" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="reservationVO.shopTime" readonly value="${reservationVO.shopTime}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group">
						<label for="plan-name" class="am-u-sm-2 am-form-label">反预约时间</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-antiShopTime" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="reservationVO.antiShopTime" readonly value="${reservationVO.antiShopTime}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="plan-price" class="am-u-sm-2 am-form-label">反预约提醒时间</label>
						<div class="am-u-sm-3">
							<div class="am-input-group am-form-icon date" id="datetimepicker-antiShopRemindTime" >
								<span class="am-input-group-label add-on"><i class="icon-th am-icon-calendar"></i></span>
								<input type="text" class="am-form-field am-input-sm" name="reservationVO.antiShopRemindTime" readonly value="${reservationVO.antiShopRemindTime}">
							</div>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group am-form-select">
						<label for="mark"  class="am-u-sm-2 am-form-label">备注</label>
						<div class="am-u-sm-3">
							<textarea rows="4" cols="" class="am-form-field am-input-sm" id="mark" 
								name="reservationVO.mark" placeholder="请输入备注" maxlength="200">${reservationVO.mark}</textarea>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="plan-items" class="am-u-sm-2 am-form-label">关联客户</label>
			          	<div class="am-u-sm-3">
			            	 <label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-popup'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
			          	</div>
			          	<label class="am-u-sm-1 am-form-label" style="color: red">* 必选</label>
			        </div>
			        
					<div class="am-popup" id="my-popup">
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
											<th width="150px">客户姓名</th>
											<th width="120px">电话</th>
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="customer" value="customerList"> 
										<tr>
											<td><input type="radio" id="radio_customer_id_<s:property value='id'/>" name="customer-id" value="<s:property value='id'/> " /></td>
											<td><s:property value="name"/></td>
											<td><s:property value="phone"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										共 ${pi.total} 条记录
										<input type="button" id="getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
									</div>
									
									<div class="am-fr">
										<ul class="am-pagination">
											<li class="<c:if test="${pi.hasPreviousPage=='false'}">am-disabled</c:if>"> 
												<a href="findAllItem?currentPage=${pi.firstPage}">首页</a>
											</li>
											
											<c:forEach items="${pi.navigatepageNums}" var="pageNums">
												<li class="" value="${pageNums}" id="pageNum">
													<a href="findAllItem?currentPage=${pageNums}">${pageNums}</a>
												</li>
											</c:forEach>
											
											<li class="<c:if test="${pi.hasNextPage=='false'}">am-disabled</c:if>">
												<a href="findAllItem?currentPage=${pi.lastPage}">尾页</a>
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