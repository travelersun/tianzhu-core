$(function () {
    var f = $("#DebtorName").val();
    var a = function () {
        var h = $("#BorrowingDate").val(), g = $("#RepaymentDate").val();
        var i = (parseDatetime(g) - parseDatetime(h)) / daysTime;
        $("#spanDays").html(i && !isNaN(i) ? ("共" + i + "天") : "").data("days", i)
    };
    var c = function () {
        var i = parseFloat($("#Amount").val()), j = parseFloat($("#AnnualInterestRate").val()),
            m = parseFloat($("#spanDays").data("days"));
        if (isNaN(i) || isNaN(j) || isNaN(m)) {
            $("#Interest").val("");
            $("#InterestCN").val("");
            $("#TotalAmount").val("");
            $("#TotalAmountCN").val("");
            $("#spanInterest").html("")
        } else {
            var l = i && j && m ? i * j / 100 * m / 365 : 0;
            var k = i + l;
            var g = l.toFixed(2);
            var h = k.toFixed(2);
            $("#Interest").val(g);
            $("#InterestCN").val(digital.convertCN(g));
            $("#TotalAmount").val(h);
            $("#TotalAmountCN").val(digital.convertCN(h));
            $("#spanInterest").html(g + "元")
        }
    };
    var b = function () {
            $("#formNew").submit();
    };

    $("#CreditorName").on({
        change: function () {
            if ($(this).val() === f) {
                $("#spanCreditorName").show()
            } else {
                $("#spanCreditorName").hide()
            }
        }
    });
    $("#spanCreditorName").on({
        click: function () {
            alert("出借人姓名与你相同，请确认")
        }
    });
    $("#BorrowingDate").val(today.toFormat("yyyy-MM-dd"));
    $("#BorrowingDate,#RepaymentDate").appCalendar({
        onClose: function (g) {
            g.valid();
            a();
            c()
        }
    });
    $("#Amount").on({
        change: function () {
            var g = $(this);
            if (g.valid()) {
                cn = digital.convertCN(g.val());
                $("#AmountCN").val(cn);
                $("#spanAmountCN").html(cn)
            } else {
                $("#AmountCN").val("");
                $("#spanAmountCN").html("")
            }
            c()
        }
    });
    $("#AnnualInterestRate").on({
        change: function () {
            c()
        }
    });
    $("#btnSubmit").on({
        click: function () {
            if ($("#cbAgreement").is(":checked")) {
                if ($("#formNew").valid()) {
                    b();
                }
            } else {
                alert("请先阅读并同意《借款协议》")
            }
        }
    });
    $("#formNew").appSubmit({
        onBeforeSend: function (g) {
            if (parseDatetime(g.BorrowingDate) - parseDatetime(g.RepaymentDate) >= 0) {
                $.toast("还款日期必须大于借款日期", "text");
                return false
            }
        }, onSuccess: function (g) {
            //handleAjaxResult(g, function () {
               // location.href = g.data
            //})
            console.log(g);
            if(g.type == "success"){

                location.href = "/m";
            }else{
                location.href = "/m/cert";
            }

        }
    })
});