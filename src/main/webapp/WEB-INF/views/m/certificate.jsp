<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
    <title>打凭证</title>
    <link rel="stylesheet" type="text/css" href="/assets/account/weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/account/jquery-weui.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/account/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.css">
    <link rel="stylesheet" type="text/css" href="/assets/account/ym.ypz.mobile.extension.css">
    <link rel="stylesheet" type="text/css" href="/assets/account/new.css">
</head>
<body style="position: fixed; top: 0px; left: 0px; right: 0px;">
<form action="${ctx}/m/cert" id="formNew" method="post" novalidate="novalidate">
    <div class="container">
        <img src="/assets/account/dai.png" class="head-img">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd weui-label"><label for="DebtorId">借款人</label></div>
                <div class="weui-cell__bd text-right">
                    <%--<input data-val="true" data-val-number="字段 借款人 必须是一个数字。" data-val-required="请输入借款人" id="DebtorId"
                           name="DebtorId" type="hidden" value="44041">--%>
                    <shiro:principal property="nickName"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd weui-label"><label for="DebtorId">借款人手机号</label></div>
                <div class="weui-cell__bd text-right">
                    <%--<input data-val="true" data-val-number="字段 借款人 必须是一个数字。" data-val-required="请输入借款人" id="DebtorId"
                           name="DebtorId" type="hidden" value="${user.mobile}">--%>
                    ${user.mobile}
                </div>
            </div>
            <div class="weui-cell_message">
                <span class="field-validation-valid" data-valmsg-for="DebtorSignatureImageUrl"
                      data-valmsg-replace="true"></span>
            </div>
            <div class="weui-cell_border"></div>
            <div class="weui-cell weui-cell_vcode">
                <div class="weui-cell__hd weui-label"><label for="CreditorName">出借人</label></div>
                <div class="weui-cell__bd">
                    <input class="form-control text-right" data-val="true" data-val-required="请输入出借人姓名"
                           data-val-textlength="请勿超过128个字符" data-val-textlength-doublebytelength="2"
                           data-val-textlength-maximumlength="128" data-val-textlength-minimumlength="0"
                           id="CreditorName" name="lendername" placeholder="请输入出借人姓名" type="text" value="">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
                <div class="weui-cell__ft">
                    <span id="spanCreditorName"
                          class="fa fa-exclamation-circle text-warning weui-vcode-icon hide"></span>
                </div>
            </div>
            <div class="weui-cell_border"></div>
            <div class="weui-cell weui-cell_select">
                <div class="weui-cell__hd weui-label"><label for="BorrowingDate">借款日期</label></div>
                <div class="weui-cell__bd">
                    <input class="form-control select text-right" data-cansame="false" data-clear="false"
                           data-max="#RepaymentDate" data-toggle="date" data-val="true" data-val-date="字段 借款日期 必须是日期。"
                           data-val-required="请选择借款日期" id="BorrowingDate" name="putoutdate" placeholder="请选择借款日期"
                           type="text" value="" readonly="">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
            </div>
            <div class="weui-cell weui-cell_select">
                <div class="weui-cell__hd weui-label"><label for="RepaymentDate">还款日期</label></div>
                <div class="weui-cell__bd">
                    <input class="form-control select text-right" data-cansame="false" data-clear="false"
                           data-min="#BorrowingDate" data-toggle="date" data-val="true" data-val-date="字段 还款日期 必须是日期。"
                           data-val-required="请选择还款日期" id="RepaymentDate" name="maturity" placeholder="请选择还款日期"
                           type="text" value="" readonly="">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
            </div>
            <div class="weui-cell_message">
                <span id="spanDays" class="default"></span>
            </div>
            <div class="weui-cell weui-cell_vcode">
                <div class="weui-cell__hd weui-label"><label for="Amount">借款金额</label></div>
                <div class="weui-cell__bd">
                    <input class="form-control text-right" data-val="true" data-val-number="字段 借款金额 必须是一个数字。"
                           data-val-range="请输入0.01~200000" data-val-range-max="200000" data-val-range-min="0.01"
                           data-val-required="请输入借款金额" id="Amount" name="loanmoney"
                           onkeyup="this.value=this.value.replace(/[^\d\.]/ig,&#39;&#39;);" placeholder="请输入借款金额"
                           type="number" value="">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-vcode-icon text-currency">元</span>
                </div>
            </div>
            <div class="weui-cell_message">
                <input data-val="true" data-val-required="请输入大写金额" id="AmountCN" name="AmountCN" type="hidden" value="">
                <span id="spanAmountCN" class="default"></span>
            </div>
            <div class="weui-cell weui-cell_select">
                <div class="weui-cell__hd weui-label"><label for="AnnualInterestRate">年化利率</label></div>
                <div class="weui-cell__bd">
                    <input type="text" class="form-control select text-right select" placeholder="请选择年化利率"
                           data-clear="false" readonly=""><select class="form-control select text-right"
                                                                  data-clear="false" data-toggle="select"
                                                                  data-val="true" data-val-required="请输入年化利率"
                                                                  id="AnnualInterestRate" name="yrate"
                                                                  style="display: none;">
                    <option value="">请选择年化利率</option>
                    <option value="0">0%</option>
                    <option value="1">1%</option>
                    <option value="2">2%</option>
                    <option value="3">3%</option>
                    <option value="4">4%</option>
                    <option value="5">5%</option>
                    <option value="6">6%</option>
                    <option value="7">7%</option>
                    <option value="8">8%</option>
                    <option value="9">9%</option>
                    <option value="10">10%</option>
                    <option value="11">11%</option>
                    <option value="12">12%</option>
                    <option value="13">13%</option>
                    <option value="14">14%</option>
                    <option value="15">15%</option>
                    <option value="16">16%</option>
                    <option value="17">17%</option>
                    <option value="18">18%</option>
                    <option value="19">19%</option>
                    <option value="20">20%</option>
                    <option value="21">21%</option>
                    <option value="22">22%</option>
                    <option value="23">23%</option>
                    <option value="24">24%</option>
                </select>
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
            </div>
            <div class="weui-cell_message">
                <input data-val="true" data-val-number="字段 利息（元） 必须是一个数字。" data-val-range="请输入0~200000"
                       data-val-range-max="200000" data-val-range-min="0" data-val-required="请输入利息（元）" id="Interest"
                       name="Interest" type="hidden" value="">
                <input data-val="true" data-val-required="请输入大写利息" id="InterestCN" name="InterestCN" type="hidden"
                       value="">
                <input data-val="true" data-val-number="字段 本息共计（元） 必须是一个数字。" data-val-range="请输入0.01~200000"
                       data-val-range-max="200000" data-val-range-min="0.01" data-val-required="请输入本息共计（元）"
                       id="TotalAmount" name="TotalAmount" type="hidden" value="">
                <input data-val="true" data-val-required="请输入大写本息共计" id="TotalAmountCN" name="TotalAmountCN"
                       type="hidden" value="">
                <span id="spanInterest" class="default"></span>
            </div>
            <div class="weui-cell weui-cell_select">
                <div class="weui-cell__hd weui-label"><label for="LoanUse">用途</label></div>
                <div class="weui-cell__bd">
                    <input type="text" class="form-control text-right " data-val="true" data-val-textlength="请勿超过128个字符"
                           placeholder="请输入用途" data-clear="false" data-val-textlength-doublebytelength="2"
                           data-val-textlength-maximumlength="128" data-val-textlength-minimumlength="0" name="purpose">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
            </div>
            <div class="weui-cell_border"></div>
            <div class="weui-cell">
                <div class="weui-cell__hd weui-label"><label for="Remark">备注</label></div>
                <div class="weui-cell__bd">
                    <input class="form-control text-right" data-val="true" data-val-textlength="请勿超过128个字符"
                           data-val-textlength-doublebytelength="2" data-val-textlength-maximumlength="128"
                           data-val-textlength-minimumlength="0" id="Remark" name="remark" placeholder="(选填)请输入备注"
                           type="text" value="">
                </div>
                <div class="weui-cell__ft">
                    <span class="weui-icon-warn"></span>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd weui-label"><label for="ServiceCharge">服务费</label></div>
                <div class="weui-cell__bd text-right">
                    <input data-val="true" data-val-number="字段 服务费 必须是一个数字。" data-val-range="请输入0~1.79769313486232E+308"
                           data-val-range-max="1.79769313486232E+308" data-val-range-min="0" data-val-required="请输入服务费"
                           id="ServiceCharge" name="servicemonry" type="hidden" value="${servicemonry}">
                    <span class="text-currency">
${servicemonry}
<span class="text-xs">元</span>
</span>
                </div>
            </div>
            <div class="weui-cell weui-cell_agreement">
                <div class="weui-cell__bd">
                    <label class="checkbox checkbox-primary checkbox-inline">
                        <input id="cbAgreement" type="checkbox" checked="checked">
                        <span>已阅读并同意</span>
                    </label>
                    <a href="#">《opo宝服务协议》</a>
                    <a href="#">《借款协议》</a>
                </div>
            </div>
        </div>
    </div>
    <div class="weui-submit-area">
        <button id="btnSubmit" type="button" class="btn btn-primary">创建凭证</button>
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
<script type="text/javascript" src="/assets/account/new.js"></script>


</body>
</html>