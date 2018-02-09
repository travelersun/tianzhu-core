<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.css">
</head>
<body style="">
<form action="${ctx}/m/mycertp" id="formList" method="post" novalidate="novalidate">
<input id="hCustomerId" type="hidden" value="44041">
<input data-val="true" data-val-number="字段 Page 必须是一个数字。" data-val-required="Page 字段是必需的。" id="Page" name="Page" type="hidden" value="1" aria-required="true" aria-describedby="Page-error" class="valid"><input data-val="true" data-val-number="字段 Size 必须是一个数字。" data-val-required="Size 字段是必需的。" id="Size" name="Size" type="hidden" value="20" aria-required="true" aria-describedby="Size-error" class="valid"><input data-val="true" data-val-required="IsOverdue 字段是必需的。" id="IsOverdue" name="IsOverdue" type="hidden" value="False" aria-required="true" aria-describedby="IsOverdue-error" class="valid"> <div class="weui-tab">
<div id="divTabs" class="weui-navbar">
<div class="weui-navbar__item weui-navbar__item-status link-dropdown">
<span>已生效</span>
<i class="fa fa-sort-desc"></i>
</div>
<div class="dropdownbox" style="display: none;">
<div class="dropdownbox-mask"></div>
<div class="weui-cells weui-cells_radio">
<label class="weui-cell">
<span class="weui-cell__bd">待确认</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Status" value="1" >
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">已生效</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" checked="" name="Status" value="2">
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
<input type="radio" class="weui-check" checked="" name="Sorted" value="maturity_ASC">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">还款日期从晚到早</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="maturity_DESC">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">借款金额从小到大</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="loanmoney_ASC">
<span class="weui-icon-checked"></span>
</span>
</label>
<label class="weui-cell">
<span class="weui-cell__bd">借款金额从大到小</span>
<span class="weui-cell__ft">
<input type="radio" class="weui-check" name="Sorted" value="loanmoney_DESC">
<span class="weui-icon-checked"></span>
</span>
</label>
</div>
</div>
</div>
<div class="weui-tab__bd">
<div id="datalist" class="weui-tab__bd-item weui-tab__bd-item--active">
    <c:forEach items="${customer.fundCustomerOrders}" var="order" >
    <a href="${ctx}/m/certdetail?orderId=${order.id}" class="card-container">
        <div class="weui-flex border-bottom">
            <div>
                <img src="" class="head-img"></div>
            <div class="ml10 text-center">
                <div class="text-dark" style="line-height: 25px;"><shiro:principal property="nickName"/></div>
                <div class="text-xs" style="line-height: 15px;">(借款人)</div>
            </div>
            <div class="weui-flex__item text-right">
                <div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">单位</span>
                    <small class="ml5" style="font-size: 12px;">(元)</small>
                </div>
                <div style="line-height: 25px;"><strong class="text-dark text-xl">${order.loanmoney}</strong></div>
            </div>
        </div>
        <div class="weui-flex border-bottom" style="line-height: 22px;">
            <div class="weui-flex__item">
                <div class="text-xs">利率：${order.yrate}%</div>
                <div class="text-xs">用途：${order.purpose}</div>
            </div>
            <div class="weui-flex__item" style="text-align: right;">
                <div class="text-xs">借款日：<fmt:formatDate value="${order.putoutdate}" pattern="yyyy-MM-dd"/></div>
                <div class="text-xs">还款日：<fmt:formatDate value="${order.maturity}" pattern="yyyy-MM-dd"/></div>
            </div>
        </div>

    </a>
    </c:forEach>

</div>

<div id="divEnd" class="data-end hide" style="display: none;">到底啦~</div>
<div id="divNone" class="no-data hide" style="display: block;">
<img src="">
<div>暂无凭证</div>
</div>

</div>
</div>
</form>
<div id="dialog" title="基本的对话框" style="display: none;z-index: 100000;">
    <p>这是一个默认的对话框，用于显示信息。对话框窗口可以移动，调整尺寸，默认可通过 'x' 图标关闭。</p>
    <img src="${brCodeImgPath}">
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
<script type="text/javascript" src="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript">
var Environment = 'PRO';
var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfHx8';
function showDialog() {
    $( "#dialog" ).dialog({
        width:300,
        height:400,
        minWidth:150,
        minHeight:150
    });

}
</script>
<script type="text/javascript" src="/assets/account/renderIOU.js"></script>
<script type="text/javascript" src="/assets/account/list.js"></script>

</body></html>