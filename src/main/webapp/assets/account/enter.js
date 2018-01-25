$(function () {

    $("#formSignin").show().find("#CellPhoneNumber").focus();

    $("#linkRegister, #linkForgotPassword").on({
        click: function () {
            $('#formSignin input[type!="hidden"]').val("");

        }
    });

});