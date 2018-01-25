<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="pixel-ratio-2 retina android android-6 android-6-0"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>有凭证 - 电子借条平台</title>
<link rel="stylesheet" type="text/css" href="/assets/account/weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/jquery-weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.css">
<link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.extension.css">
<link rel="stylesheet" type="text/css" href="/assets/account/renderIOU.css">
<link rel="stylesheet" type="text/css" href="/assets/account/index2.css">
</head>
<body>
<input id="hCustomerId" type="hidden" value="44041">
<input id="hIsAuthenticated" type="hidden" value="TRUE">
<input id="hAuthorizationUrl" type="hidden">
<input id="hUnreadNotificationId" type="hidden">
<div class="weui-tab">
<div class="tab-header">
<div class="weui-flex">
<div><img src="" class="header-img"></div>
<div class="weui-flex__item user-info">
<div class="name">
张畅辉
</div>
<div class="balance">
余额: <span id="Balance">0.00元</span>
<span id="spanBalanceTips" class="fa fa-question-circle-o ml5"></span>
</div>
</div>
<div>
<a id="linkSetting" class="header-setting mr10" href="#">
<span class="fa fa-cog"></span>
</a>
<a id="linkReloadData" class="header-refresh" href="javascript:void(0);">
<span class="fa fa-refresh"></span>
</a>
</div>
</div>
<div id="divFinance" class="weui-flex finance-info">
<div class="weui-flex__item">
<div id="TotalReceivable" class="money">0.00</div>
<div class="des">待收总额(元)</div>
</div>
<div class="weui-flex__item">
<div id="TotalRepayable" class="money">0.00</div>
<div class="des">待还总额(元)</div>
</div>
</div>
</div>
<div class="weui-navbar">
<a class="weui-navbar__item weui-bar__item--on" href="#">
待确认
</a>
<a class="weui-navbar__item" href="#">
已生效
</a>
</div>
<div class="weui-tab__bd">
<div id="divPending" class="weui-tab__bd-item weui-tab__bd-item--active"><div class="text-center text-muted text-xs pt5">最近20条凭证信息</div><div class="no-data"><img src="/assets/account/data-none.png"><div>暂无凭证</div></div></div>
<div id="divEffecting" class="weui-tab__bd-item"><div class="text-center text-muted text-xs pt5">最近20条凭证信息</div><div class="no-data"><img src="/assets/account/data-none.png"><div>暂无凭证</div></div></div>
</div>
<div class="weui-tabbar">
<a href="#" class="weui-tabbar__item">
<img src="/assets/account/dpz2.png" class="weui-tabbar__icon">
<p class="weui-tabbar__label">打凭证</p>
</a>
<a href="#" class="weui-tabbar__item">
<img src="/assets/account/wdpz2.png" class="weui-tabbar__icon">
<p class="weui-tabbar__label">我的凭证</p>
</a>
<a href="#" class="weui-tabbar__item">
<img src="/assets/account/wdzx2.png" class="weui-tabbar__icon">
<p class="weui-tabbar__label">我的征信</p>
</a>
</div>
</div>
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
var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfDE1MTU4MzkzOTN8NEQyRjU1MDdFM0QwMjY3NzdCNkEzRTI2RDA0MDhFNDB8YzRiNGFmOWQ5YjZhZGU3ZDRmOTMzMWI2ZjcyYzg3M2UyOWFhOTg2YQ==';
</script>
<script type="text/javascript">
var ShareContent = {
title: '有凭证-电子借条平台',
desc: '为个人提供在线借款协议托管服务',
link: location.href,
imgUrl: ''
};
</script>
<script type="text/javascript" src="/assets/account/renderIOU.js"></script>
<!-- <script type="text/javascript" src="/assets/account/index.js"></script> -->

</body></html>