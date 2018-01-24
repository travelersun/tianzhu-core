<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="pixel-ratio-1"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" type="text/css" href="/assets/account/enter.css">
</head>
<body>
<div class="logo">
<img src="/assets/account/logo_ypz1.png">
<h2>有凭证</h2>
<div>为你提供在线电子借款凭证</div>
</div>
<form action="" class="hide" id="formSignin" method="post" novalidate="novalidate" style="display: block;"><input id="UserWechatOpenId" name="UserWechatOpenId" type="hidden" value="oodEewv9bZu-944xiabDhSGydL4M"> <div class="row">
<input class="form-control" data-val="true" data-val-regex="注册手机号格式错误" data-val-regex-pattern="^((\+?\d{2} )?[1-9]\d{10}(-\d{1,4})?)?$" data-val-required="请输入注册手机号" data-val-textlength="请勿超过32个字符" data-val-textlength-doublebytelength="2" data-val-textlength-maximumlength="32" data-val-textlength-minimumlength="0" id="CellPhoneNumber" name="CellPhoneNumber" placeholder="请输入注册手机号" style="padding-right: 50px;" type="number" value="">
<a id="linkRegister" href="javascript:void(0);">注册</a>
<span class="field-validation-valid" data-valmsg-for="CellPhoneNumber" data-valmsg-replace="true"></span>
</div>
<div class="row">
<input class="form-control" data-val="true" data-val-password="交易密码格式错误" data-val-password-pattern=".+" data-val-required="请输入交易密码" id="Password" name="Password" placeholder="请输入交易密码" style="padding-right: 80px;" type="password">
<a id="linkForgotPassword" href="javascript:void(0);">忘记密码</a>
<span class="field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
</div>
<div class="tips mt30">使用你在有凭证平台注册的手机号和交易密码进行登录</div>
<button type="submit" class="btn btn-primary">登录</button>
</form>

<div class="footer">
<div class="mt10">2016-2018 © 泛舟信息科技.</div>
<div class="record"><a href="#" target="_blank">粤ICP备15047528号</a></div>
</div>
<div id="divServiceProtocol" class="weui-popup__container">
<div class="weui-popup__overlay"></div>
<div class="weui-popup__modal">
<iframe src="/assets/account/1.html" style="height: calc(100% - 42px);"></iframe>
</div>
<div class="weui-footer weui-footer_fixed-bottom" onclick="$.closePopup();">
知道了
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
var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfHx8';
</script>
<script type="text/javascript" src="/assets/account/enter.js"></script>

</body></html>