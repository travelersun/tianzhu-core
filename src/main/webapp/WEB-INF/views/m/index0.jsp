<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
    <link rel="stylesheet" type="text/css" href="/assets/fund/weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/jquery-weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/ym.ypz.mobile.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/ym.ypz.mobile.extension.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/renderIOU.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/index2.css">
</head>
<body>
<input id="hCustomerId" type="hidden" value="26974">
<input id="hIsAuthenticated" type="hidden" value="TRUE">
<input id="hAuthorizationUrl" type="hidden">
<input id="hUnreadNotificationId" type="hidden">
<div class="weui-tab">
    <div class="tab-header">
        <div class="weui-flex">
            <div><img src="" class="header-img"></div>
            <div class="weui-flex__item user-info">
                <div class="name">
                    余树昭
                </div>
                <div class="balance">
                    余额: <span id="Balance">0.00元</span>
                    <span id="spanBalanceTips" class="fa fa-question-circle-o ml5"></span>
                </div>
            </div>
            <div>
                <a id="linkSetting" class="header-setting mr10" href="">
                    <span class="fa fa-cog"></span>
                </a>
                <a id="linkReloadData" class="header-refresh" href="javascript:void(0);">
                    <span class="fa fa-refresh"></span>
                </a>
            </div>
        </div>
        <div id="divFinance" class="weui-flex finance-info">
            <div class="weui-flex__item">
                <div id="TotalReceivable" class="money">67314.38</div>
                <div class="des">待收总额(元)</div>
            </div>
            <div class="weui-flex__item">
                <div id="TotalRepayable" class="money">0.00</div>
                <div class="des">待还总额(元)</div>
            </div>
        </div>
    </div>
    <div class="weui-navbar">
        <a class="weui-navbar__item" href="">
            待确认
        </a>
        <a class="weui-navbar__item weui-bar__item--on" href="">
            已生效
        </a>
    </div>
    <div class="weui-tab__bd">
        <div id="divPending" class="weui-tab__bd-item"><div class="text-center text-muted text-xs pt5">最近20条凭证信息</div><div class="no-data"><img src="./有凭证 - 电子借条平台-已生效_files/data-none.png"><div>暂无凭证</div></div></div>
        <div id="divEffecting" class="weui-tab__bd-item weui-tab__bd-item--active"><div class="text-center text-muted text-xs pt5">最近20条凭证信息</div><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjkxM10=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/06fd9ffe94634210a74d318752441b8e" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">石爱国</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：旅游</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-28</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">今日到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ4OTcxNF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/e8492fd61c334ac0b897aac29639d868" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">姚锡隆</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ4OTg2M10=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/5e9b01c315c24decb21305b992b43b23" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">苏正正</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：医疗</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQ5NDE0OV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/b38f7b848c9648ce9cda99e6adf2ec33" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">汪玲玲</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-15</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjYyOV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/c5d4a741500745fba37d71014fff2206" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">黄苗苗</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYxMjY4MV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/c8f482cbc4444aac8f8acc6cee43fc1a" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">杨晓华</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzYyODE3Nl0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/9d830d0cbf9c4e29a7d1a051943eb19a" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">张燕</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：旅游</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-22</div><div class="text-xs">还款日：2018-01-29</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzMyNTI4NF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/1370e2c257e44d7bbc1f12190e0172e9" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">杨迎菲</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-03</div><div class="text-xs">还款日：2018-01-30</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/Wzk5ODgzXQ==" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/9fefa07cc50842999ae14097839b59f3" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">黄婧</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：周转</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2017-11-22</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzI2ODM2MV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/1e1b6c28c9854f54ba983876e33bdca8" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">陈浪</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1800.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2017-12-27</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzM0NDUzOF0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/600af107489c4dc48049989325d5f6b2" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">王锟</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-04</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzQzMjMwMV0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/41e2ac3fc2c342ea9d49524739da2434" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">谈健芳</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">2000.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-11</div><div class="text-xs">还款日：2018-01-31</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-info"></span><span class="text-xs  ml5">即将到期</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/info/WzUzNjAwNl0=" class="card-container"><div class="weui-flex border-bottom"><div><img src="./有凭证 - 电子借条平台-已生效_files/355167a3b9be482fbd57c4701adc52bb" class="head-img"></div><div class="ml10 text-center"><div class="text-dark" style="line-height: 25px;">许杰</div><div class="text-xs" style="line-height: 15px;">(借款人)</div></div><div class="weui-flex__item text-right"><div style="line-height: 14px;"><span class="text-primary" style="font-size: 14px;">他跟我借</span><small class="ml5" style="font-size: 12px;">(元)</small></div><div style="line-height: 25px;"><strong class="text-dark text-xl">1500.00</strong></div></div></div><div class="weui-flex border-bottom" style="line-height: 22px;"><div class="weui-flex__item"><div class="text-xs">利率：0%</div><div class="text-xs">用途：日常消费</div></div><div class="weui-flex__item" style="text-align: right;"><div class="text-xs">借款日：2018-01-17</div><div class="text-xs">还款日：2018-02-01</div></div></div><div class="text-right"><span class="text-xs fa fa-check-circle text-success"></span><span class="text-xs  ml5">已生效</span></div></a><a href="http://ypz.youmaijinkong.com/m/iou/list/WzEwXQ==" class="view-more">查看更多</a></div>
    </div>
    <div class="weui-tabbar">
        <a href="" class="weui-tabbar__item">
            <img src="./有凭证 - 电子借条平台-已生效_files/dpz2.png" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">打凭证</p>
        </a>
        <a href="" class="weui-tabbar__item">
            <img src="./有凭证 - 电子借条平台-已生效_files/wdpz2.png" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">我的凭证</p>
        </a>
        <a href="" class="weui-tabbar__item">
            <img src="./有凭证 - 电子借条平台-已生效_files/wdzx2.png" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">我的征信</p>
        </a>
        <a href="" class="weui-tabbar__item">
            <img src="./有凭证 - 电子借条平台-已生效_files/wdcj2.png" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">我的出借</p>
        </a>
    </div>
</div>

<script type="text/javascript" src="/assets/fund/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.transit.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.min.js"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.unobtrusive.min.js"></script>
<script type="text/javascript" src="/assets/fund/jweixin-1.2.0.js"></script>
<script type="text/javascript" src="/assets/fund/jquery-weui.min.js"></script>
<script type="text/javascript" src="/assets/fund/crypto-js.js"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.jquery.validate.unobtrusive.js"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.enum.mapping.js"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.form.js"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.mobile.js"></script>
<script type="text/javascript">
    var Environment = 'PRO';
    var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfDE1MTcxNDAwMzV8QzI3OTE2NkI2OTYyNkM1MUJDOEE1QUI4QUE0NDUwN0R8ZDBiMTVhZWQwZjY0YWI0N2IzN2Y3NjhhMzNjMzAwYWM2NGVmNzI2ZQ==';
</script>
<script type="text/javascript">
    var ShareContent = {
        title: '有凭证-电子借条平台',
        desc: '为个人提供在线借款协议托管服务',
        link: location.href,
        imgUrl: ''
    };
</script>
<script type="text/javascript" src="/assets/fund/renderIOU.js"></script>
<script type="text/javascript" src="/assets/fund/index.js"></script>

</body></html>