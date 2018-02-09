<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form:form class="form-horizontal form-bordered form-label-stripped form-validation"
		action="${ctx}/admin/fund/fund-customer-order/edit" method="post" modelAttribute="entity"
		data-editrulesurl="${ctx}/admin/util/validate?clazz=${clazz}">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<div class="form-actions">
			<button class="btn blue" type="submit" data-grid-reload="#grid-fund-fund-customer-order-index">
				<i class="fa fa-check"></i> 保存
			</button>
			<button class="btn green" type="submit" data-grid-reload="#grid-fund-fund-customer-order-index" data-post-dismiss="modal">保存并关闭
			</button>
			<button class="btn default" type="button" data-dismiss="modal">取消</button>
		</div>
		<div class="form-body">
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">客户姓名</label>
						<div class="controls">
			                <form:input path="fundCustomer.name" class="form-control" readonly="true" />
						</div>
					</div>
	            </div>
	        </div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label">客户手机号</label>
						<div class="controls">
							<form:input path="fundCustomer.phone" class="form-control" readonly="true"/>
						</div>
					</div>
				</div>
			</div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">出借人名称</label>
						<div class="controls">
			                <form:input path="lendername" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">借款日期</label>
						<div class="controls">
			                <form:input path="putoutdate" class="form-control" data-picker="date-time"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">还款日期</label>
						<div class="controls">
			                <form:input path="maturity" class="form-control" data-picker="date-time"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">借款金额</label>
						<div class="controls">
			                <form:input path="loanmoney" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">年化利率(%)</label>
						<div class="controls">
			                <form:input path="yrate" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">借款用途</label>
						<div class="controls">
			                <form:input path="purpose" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">备注</label>
						<div class="controls">
			                <form:input path="remark" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">服务费</label>
						<div class="controls">
			                <form:input path="servicemonry" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">状态</label>
						<div class="controls">
							<form:select path="status" class="form-control" items="${orderStatus }" />
						</div>
					</div>
	            </div>
	        </div>
		</div>
		<div class="form-actions right">
			<button class="btn blue" type="submit" data-grid-reload="#grid-fund-fund-customer-order-index">
				<i class="fa fa-check"></i> 保存
			</button>
			<button class="btn green" type="submit" data-grid-reload="#grid-fund-fund-customer-order-index" data-post-dismiss="modal">保存并关闭
			</button>
			<button class="btn default" type="button" data-dismiss="modal">取消</button>
		</div>
	</form:form>
</body>
</html>