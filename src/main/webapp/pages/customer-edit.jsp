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
<script>
$(function() {

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
	$("#customer-age").numeral();
	
	if(${customerVO.sex}==1) {
    	$("input[id='customerMan']").prop("checked",true);
    } else {
    	$("input[id='customerWoman']").prop("checked",true);
    }

    if(${customerVO.customerType}==1) {
    	$("input[id='ctMember']").prop("checked",true);
    } else {
    	$("input[id='ctPotential']").prop("checked",true);
    }

    if(${customerVO.customerInfo.childrenSex}==1) {
    	$("input[id='boy']").prop("checked",true);
    } else {
    	$("input[id='girl']").prop("checked",true);
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
		
		<!-- 编辑客户star -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">客户管理</strong> / <small>编辑客户信息</small>
				</div>
			</div>
			
			<div class="am-tabs am-margin" data-am-tabs>
			    <ul class="am-tabs-nav am-nav am-nav-tabs">
			      	<li class="am-active"><a href="#tab1">基本信息</a></li>
			      	<li><a href="#tab2">扩展信息</a></li>
			    </ul>
			    
		    	<form id="fm1" class="am-form am-form-horizontal" action="editCustomer" method="post">
	    		<input type="hidden" name="customerVO.id" value="${customerVO.id}" />
	    		<input type="hidden" name="customerVO.name" value="${customerVO.name}" />
	    		<input type="hidden" name="customerVO.customerInfo.customerId" value="${customerVO.customerInfo.customerId}" />
				<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab1">
							<div class="am-u-sm-12">
								<div class="am-g am-form-group">
									<label for="customer-name" class="am-u-sm-2 am-form-label">客户姓名</label>
									<div class="am-u-sm-3">
										<label class="am-form-label" style="font-weight:normal;">${customerVO.name}</label>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customer-age" class="am-u-sm-2 am-form-label">年龄</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-age" name="customerVO.age" placeholder="请输入年龄" value="${customerVO.age}" maxlength="2" min="15">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customer-sex" class="am-u-sm-2 am-form-label">性别</label>
						          	<div class="am-u-sm-3">
							            <div class="am-input-group" id="customer-sex">
							            	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.sex" id="customerMan" value="1" data-am-ucheck /> 男
							              	</label>
							              	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.sex" id="customerWoman" value="2" data-am-ucheck /> 女
							              	</label>
							            </div>
						          	</div>
						          	<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						          	<label for="customer-phone" class="am-u-sm-2 am-form-label">电话</label>
									<div class="am-u-sm-3">
										<input type="tel" class="am-form-field am-input-sm" id="customer-phone" name="customerVO.phone" placeholder="请输入电话" value="${customerVO.phone}" maxlength="20">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
						        </div>
								
								<div class="am-g am-form-group">
									<label for="customer-homeTown" class="am-u-sm-2 am-form-label">籍贯</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-homeTown" name="customerVO.homeTown" placeholder="请输入籍贯" value="${customerVO.homeTown}" maxlength="10">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customer-profession" class="am-u-sm-2 am-form-label">职业</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-profession" name="customerVO.profession" placeholder="请输入职业" value="${customerVO.profession}" maxlength="20">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
													
								<div class="am-g am-form-group">
									<label for="customer-bloodType" class="am-u-sm-2 am-form-label">血型</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-bloodType" name="customerVO.bloodType" placeholder="请输入血型" value="${customerVO.bloodType}" maxlength="2">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customer-constellation" class="am-u-sm-2 am-form-label">星座</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-constellation" name="customerVO.constellation" placeholder="请输入星座" value="${customerVO.constellation}" maxlength="10">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customer-assets" class="am-u-sm-2 am-form-label">资产</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customer-assets" name="customerVO.assets" placeholder="请输入资产" value="${customerVO.assets}" maxlength="20">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customer-customerType" class="am-u-sm-2 am-form-label">客户类型</label>
									<div class="am-u-sm-3">
							            <div class="am-input-group" id="customer-customerType">
							            	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.customerType" id="ctMember" value="1" data-am-ucheck /> 会员客户
							              	</label>
							              	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.customerType" id="ctPotential" value="2" data-am-ucheck /> 潜在客户
							              	</label>
							            </div>
						          	</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
			
								<div class="am-g am-form-group">
									<label for="customer-assets" class="am-u-sm-2 am-form-label">生日</label>
									<div class="am-u-sm-3">
										<div class="am-form-group am-form-icon">
											<i class="am-icon-calendar"></i>
											<input type="date" class="am-form-field am-input-sm" name="customerVO.birthday" placeholder="请选择生日" value="${customerVO.birthday}">
										</div>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customer-membershipDate" class="am-u-sm-2 am-form-label">入会日期</label>
									<div class="am-u-sm-3">
										<div class="am-form-group am-form-icon">
											<i class="am-icon-calendar"></i>
											<input type="date" class="am-form-field am-input-sm" name="customerVO.membershipDate" placeholder="请选择入会日期" value="${customerVO.membershipDate}">
										</div>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								
							</div>
						</div>
					
						<div class="am-tab-panel am-fade" id="tab2">
							<div class="am-u-sm-12">
								<div class="am-g am-form-group">
									<label for="customerInfo-childrenSex" class="am-u-sm-2 am-form-label">孩子性别</label>
									<div class="am-u-sm-3">
										<div class="am-input-group" id="customerInfo-childrenSex">
							            	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.customerInfo.childrenSex" id="boy" value="1" data-am-ucheck /> 男
							              	</label>
							              	<label class="am-radio am-radio-inline">
							                	<input type="radio" name="customerVO.customerInfo.childrenSex" id="girl" value="2" data-am-ucheck /> 女
							              	</label>
							            </div>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-childrenAge" class="am-u-sm-2 am-form-label">孩子年龄</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customerInfo-childrenAge" 
										name="customerVO.customerInfo.childrenAge" placeholder="请输入孩子年龄"  value="${customerVO.customerInfo.childrenAge}"
										maxlength="2" min="15">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-spouseProfession" class="am-u-sm-2 am-form-label">配偶职业</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customerInfo-spouseProfession" 
										name="customerVO.customerInfo.spouseProfession" placeholder="请输入配偶职业" 
										value="${customerVO.customerInfo.spouseProfession}" maxlength="20">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-couples" class="am-u-sm-2 am-form-label">夫妻感情</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customerInfo-couples" 
										name="customerVO.customerInfo.couples" placeholder="请输入夫妻感情" 
										value="${customerVO.customerInfo.couples}" maxlength="10">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-disposition" class="am-u-sm-2 am-form-label">性格</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-disposition" 
										name="customerVO.customerInfo.disposition" placeholder="请输入性格" 
										maxlength="50">${customerVO.customerInfo.disposition}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-hobby" class="am-u-sm-2 am-form-label">爱好</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-hobby" 
										name="customerVO.customerInfo.hobby" placeholder="请输入爱好" 
										maxlength="100">${customerVO.customerInfo.hobby}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-praise" class="am-u-sm-2 am-form-label">喜欢的赞美</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-praise" 
										name="customerVO.customerInfo.praise" placeholder="请输入喜欢的赞美" 
										maxlength="100">${customerVO.customerInfo.praise}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-homeAssets" class="am-u-sm-2 am-form-label">家庭资产</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customerInfo-homeAssets" 
										name="customerVO.customerInfo.homeAssets" placeholder="请输入家庭资产"  
										value="${customerVO.customerInfo.homeAssets}" maxlength="20">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-consumerAwareness" class="am-u-sm-2 am-form-label">消费意识</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-consumerAwareness" 
										name="customerVO.customerInfo.consumerAwareness" placeholder="请输入消费意识" 
										maxlength="100">${customerVO.customerInfo.consumerAwareness}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-maintenanceAwareness" class="am-u-sm-2 am-form-label">保养意识</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-maintenanceAwareness" 
										name="customerVO.customerInfo.maintenanceAwareness" placeholder="请输入保养意识" 
										maxlength="100">${customerVO.customerInfo.maintenanceAwareness}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-cosmetology" class="am-u-sm-2 am-form-label">美容历史</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-cosmetology" 
										name="customerVO.customerInfo.cosmetology" placeholder="请输入美容历史" 
										maxlength="100">${customerVO.customerInfo.cosmetology}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-family" class="am-u-sm-2 am-form-label">家族遗传史</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-family" 
										name="customerVO.customerInfo.family" placeholder="请输入家族遗传史" 
										maxlength="100">${customerVO.customerInfo.family}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-facial" class="am-u-sm-2 am-form-label">面部情况</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-facial" 
										name="customerVO.customerInfo.facial" placeholder="请输入面部情况" 
										maxlength="100">${customerVO.customerInfo.facial}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-body" class="am-u-sm-2 am-form-label">身体情况</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-body" 
										name="customerVO.customerInfo.body" placeholder="请输入身体情况" 
										maxlength="100">${customerVO.customerInfo.body}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-requirement" class="am-u-sm-2 am-form-label">需求情况</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-requirement" 
										name="customerVO.customerInfo.requirement" placeholder="请输入需求情况" 
										maxlength="100">${customerVO.customerInfo.requirement}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-beauticianRequest" class="am-u-sm-2 am-form-label">美容师要求</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-beauticianRequest" 
										name="customerVO.customerInfo.beauticianRequest" placeholder="请输入美容师要求" 
										maxlength="100">${customerVO.customerInfo.beauticianRequest}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
								</div>
								
								<div class="am-g am-form-group">
									<label for="customerInfo-trust" class="am-u-sm-2 am-form-label">对店面的信任度</label>
									<div class="am-u-sm-3">
										<input type="text" class="am-form-field am-input-sm" id="customerInfo-trust" 
										name="customerVO.customerInfo.trust" placeholder="请输入对店面的信任度"  
										value="${customerVO.customerInfo.trust}" maxlength="10">
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
									<label for="customerInfo-trustReason" class="am-u-sm-2 am-form-label">对店面的信任原因</label>
									<div class="am-u-sm-3">
										<textarea rows="4" cols="" class="am-form-field am-input-sm" id="customerInfo-trustReason" 
										name="customerVO.customerInfo.trustReason" placeholder="请输入对店面的信任原因" 
										maxlength="100">${customerVO.customerInfo.trustReason}</textarea>
									</div>
									<label class="am-u-sm-1 am-form-label">&nbsp;</label>
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