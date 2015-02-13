<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
function logout() {
	location.replace("logout");
}
</script>
<header class="am-topbar admin-header am-topbar-fixed-top">
	<div class="am-topbar-brand">
		<strong style="font-style: italic;">Cis</strong> <small>紫琳美疗信息系统</small>
	</div>

	<div class="am-collapse am-topbar-collapse" style="display: inline" id="topbar-collapse">
		<%       
			String sa = (String)session.getAttribute("username");
			if(null != sa && !sa.equals("") )
		    {
		%>
				<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
					<li>
						<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;"> 
							<span class="am-icon-users"></span> <%=sa%>
						</a>
					</li>
					<li><a href="javascript:logout();"><span class="am-icon-power-off"></span> 退出</a></li>
				</ul>
		
		<%  } else { %>
			<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
				<li class="am-dropdown">
					<a class="am-dropdown-toggle" href="javascript:logout();"> 
						点此处登录
					</a>
				</li>
			</ul>
		<%  }  %>
	</div>
</header>