wechatJSAPIList = ShareContent && Environment === SystemEnvironment.name.PRO ? ["onMenuShareAppMessage"] : undefined;
$(function () {
    var g = $("#hCustomerId").val(), f = $("#divPending"), b = $("#divEffecting"), e = 20;
    wx.ready(function () {
        wx.onMenuShareAppMessage(ShareContent)
    });
    var a = "YM.YPZ.ISAUTHORIZETIPS";
    var c = $("#hAuthorizationUrl").val();
    if (!cookie.get(a) && c) {
        cookie.set(a, "1", 7 * 24 * 60);
        alert("请授权芝麻信用，进行实名验证", function () {
            location.href = c
        })
    } else {
        var h = "YM.YPZ.ISUNAUTHENTICATEDTIPS";
        if (!cookie.get(h) && $("#hIsAuthenticated").val() !== "TRUE") {
            cookie.set(h, "1", 7 * 24 * 60);
            alert("你的实名认证未通过，为了不影响你的使用，稍后请到个人设置页进行实名认证")
        }
        if ($("#hUnreadNotificationId").val()) {
            loadUrl("系统通知", "/m/customer/notification/" + encodeParameters($("#hUnreadNotificationId").val()))
        }
    }
    $("#spanBalanceTips").on({
        click: function () {
            alert("可用于打凭证时支付服务费用")
        }
    });
    var d = function (i) {
        $.appAjax({
            url: "/m/customer/financeinfo", executeBeforeSendFunc: !!i, onSuccess: function (j) {
                $("#Balance").html(j.balance.toFixed(2) + "元");
                $("#TotalReceivable").html(j.totalReceivable.toFixed(2));
                $("#TotalRepayable").html(j.totalRepayable.toFixed(2))
            }
        });
        $.appAjax({
            url: "/m/iou/list",
            data: {
                page: 1,
                size: e,
                status: YcLoanIouStatus.Pending,
                sorted: IOUListSorted.RepaymentDateAES,
                GetPendingExten: true
            },
            executeBeforeSendFunc: false,
            onSuccess: function (j) {
                f.empty().append('<div class="text-center text-muted text-xs pt5">最近' + e + "条凭证信息</div>");
                if (j.data && j.data.length) {
                    renderIOU(g, f, j.data)
                }
                if (j.additional && j.additional.length) {
                    renderExten(g, f, j.additional)
                }
                if (f.children().length > 1) {
                    f.append('<a href="/m/iou/list/' + encodeParameters(YcLoanIouStatus.Pending) + '" class="view-more">查看更多</a>')
                } else {
                    f.append('<div class="no-data"><img src="/Content/Images/data-none.png" /><div>暂无凭证</div></div>')
                }
            }
        });
        $.appAjax({
            url: "/m/iou/list",
            data: {page: 1, size: e, status: YcLoanIouStatus.Effecting, sorted: IOUListSorted.RepaymentDateAES},
            executeBeforeSendFunc: false,
            onSuccess: function (j) {
                b.empty().append('<div class="text-center text-muted text-xs pt5">最近' + e + "条凭证信息</div>");
                if (j.data && j.data.length) {
                    renderIOU(g, b, j.data)
                }
                if (b.children().length > 1) {
                    b.append('<a href="/m/iou/list/' + encodeParameters(YcLoanIouStatus.Effecting) + '" class="view-more">查看更多</a>')
                } else {
                    b.append('<div class="no-data"><img src="/Content/Images/data-none.png" /><div>暂无凭证</div></div>')
                }
            }
        })
    };
    d();
    $("#linkReloadData").on({
        click: function () {
            d(true)
        }
    });
    $("#divFinance > div").on({
        click: function () {
            location.href = "/m/debt/info/" + encodeParameters($(this).index())
        }
    })
});