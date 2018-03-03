$(function () {
    $("#sendVerificationCode").click(function () {
        if ($(this).hasClass("text-disabled")) {
            return false
        }
        if (!$("#Phone").valid() | !$("#CaptchaCode").valid()) {
            return false
        }
        $.showLoading("处理中");
        $.appAjax({
            url: "/mobile/phoneverification/sendcertificationponecode",
            data: $("#frmBindPhone").appSerialize(),
            onSuccess: function (b) {
                $.hideLoading();
                if (b.result) {
                    $.toast("发送成功");
                    var c = 60;
                    var a = setInterval(function () {
                        c--;
                        if (c == 0) {
                            $("#sendVerificationCode").text("重新发送").removeClass("text-disabled");
                            clearInterval(a)
                        } else {
                            $("#sendVerificationCode").text("重新发送(" + c + ")").addClass("text-disabled")
                        }
                    }, 1000)
                } else {
                    $.toast(b.message, "cancel")
                }
            },
            onError: function (a) {
                $.hideLoading();
                $.toptip("您的网络开了小差，请刷新重试", 5000, "error")
            }
        })
    });
    $("#btnCertificationpone").click(function () {
        if (!$("form").valid()) {
            return false
        }
        $.showLoading("处理中");
        $.appAjax({
            url: $("#frmBindPhone").attr("action"),
            data: $("#frmBindPhone").appSerialize(),
            onSuccess: function (a) {
                $.hideLoading();
                if (a.result) {
                    $.toast("认证成功", function () {
                        location.href = location.href + "&" + parseInt(Math.random() * 1000)
                    })
                } else {
                    $.toast(a.message, "cancel")
                }
            },
            onError: function (a) {
                $.hideLoading();
                $.toptip("您的网络开了小差，请刷新重试", 5000, "error")
            }
        })
    });
    $("#imgCaptchaCode").click(function () {

        $("#imgCaptchaCode").attr("src", "/pub/jcaptcha.servlet");
        /*
        $.appAjax({

            url: "/pub/jcaptcha.servlet", onSuccess: function (a) {
                debugger;
                console.log(a);
                if (a.result) {
                    $("#imgCaptchaCode").attr("src", a.data)
                } else {
                    $.toast(a.message, "cancel")
                }
            }, onError: function (a) {
                debugger;
                console.log(a);

                if (a.responseText) {
                    $("#imgCaptchaCode").attr("src", a.responseText)
                } else {
                    $.toast(a.message, "cancel")
                }



                $.toptip("您的网络开了小差，请刷新重试", 5000, "error")
            }
        })*/
    })
});