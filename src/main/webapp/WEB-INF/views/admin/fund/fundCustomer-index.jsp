<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="row search-form-default">
		<div class="col-md-12">
			<form method="get" class="form-inline form-validation form-search form-search-init control-label-sm"
				data-grid-search="#grid-fund-fund-customer-index">
				<div class="form-group">
					<div class="controls controls-clearfix">
						<input type="text" name="search['CN_name_OR_phone_OR_certid']" class="form-control input-xlarge" placeholder="姓名 , 手机号 , 身份证号...">
					</div>
				</div>
				<div class="form-group search-group-btn">
					<button class="btn green" type="submmit">
						<i class="m-icon-swapright m-icon-white"></i>&nbsp; 查&nbsp;询
					</button>
					<button class="btn default" type="reset">
						<i class="fa fa-undo"></i>&nbsp; 重&nbsp;置
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table id="grid-fund-fund-customer-index"></table>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
		    $("#grid-fund-fund-customer-index").data("gridOptions", {
		        url : WEB_ROOT + '/admin/fund/fund-customer/list',
		        colModel : [ {
		            label : '流水号',
		            name : 'id',
		            hidden : true                          
		        }, {
		            label : '登录账号',
		            name : 'user.authUid',
		            width : 70,
		            align : 'center',
		            editable: false
		        }, {
		            label : '姓名',
		            name : 'name',
		            width : 70,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '手机号',
		            name : 'phone',
		            width : 70,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '身份证号',
		            name : 'certid',
		            width : 130,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '微信号',
		            name : 'weixin',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '地区',
		            name : 'region',
		            width : 150,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '月收入',
		            name : 'mincome',
                    align : 'center',
                    formatter: 'currency',
					editable: true
		        }],
		        postData: {
		           "search['FETCH_user']" : "LEFT"
		        },
		        editurl : WEB_ROOT + '/admin//fund/fund-customer/edit',
		        editrulesurl : WEB_ROOT + '/admin/util/validate?clazz=${clazz}',
		        delurl : WEB_ROOT + '/admin/fund/fund-customer/delete',
		        fullediturl : WEB_ROOT + '/admin/fund/fund-customer/edit-tabs'
		    });
		});
    </script>
</body>
</html>
