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
				data-grid-search="#grid-fund-fund-customer-order-index">
				<div class="form-group">
					<div class="controls controls-clearfix">
						<input type="text" name="search['CN_lendername_OR_remark_OR_status']" class="form-control input-xlarge" placeholder="出借人名称 , 备注 , 状态...">
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
			<table id="grid-fund-fund-customer-order-index"></table>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
		    $("#grid-fund-fund-customer-order-index").data("gridOptions", {
		        url : WEB_ROOT + '/admin/fund/fund-customer-order/list',
		        colModel : [ {
		            label : '流水号',
		            name : 'id',
		            hidden : true                          
		        }, {
		            label : '客户信息对象',
		            name : 'fundCustomer',
		            width : 200,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '出借人名称',
		            name : 'lendername',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '借款日期',
		            name : 'putoutdate',
		            width : 150,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '还款日期',
		            name : 'maturity',
		            width : 150,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '借款金额',
		            name : 'loanmoney',
		            editable: true                                                                   
		        }, {
		            label : '年化利率',
		            name : 'yrate',
		            editable: true                                                                   
		        }, {
		            label : '备注',
		            name : 'remark',
		            width : 200,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '服务费',
		            name : 'servicemonry',
		            editable: true                                                                   
		        }, {
		            label : '状态',
		            name : 'status',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        } ],
		        postData: {
		           "search['FETCH_fundCustomer']" : "INNER"
		        },
		        editurl : WEB_ROOT + '/admin//fund/fund-customer-order/edit',
		        editrulesurl : WEB_ROOT + '/admin/util/validate?clazz=${clazz}',
		        delurl : WEB_ROOT + '/admin/fund/fund-customer-order/delete',
		        fullediturl : WEB_ROOT + '/admin/fund/fund-customer-order/edit-tabs'
		    });
		});
    </script>
</body>
</html>
