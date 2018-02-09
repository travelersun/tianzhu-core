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
		action="${ctx}/admin/fund/fund-customer/edit" method="post" modelAttribute="entity"
		data-editrulesurl="${ctx}/admin/util/validate?clazz=${clazz}">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<div class="form-actions">
			<button class="btn blue" type="submit" data-grid-reload="#grid-fund-fund-customer-index">
				<i class="fa fa-check"></i> 保存
			</button>
			<button class="btn green" type="submit" data-grid-reload="#grid-fund-fund-customer-index" data-post-dismiss="modal">保存并关闭
			</button>
			<button class="btn default" type="button" data-dismiss="modal">取消</button>
		</div>
		<div class="form-body">
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">登录账号</label>
						<div class="controls">
			                <form:input path="user.authUid" class="form-control" readonly="true" />
						</div>
					</div>
	            </div>
	            <div class="col-md-6">
	            <div class="form-group">
                	<label class="control-label">姓名</label>
                		<div class="controls">
                			<form:input path="name" class="form-control" readonly="true"/>
                		</div>
                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">手机号</label>
						<div class="controls">
			                <form:input path="phone" class="form-control" readonly="true" />
						</div>
					</div>
					</div>

					<div class="col-md-6">
					<div class="form-group">
						<label class="control-label">身份证号</label>
						<div class="controls">
			                <form:input path="certid" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">微信号</label>
						<div class="controls">
			                <form:input path="weixin" class="form-control"/>
						</div>
					</div>
					</div>
					<div class="col-md-6">
					<div class="form-group">
						<label class="control-label">地区</label>
						<div class="controls">
			                <form:input path="region" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">详细地址</label>
						<div class="controls">
			                <form:input path="address" class="form-control"/>
						</div>
					</div>
					</div>
					<div class="col-md-6">
					<div class="form-group">
						<label class="control-label">月收入</label>
						<div class="controls">
			                <form:input path="mincome" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">公司名称</label>
						<div class="controls">
			                <form:input path="fundCustomerAddInfo.company" class="form-control"/>
						</div>
					</div>
	            </div>
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">公司地址</label>
						<div class="controls">
			                <form:input path="fundCustomerAddInfo.compnyaddr" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">公司电话</label>
						<div class="controls">
			                <form:input path="fundCustomerAddInfo.companyphone" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>

	        <div class="row">
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">父亲姓名</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.fathername" class="form-control"/>
						</div>
					</div>
	            </div>
                <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">父亲电话</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.fatherphone" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
	        <div class="row">
                <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">母亲姓名</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.mothername" class="form-control"/>
						</div>
					</div>
	            </div>
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">母亲电话</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.motherphone" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>

	        <div class="row">

                <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">配偶姓名</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.matename" class="form-control"/>
						</div>
					</div>
	            </div>
	            <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">配偶电话</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.matephone" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>

	        <div class="row">

                <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">朋友姓名</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.friendname" class="form-control"/>
						</div>
					</div>
	            </div>
                <div class="col-md-6">
					<div class="form-group">
						<label class="control-label">朋友电话</label>
						<div class="controls">
			                <form:input path="funfCustomerContact.friendphone" class="form-control"/>
						</div>
					</div>
	            </div>
	        </div>
            <div class="row">
	            <div class="col-md-12">
					<div class="form-group">
						<label class="control-label">客户身份证照片-正面</label>
						<div class="controls">
			                 <form:input type="hidden" path="fundCustomerPicture.forntcertpict" class="form-control"/>
							<img src="${entity.fundCustomerPicture.forntcertpict}" >
						</div>
					</div>
	            </div>
	        </div>
            <div class="row">
	            <div class="col-md-12">
					<div class="form-group">
						<label class="control-label">客户身份证照片-反面</label>
						<div class="controls">
			                <form:input type="hidden" path="fundCustomerPicture.rearcertpict" class="form-control"/>
			                <img src="${entity.fundCustomerPicture.rearcertpict}" >
						</div>
					</div>
	            </div>
	        </div>
            <div class="row">
	            <div class="col-md-12">
					<div class="form-group">
						<label class="control-label">客户手持身份证照片</label>
						<div class="controls">
			                <form:input type="hidden"  path="fundCustomerPicture.handpict" class="form-control"/>
			                <img src="${entity.fundCustomerPicture.handpict}" >
						</div>
					</div>
	            </div>
	        </div>

		</div>
		<div class="form-actions right">
			<button class="btn blue" type="submit" data-grid-reload="#grid-fund-fund-customer-index">
				<i class="fa fa-check"></i> 保存
			</button>
			<button class="btn green" type="submit" data-grid-reload="#grid-fund-fund-customer-index" data-post-dismiss="modal">保存并关闭
			</button>
			<button class="btn default" type="button" data-dismiss="modal">取消</button>
		</div>
	</form:form>
</body>
</html>