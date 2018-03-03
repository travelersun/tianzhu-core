$(function () {
    $("#ProtocolText").css("height", ($(window).height() - 61) + "px");
    var init = function () {
        $(".weui-cells").each(function () {
            if ($(this).children(".weui-cell").length == 0) {
                if ($(this).data("id")) {
                    $("#" + $(this).data("id")).remove()
                }
                $(this).remove()
            }
        });
        $("form").each(function (i) {
            if ($(this).children(".weui-cells").length == 0) {
                $("#step" + (i + 1)).remove();
                $(this).remove();
                $(".m-navbar li").css("width", (100 / $(".m-navbar li").length) + "%")
            }
        });
        $("#btnNext").text($("form").length == 1 && !$("#IsCertification").val() ? "确定" : "下一步");
        var list = JSON.parse($("#hidFieldData").val());
        for (var name in list) {
            var item = list[name];
            var $input = $("#" + name);
            $input.attr("placeholder", item.Description);
            if (item.IsRequired || item.ValueLimit) {
                $input.attr("data-val", "true")
            }
            if (item.IsRequired) {
                $input.attr("data-val-required", item.Description)
            }
            if (!item.ValueLimit) {
                continue
            }
            var valueLimit = JSON.parse(item.ValueLimit.replace(/\\/g, "\\\\"));
            var regex = valueLimit.value;
            if (valueLimit.type == "Enum") {
                var enumObject = eval(valueLimit.value);
                var enumNameList = [];
                for (var enumItem in enumObject.name) {
                    enumNameList.push(enumItem)
                }
                regex = "^(" + enumNameList.join("|") + "){1}$"
            }
            $input.attr({"data-val-regex-pattern": regex, "data-val-regex": item.Name + "格式错误"})
        }
        $("form").appBindValidator()
    }();
    $("#Area").appCityPicker({
        title: "请选择所在地区", onChange: function (data, list) {
            $("#ProvinceId").val(list[0]).valid();
            $("#CityId").val(list[1]).valid();
            $("#DistrictId").val(list[2]).valid()
        }
    });
    $(".m-navbar li").click(function () {
        if ($(this).hasClass("status-curr") && $("form.form-action").length > 0) {
            updateFrmAction($("form").eq($(this).prevAll("li").length))
        }
    });
    var updateFrmAction = function ($next) {
        $("form").removeClass("form-action");
        $next.addClass("form-action");
        $(".m-navbar ul li").removeClass("status-curr");
        $(".m-navbar ul li:lt(" + ($next.prevAll("form").length + 1) + ")").addClass("status-curr");
        $("#btnNext").text($next.nextAll("form").length == 0 && !$("#IsCertification").val() ? "确定" : "下一步");
        $("body,html").animate({scrollTop: 0}, 100)
    };
    $("#btnNext").click(function () {
        if (!$("form.form-action").valid()) {
            return false
        }
        if ($("form.form-action").prevAll("form").length + 1 < $("form").length) {
            var $next = $("form.form-action").next();
            updateFrmAction($next)
        } else {
            $.showLoading("处理中");
            $.appAjax({
                url: "/mobile/applyform/add", data: $("form").appSerialize(), onSuccess: function (data) {
                    $.hideLoading();
                    if (data.result) {
                        if ($("#IsCertification").val()) {
                            $("#divCertification").removeClass("hide");
                            $("form").removeClass("form-action");
                            $("#btnNext").parent().hide();
                            $("#step4").addClass("status-curr")
                        } else {
                            $.toast("申请借贷成功", function () {
                                location.href = $("#ReturnUrl").val()
                            })
                        }
                    } else {
                        $.toast(data.message, "cancel")
                    }
                }, onError: function (response) {
                    $.hideLoading();
                    $.toptip("您的网络开了小差，请刷新重试", 5000, "error")
                }
            })
        }
    });
    $('input[type="file"]').appCompressionUploadFile({
        url: "m/file/upload/single",
        onBeforeSubmit: function (file, $this) {
            var $progress = $this.parents(".weui-uploader__bd").next().children("div");
            $progress.css("width", "100%");
            $progress.next("span").text("上传中(100%)");
            $progress.parent().show()
        },
        onSuccess: function (response, $this) {
            $this.parent().children('input[type="hidden"]').val(response.data).valid();
            $this.parent().children("img").attr("src", response.data)
        },
        onError: function (response, $this) {
            //$.toptip("您的网络开了小差，请刷新重试", 5000, "error")
        },
        onComplete: function (response, completeString, $this) {
            $this.parents(".weui-uploader__bd").next().hide()
        },
    });
    $("#divAddressBook").click(function () {
        if ($(this).hasClass("disabled")) {
            return false
        }
        $("#Protocol").popup()
    });
    $("#btnAddressBook").click(function () {
        var data = window.contacts.getContacts();
        setContacts(data.base64Encrypt())
    })
});
var setContacts = function (b) {
    var a = JSON.parse(b.base64Decrypt());
    if (a.result) {
        $("#spanAddressBook").text("已导入");
        $("#AddressBook").val(JSON.stringify(a.contacts));
        $("#divAddressBook").addClass("disabled");
        $("#divAddressBook").find(".weui-cell").removeClass("weui-cell_access")
    }
    $.closePopup()
};