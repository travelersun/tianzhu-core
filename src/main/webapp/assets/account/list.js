
$(function () {
    var c = $("#formList");
    var e = $("#datalist");
    var f = $("#hCustomerId").val();
    var d = function (g) {
        $("#divTabs .link-dropdown").each(function () {
            var h = $(this);
            if (!h.is(g)) {
                h.removeClass("active");
                if (h.children("i").attr("class").indexOf("fa-sort-asc") >= 0) {
                    h.children("i").removeClass("fa-sort-asc").addClass("fa-sort-desc")
                }
                h.next("div").hide()
            }
        })
    };
    $("#divTabs .link-dropdown").on({
        click: function () {
            var g = $(this);
            g.addClass("active");
            d(g);
            if (g.children("i").attr("class").indexOf("fa-sort-desc") >= 0) {
                g.children("i").removeClass("fa-sort-desc").addClass("fa-sort-asc")
            }
            g.next("div").show();
            $("#Keyword").focus()
        }
    });
    $('#divTabs input[type="radio"]').on({
        change: function () {
            $("#Page").val(1);
            b = true;
            var h = $(this);
            var g = h.parents(".dropdownbox").prev();
            g.children("span").text(h.parent(".weui-cell__ft").prev(".weui-cell__bd").html());
            if (h.attr("name") == "Status") {
                $("#IsOverdue").val(h.data("isoverdue"))
            }
        }
    });
    $(".dropdownbox .dropdownbox-mask").click(function () {
        d()
    });

    c.appAutoSubmit().on({
        submit: function (h) {
            h.preventDefault();
            d();
            $("#divEnd").hide();
            $("#divNone").hide();
            $("#divLoadMore").show();
            var g = c.appSerialize();
            $.appAjax({
                url: c.attr("action"),
                data: g,
                executeBeforeSendFunc: g.Page == 1,
                executeCompleteFunc: g.Page == 1,
                onBeforeSend: function () {
                    g.Page == 1 && $(document).scrollTop(0);
                    a = true
                },
                onSuccess: function (i) {


                        b = true;
                        //$("#divLoadMore").show()
                    $("#divLoadMore").hide();
                        e.empty()

                    if (i) {
                        //renderIOU(f, e, i.data)
                        $("#datalist").append(i);
                    }

                    a = false
                },
                onError:function (i) {


                    b = true;
                    //$("#divLoadMore").show()

                    e.empty()

                    if (i) {
                        //renderIOU(f, e, i.data)
                        $("#datalist").append(i.responseText);
                    }

                    $('#divLoadMore').hide();

                    a = false

                }
            })

        }
    }).submit();


    var b = false;
    var a = false;
    $(document.body).infinite(100).on("infinite", function () {
        if (!b || a) {
            return
        }
        a = true;
        $("#Page").val(parseInt($("#Page").val()) + 1);
        c.submit()
    })
})