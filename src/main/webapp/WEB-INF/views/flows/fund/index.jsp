<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<title>着陆页</title>
<link rel="stylesheet" type="text/css" href="/assets/fund/weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/fund/jquery-weui.min.css">
<link rel="stylesheet" type="text/css" href="/assets/fund/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/assets/fund/yc.sby.mobile.extension.css">
<link rel="stylesheet" type="text/css" href="/assets/fund/index_1.css">
</head>
<body>
<form id="frmBindPhone" action="${flowExecutionUrl}" method="post" novalidate="novalidate">
<input type="hidden" name="_eventId" value="submit" />
<div class="box-phoneverification">
<div class="form-group">
<input data-val="true" data-val-number="字段 渠道Id 必须是一个数字。" id="ChannelId" name="ChannelId" type="hidden" value="">
<input class="form-control" data-val="true" data-val-regex="手机号 格式错误" data-val-regex-pattern="^((\+?\d{2} )?[1-9]\d{10}(-\d{1,4})?)?$" data-val-required="请输入 手机号" id="Phone" name="phone" placeholder="认证手机号" type="number" value="">
<span class="field-validation-valid form-error" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
</div>
<div class="form-group">
<span class="input-icon">
<input class="form-control" data-val="true" data-val-required="请输入 图片验证码" id="CaptchaCode" name="tempdata" placeholder="等式计算结果" type="text" value="">
<img id="imgCaptchaCode" style="position:absolute;top:-1px;right:5px;" src="/pub/jcaptcha.servlet">
</span>
</div>
<span class="field-validation-valid form-error" data-valmsg-for="CaptchaCode" data-valmsg-replace="true"></span>
<div class="form-group" style="padding-right:0">
<input type="button" id="btnSubmit" value="立即认证" class="weui-btn weui-btn_primary" onclick="document.getElementById('frmBindPhone').submit();"/>
<span class="help-block"><input type="checkbox" checked="checked"> 认证即同意<a href="#" style="color:#adadad;">《万能钱庄协议》</a><a href="#" style="color:#adadad;">《隐私条款》</a></span>
</div>
</div>
</form>
<script type="text/javascript" src="/assets/fund/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.transit.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.min.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.unobtrusive.min.js"></script>
<script type="text/javascript" src="/assets/fund/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="/assets/fund/swiper.min.js"></script>
<script type="text/javascript" src="/assets/fund/jquery-weui.min.js"></script>
<script type="text/javascript" src="/assets/fund/fastclick.js"></script>
<script type="text/javascript" src="/assets/fund/crypto-js.js"></script>
<script type="text/javascript" src="/assets/fund/yc.sby.city.picker.js"></script>
<script type="text/javascript" src="/assets/fund/yc.sby.jquery.validate.unobtrusive.js"></script>
<script type="text/javascript" src="/assets/fund/yc.sby.enum.mapping.js"></script>
<script type="text/javascript" src="/assets/fund/yc.sby.form.js"></script>
<script type="text/javascript" src="/assets/fund/yc.sby.mobile.js"></script>
<script type="text/javascript">
var Environment = 'PRO';
var WechatParameters = 'fHx8';
</script>
<script type="text/javascript" src="/assets/fund/index.js"></script>

</body>
</html>
