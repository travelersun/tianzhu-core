<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="pixel-ratio-2 retina android android-6 android-6-0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="theme-color" content="#1f212f">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="cache-control" content="max-age=864000">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="author" content="">
<meta name="description" content="">
<meta itemprop="name" content="">
<meta itemprop="description" content="">
<title>我的凭证</title>
<link rel="stylesheet" type="text/css" href="/assets/account/weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/jquery-weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.css">
<link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.extension.css">
<link rel="stylesheet" type="text/css" href="/assets/account/renderIOU.css">
<link rel="stylesheet" type="text/css" href="/assets/account/list.css">
</head>
<body style="">
<form action="" id="formList" method="post" novalidate="novalidate">
<input id="hCustomerId" type="hidden" value="44041">
<input data-val="true" data-val-number="字段 Page 必须是一个数字。" data-val-required="Page 字段是必需的。" id="Page" name="Page" type="hidden" value="1" aria-required="true" aria-describedby="Page-error" class="valid"><input data-val="true" data-val-number="字段 Size 必须是一个数字。" data-val-required="Size 字段是必需的。" id="Size" name="Size" type="hidden" value="20" aria-required="true" aria-describedby="Size-error" class="valid"><input data-val="true" data-val-required="IsOverdue 字段是必需的。" id="IsOverdue" name="IsOverdue" type="hidden" value="False" aria-required="true" aria-describedby="IsOverdue-error" class="valid"> <div class="weui-tab">
<div id="divTabs" class="weui-navbar">
<div class="weui-navbar__item weui-navbar__item-status link-dropdown">
<span>已生效(未逾期)</span>
<i class="fa fa-sort-desc"></i>
</div>
<div class="dropdownbox" style="display: none;">
<div class="dropdownbox-mask"></div>
<div class="weui-cells weui-cells_radio">
<label class="weui-cell">
<span class="weui-cell__bd">全部</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">待确认</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Pending" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已生效(未逾期)</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" checked="" name="Status" value="Effecting" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已生效(逾期)</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Effecting" data-isoverdue="True">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已撕毁(未逾期)</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Destroyed" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已撕毁(逾期)</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Destroyed" data-isoverdue="True">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已拒绝</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Rejected" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已删除</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="Deleted" data-isoverdue="False">
<span class="weui-icon-checked"></span>
</span>
</label>
</div>
</div>
<div class="weui-navbar__item link-dropdown" data-for="RepaymentDateSorted">
<span>还款日期从早到晚</span>
<i class="fa fa-sort-desc"></i>
</div>
<div class="dropdownbox" style="display: none;">
<div class="dropdownbox-mask"></div>
<div class="weui-cells weui-cells_radio">
<label class="weui-cell">
<span class="weui-cell__bd">还款日期从早到晚</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" checked="" name="Sorted" value="RepaymentDateAES">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">还款日期从晚到早</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="RepaymentDateDESC">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">借款金额从小到大</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="AmountAES">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">借款金额从大到小</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="AmountDESC">
<span class="weui-icon-checked"></span>
</span>
</label>
</div>
</div>
<div class="weui-navbar__item weui-navbar__item-search link-dropdown">
<i class="fa fa-search"></i>
</div>
<div class="dropdownbox" style="display: none;">
<div class="dropdownbox-mask"></div>
<div class="weui-cells weui-cells_form">
<div class="weui-cell weui-cell_vcode">
<div class="weui-cell__bd">
<input class="form-control" type="text" id="Keyword" name="Keyword" placeholder="搜索(姓名/身份证号/手机号)">
</div>
<div class="weui-cell__ft">
<button type="submit" class="weui-vcode-btn">搜索</button>
</div>
</div>
</div>
</div>
</div>
<div class="weui-tab__bd">
<div id="datalist" class="weui-tab__bd-item weui-tab__bd-item--active"></div>
<div id="divEnd" class="data-end hide" style="display: none;">到底啦~</div>
<div id="divNone" class="no-data hide" style="display: block;">
<img src="">
<div>暂无凭证</div>
</div>
<div id="divLoadMore" class="weui-loadmore" style="display: none;">
<i class="weui-loading"></i>
<span class="weui-loadmore__tips">正在加载</span>
</div>
</div>
</div>
</form>
<script type="text/javascript" src="/assets/account/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/assets/account/jquery.transit.js"></script>
<script type="text/javascript" src="/assets/account/jquery.validate.min.js"></script>
<script type="text/javascript" src="/assets/account/jquery.validate.unobtrusive.min.js"></script>
<script type="text/javascript" src="/assets/account/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="/assets/account/jquery-weui.min.js"></script>
<script type="text/javascript" src="/assets/account/crypto-js.js"></script>
<script type="text/javascript" src="/assets/account/ym.ypz.jquery.validate.unobtrusive.js"></script>
<script type="text/javascript" src="/assets/account/ym.ypz.enum.mapping.js"></script>
<script type="text/javascript" src="/assets/account/ym.ypz.form.js"></script>
<script type="text/javascript" src="/assets/account/ym.ypz.mobile.js"></script>
<script type="text/javascript">
var Environment = 'PRO';
var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfHx8';
</script>
<script type="text/javascript" src="/assets/account/renderIOU.js"></script>
<script type="text/javascript" src="/assets/account/list.js"></script>

</body></html>