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

    <title>凭证详情</title>
    <link rel="stylesheet" type="text/css" href="/assets/fund/weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/jquery-weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/ym.ypz.mobile.css">
    <link rel="stylesheet" type="text/css" href="/assets/fund/ym.ypz.mobile.extension.css">
    <script type="text/javascript">
        var ShareContent = {
            title: '有凭证-电子借条平台',
            desc: '石爱国向你打了一个凭证',
            link: location.href,
            imgUrl: ''
        };
    </script>
    <link rel="stylesheet" type="text/css" href="/assets/fund/info.css">
</head>
<body style="">
<div id="divQRCode" class="tips-container hide">
    <img src="" class="img-qrcode">
    <div class="qrcode-text">
        <p>让出借人扫扫这个二维码</p>
    </div>
    <button id="btnQRCodeClose" type="button" class="btn-qrcode-close">
        <span class="fa fa-check mr5"></span>
        知道啦
    </button>
</div>
<div id="divMobilePay" class="tips-container hide">
    <img src="./凭证详情_files/jt.png" class="mobilepay-arrow">
    <div class="mobilepay-text">
        <p>请选择</p>
        <p>在手机浏览器中打开</p>
        <p>再使用其他方式支付</p>
    </div>
    <button id="btnMobilePayClose" type="button" class="btn-mobilepay-close">
        <span class="fa fa-check mr5"></span>
        知道啦
    </button>
</div>
<form action="http://ypz.youmaijinkong.com/m/iou/updatestatus" id="formUpdateStatus" method="post" novalidate="novalidate"> <input id="hCustomerId" type="hidden" value="26974">
    <input id="hCreditorId" type="hidden" value="26974">
    <input id="hCreditorIsAuthenticated" type="hidden" value="TRUE">
    <input id="hDebtorId" type="hidden" value="82415">
    <input id="hDebtorIsAuthenticated" type="hidden" value="TRUE">
    <input id="hIsPaid" type="hidden" value="TRUE">
    <input id="hPaying" type="hidden" value="FALSE">
    <input id="hHasSignatured" type="hidden" value="TRUE">
    <input id="hIsValidPassword" type="hidden" value="">
    <input id="hStatus" type="hidden" value="Effecting">
    <input id="hBorrowingDate" type="hidden" value="2018/1/22 0:00:00">
    <input id="hFinalRepaymentDate" type="hidden" value="2018/1/28 0:00:00">
    <input id="hIsSynchronizedContract" type="hidden" value="FALSE">
    <input id="hIsUploadCredit" type="hidden" value="FALSE">
    <input data-val="true" data-val-number="字段 凭证Id 必须是一个数字。" data-val-required="请输入凭证Id" id="LoanIOUId" name="LoanIOUId" type="hidden" value="612913"><input data-val="true" data-val-required="请输入状态" id="Status" name="Status" type="hidden" value=""><input data-val="true" data-val-date="字段 实际还款日期 必须是日期。" data-val-requiredifequals="请输入实际还款日期" data-val-requiredifequals-propertyname="Status" data-val-requiredifequals-propertyvalues="Destroyed" id="RealRepaymentDate" name="RealRepaymentDate" type="hidden" value="2018/1/28 0:00:00"> <div class="breadcrumb">
        <a href="http://ypz.youmaijinkong.com/m/customer/index">
            <span class="fa fa-chevron-left"></span>
            返回首页
        </a>
    </div>
    <div class="container">
        <a id="btnQRCode" href="javascript:void(0);" class="icon-qrcode">
            <img src="./凭证详情_files/qrcode.png">
        </a>
        <div class="weui-flex text-center">
            <div class="weui-flex__item">
                <div class="head-img-container">
                    <img src="./凭证详情_files/322c9018d5644d139c1490c9f300445d" class="head-img">
                </div>
                <div class="user-name">余树昭</div>
                <img id="imgCreditorSignatureImage" src="./凭证详情_files/c885ae107e4347ffae4194b58d19475e.png" class="signature-img">
            </div>
            <div class="weui-flex__item to">
                <span class="fa fa-angle-double-right mr5"></span>
                借款给
                <span class="fa fa-angle-double-right ml5"></span>
            </div>
            <div class="weui-flex__item">
                <div class="head-img-container" style="position: relative;">
                    <img id="imgDebtorHeadImage" src="./凭证详情_files/06fd9ffe94634210a74d318752441b8e" class="head-img">
                    <div id="divDebtorLiabilityTips" class="debtor-liability-tips" style="display: block; top: -15.6118px;">
                        <i class="fa fa-hand-o-down"></i>
                    </div>
                </div>
                <div class="user-name">石爱国</div>
                <img id="imgDebtorSignatureImage" src="./凭证详情_files/b08a3d0be3bd4c899e18aa19e44988b5.png" class="signature-img">
            </div>
        </div>
        <div class="weui-cells mt15">
            <div class="weui-cell_border"></div>
            <div class="weui-cell">
                <div class="weui-cell__bd">借款日期</div>
                <div class="weui-cell__ft text-dark">2018-01-22</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">还款日期</div>
                <div class="weui-cell__ft text-dark">2018-01-28</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">借款金额</div>
                <div class="weui-cell__ft text-currency">
                    1500.00
                    <span class="text-xs">元</span>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">年化利率</div>
                <div class="weui-cell__ft text-dark">
                    0
                    <span class="text-xs">%</span>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">本息共计</div>
                <div class="weui-cell__ft text-currency">
                    1500.00
                    <span class="text-xs">元</span>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">借款用途</div>
                <div class="weui-cell__ft text-dark">旅游</div>
            </div>
            <div class="weui-cell_border"></div>
            <div class="weui-cell">
                <div class="weui-cell__bd">平台服务费</div>
                <div class="weui-cell__ft text-dark">
                    5.00
                    <span class="text-xs">元</span>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">协议编号</div>
                <div class="weui-cell__ft text-dark">18012210262768906333</div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <a id="linkAgreement" href="javascript:void(0);" data-intermediaversion="2" data-iouversion="2">电子协议（点击查看）</a>
                </div>
                <div class="weui-cell__ft">
                    <a id="linkMore" href="javascript:void(0);" class="app-hide">更多</a>
                </div>
            </div>
            <img src="/assets/fund/status-effecting.png" class="status">
        </div>
    </div>
    <div id="divAction" class="weui-submit-area">
        <div class="weui-flex">
            <div class="weui-flex__item mr10">
                <button id="btnExtend" class="btn btn-primary-solid" type="button">展期</button>
            </div>
            <div class="weui-flex__item weui-flex__item-2">
                <button class="btn btn-success" type="button" data-status="Destroyed">对方已还款，撕毁凭证</button>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript" src="/assets/fund/jquery-2.1.4.min.js.下载"></script>
<script type="text/javascript" src="/assets/fund/jquery.transit.js.下载"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.min.js.下载"></script>
<script type="text/javascript" src="/assets/fund/jquery.validate.unobtrusive.min.js.下载"></script>
<script type="text/javascript" src="/assets/fund/jweixin-1.2.0.js.下载"></script>
<script type="text/javascript" src="/assets/fund/jquery-weui.min.js.下载"></script>
<script type="text/javascript" src="/assets/fund/crypto-js.js.下载"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.jquery.validate.unobtrusive.js.下载"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.enum.mapping.js.下载"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.form.js.下载"></script>
<script type="text/javascript" src="/assets/fund/ym.ypz.mobile.js.下载"></script>
<script type="text/javascript">
    var Environment = 'PRO';
    var WechatParameters = 'd3hjMWY4YzMxMjljMDg4YTNhfDE1MTcxNDAyMzV8NjUzNkYzNDNCRTkxMTFDNkZCQTUxNkQ3OTI2ODRCQUN8NzI1YzY2YjQwMTJkMzljMjMwYjcyMWI4ZjBmMDFlYWNkNDI0M2Y5Mw==';
</script>
<script type="text/javascript" src="/assets/fund/info.js"></script>

</body></html>