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
<div id="datalist" class="weui-tab__bd-item weui-tab__bd-item--active">
    <a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjkxM10=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/06fd9ffe94634210a74d318752441b8e" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">石爱国</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：旅游</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-28</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">今日到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ4OTcxNF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/e8492fd61c334ac0b897aac29639d868" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">姚锡隆</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ4OTg2M10=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/5e9b01c315c24decb21305b992b43b23" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">苏正正</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：医疗</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ5NDE0OV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/b38f7b848c9648ce9cda99e6adf2ec33" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">汪玲玲</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjYyOV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/c5d4a741500745fba37d71014fff2206" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">黄苗苗</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjY4MV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/c8f482cbc4444aac8f8acc6cee43fc1a" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">杨晓华</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYyODE3Nl0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/9d830d0cbf9c4e29a7d1a051943eb19a" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">张燕</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：旅游</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzMyNTI4NF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/1370e2c257e44d7bbc1f12190e0172e9" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">杨迎菲</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-03</div><div class="text-xs">还款日：2018-01-30</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/Wzk5ODgzXQ==" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/9fefa07cc50842999ae14097839b59f3" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">黄婧</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：周转</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2017-11-22</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzI2ODM2MV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/1e1b6c28c9854f54ba983876e33bdca8" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">陈浪</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1800.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2017-12-27</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzM0NDUzOF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/600af107489c4dc48049989325d5f6b2" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">王锟</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-04</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQzMjMwMV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/41e2ac3fc2c342ea9d49524739da2434" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">谈健芳</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-11</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzUzNjAwNl0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./我的凭证-全_files/355167a3b9be482fbd57c4701adc52bb" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">许杰</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-17</div><div class="text-xs">还款日：2018-02-01</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-success"></span><span class="text-xs  ml5">已生效</span></div></a>
</div>

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