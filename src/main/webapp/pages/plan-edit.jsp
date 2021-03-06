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
$(function(){
	//获取选中选项的值 
    $("#getValue").click(function(){
        var valArr = new Array();
        var nameArr = new Array();
        var i = 0; 
        $("[name='item-id']").each(function(){ 
            if($(this).is(":checked")){
            	valArr[i] = $(this).val(); 
	            i++;
            }
        }); 
        var vals = valArr.join(','); 

        $("[name='itemIds']").val(vals);
    }); 
    
	selectChk();
    function selectChk (){
        var planItemIds = $("#hdn_planItemIds").val();
        var planItemIdsArr = planItemIds.split(',');
        $.each(planItemIdsArr,function(i,n){
       		$("#chk_item_id_"+n).attr("checked",true);
        });
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
		
		<!-- 新增员工star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">方案管理</strong> / <small>编辑方案</small>
				</div>
			</div>
				
			<div class="am-u-sm-12">
		    	<form id="fm1" class="am-form am-form-horizontal" action="editPlan" method="post" data-am-validator>
		    	<fieldset>
		    		<input type="hidden" name="planVO.id" value="${planVO.id}" />
		    		<input type="hidden" name="itemIds" />
		    		<input type="hidden" id="hdn_planItemIds" name="planItemIds" value="${planItemIds}"/>
					<div class="am-g am-form-group">
						<label for="plan-name" class="am-u-sm-2 am-form-label">方案名称</label>
						<div class="am-u-sm-3">
							<label class="am-form-label" style="font-weight:normal;">${planVO.name}</label>
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						<label for="plan-price" class="am-u-sm-2 am-form-label">方案价格</label>
						<div class="am-u-sm-3">
							<input type="text" class="am-form-field am-input-sm" id="plan-price" name="planVO.price" 
								placeholder="请输入方案价格" maxlength="10" value="${planVO.price}">
						</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
					</div>
					
					<div class="am-g am-form-group am-form-select">
						<label for="plan-items" class="am-u-sm-2 am-form-label">关联项目</label>
			          	<div class="am-u-sm-3">
			            	 <label class="am-form-label" style="font-weight:normal;">
			            		<a href="#" data-am-modal="{target: '#my-popup'}"><span class="am-icon-search-plus" /></a>
			            	</label> 
			            	<!--<select multiple data-am-selected="{searchBox: 1}" minchecked="2">
			            		<s:iterator var="item" value="itemList">
							  	<option value="<s:property value='id'/>"><s:property value="name"/></option>
							  	</s:iterator>
							</select>-->
			          	</div>
			          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
			          	<label class="am-u-sm-2 am-form-label">&nbsp;</label>
						<div class="am-u-sm-3">&nbsp;</div>
						<label class="am-u-sm-1 am-form-label">&nbsp;</label>
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
											<th class="table-check"><input type="checkbox" /></th>
											<th width="150px">项目名称</th>
											<th width="120px">项目价格（￥）</th>
											<th >描述</th>								
										</tr>
									</thead>
									<tbody id="list">
										<s:iterator var="item" value="itemList"> 
										<tr>
											<td><input id="chk_item_id_<s:property value='id'/>" type="checkbox" name="item-id" value="<s:property value='id'/> " /></td>
											<td id="item-name"><s:property value="name"/></td>
											<td><s:property value="price"/></td>
											<td><s:property value="description"/></td>
										</tr>
										</s:iterator>								
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fl">
										<input type="button" id="getValue" value="确认" class="am-btn am-btn-default" data-am-modal-close>
										共 ${pi.total} 条记录
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