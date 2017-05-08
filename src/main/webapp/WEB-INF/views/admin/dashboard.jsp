<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>
</head>
<body>
	<div class="note note-info">
		<h4 class="block">提示说明</h4>
		<p>以下Dashboard内容定义主要是演示效果之用，实际需要根据项目业务需求定制设计开发。</p>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="dashboard-stat yellow">
				<div class="visual">
					<i class="fa fa-bullhorn"></i>
				</div>
				<div class="details">
					<div class="number number-notify-message-count">-</div>
					<div class="desc">未读公告消息</div>
				</div>
				<a href="javascript:;" rel="address:/admin/profile/notify-message|公告消息列表" class="more">
					View more <i class="m-icon-swapright m-icon-white"></i>
				</a>
			</div>
		</div>
		<div class="col-md-3">
			<div class="dashboard-stat blue">
				<div class="visual">
					<i class="fa fa-envelope"></i>
				</div>
				<div class="details">
					<div class="number number-user-message-count">-</div>
					<div class="desc">未读个人消息</div>
				</div>
				<a href="javascript:;" rel="address:/admin/profile/user-message|个人消息列表" class="more">
					View more <i class="m-icon-swapright m-icon-white"></i>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<div class="dashboard-stat green">
				<div class="visual">
					<i class="fa fa-shopping-cart"></i>
				</div>
				<div class="details">
					<div class="number">549</div>
					<div class="desc">New Orders</div>
				</div>
				<a href="#" class="more">
					View more <i class="m-icon-swapright m-icon-white"></i>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<div class="dashboard-stat purple">
				<div class="visual">
					<i class="fa fa-globe"></i>
				</div>
				<div class="details">
					<div class="number">+89%</div>
					<div class="desc">Brand Popularity</div>
				</div>
				<a href="#" class="more">
					View more <i class="m-icon-swapright m-icon-white"></i>
				</a>
			</div>
		</div>
	</div>
	<div class="well well-large">
		<h3>项目简介</h3>
		<p>集结最新主流时尚开源技术的面向互联网Web应用的整合前端门户站点、HTML5移动站点及后端管理系统一体的的基础开发框架，提供一个J2EE相关主流开源技术架构整合及一些企业应用基础通用功能和组件的设计实现的最佳实践和原型参考。</p>
	</div>

	<script type="text/javascript">
        $(function() {
            AdminGlobal.updateMessageCount();
        });
    </script>
</body>
</html>
