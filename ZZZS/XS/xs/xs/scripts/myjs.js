///验证手机号码
function checkMobile(mobile) {
    var re = new RegExp("^1[0-9]{10}")
    if (mobile.toString() == "") {
        $("#e_mobileError").html("请输入正确的手机号码。");
        $("#e_mobileError").show();
        return false;
    } else if (re.test(mobile) == false) {
        $("#e_mobileError").html("请输入正确的手机号码。");
        $("#e_mobileError").show();
        return false;
    }
    $("#e_mailError").hide();
    return true;
}
///验证邮箱
function checkEmail(email) {
    var emailre = new RegExp("\w([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*")
    if (email.toString() == "") {
        $("#e_mailError").html("请输入正确的E_Mail地址。");
        $("#e_mailError").show();
        return false;
    } else if (re.test(email) == false) {
        $("#e_mailError").html("请输入正确的E_Mail地址。");
        $("#e_mailError").show();
        return false;
    }
    $("#e_mailError").hide();
    return true;
}
///验证密码是否相同
function checkPassword(password, Qrpassword) {
    if (password != Qrpassword) {
        $("#passwordError").html("两次输入密码不一样。");
        $("#passwordError").show();
        $("#QrpasswordError").html("两次输入密码不一样。");
        $("#QrpasswordError").show();
        return false;
    }
    $("#passwordError").hide();
    $("#QrpasswordError").hide();
    return true;
}
///验证准考生号是否正确

function checkZkkh(zkkh) {
    var date = new Date();
    var year = date.getFullYear().toString().substring(2, 4);
    var re = new RegExp("^" + year + "14[0-9]{10}" + "$");
    if (re.test(zkkh) == false) {
        $("#zkkhError").html("请输入正确的准考证号。");
        $("#zkkhError").show();
        return false;
    }
    $("#zkkhError").hide();
    return true;
}
///