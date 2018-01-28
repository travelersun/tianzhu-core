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
				data-grid-search="#grid-fund-funf-customer-contact-index">
				<div class="form-group">
					<div class="controls controls-clearfix">
						<input type="text" name="search['CN_fathername_OR_fatherphone_OR_mothername']" class="form-control input-xlarge" placeholder="父亲姓名 , 父亲电话 , 母亲姓名...">
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
			<table id="grid-fund-funf-customer-contact-index"></table>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
		    $("#grid-fund-funf-customer-contact-index").data("gridOptions", {
		        url : WEB_ROOT + '/admin/fund/funf-customer-contact/list',
		        colModel : [ {
		            label : '流水号',
		            name : 'id',
		            hidden : true                          
		        }, {
		            label : '父亲姓名',
		            name : 'fathername',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '父亲电话',
		            name : 'fatherphone',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '母亲姓名',
		            name : 'mothername',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '母亲电话',
		            name : 'motherphone',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '配偶姓名',
		            name : 'matename',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '配偶电话',
		            name : 'matephone',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '朋友姓名',
		            name : 'friendname',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        }, {
		            label : '朋友电话',
		            name : 'friendphone',
		            width : 100,
		            align : 'center',
		            editable: true                                                                   
		        } ],
		        editurl : WEB_ROOT + '/admin//fund/funf-customer-contact/edit',
		        editrulesurl : WEB_ROOT + '/admin/util/validate?clazz=${clazz}',
		        delurl : WEB_ROOT + '/admin/fund/funf-customer-contact/delete',
		        fullediturl : WEB_ROOT + '/admin/fund/funf-customer-contact/edit-tabs'
		    });
		});
    </script>
</body>
</html>
