$(function () {

    $("#formSignin").show().find("#CellPhoneNumber").focus();

    $("#linkRegister, #linkForgotPassword").on({
        click: function () {
            $('#formSignin input[type!="hidden"]').val("");

        }
    });
    /*
    $("#formSignin").appSubmit({

        onSuccess: function (b) {

            handleAjaxResult(b, function () {
                location = '/m';
            })

        }
    });
    */

});