<%@ Page Title="" Language="C#" MasterPageFile="~/xsMaste.Master" AutoEventWireup="true" CodeBehind="reg_login.aspx.cs" Inherits="xs.reg_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>       
        #msg {
            width: 100%;
            line-height: 40px;
            font-size: 14px;
            text-align: center;
            color:red;
        }

        a:link, a:visited, a:hover, a:active {
            margin-left: 100px;
            color: #0366D6;
        }
    </style>
    <script src="scripts/JqureySession.js"></script>
    <link href="Styles/jigsaw.css" rel="stylesheet" />
    <script src="scripts/distlogin/jigsaw.js"></script>
    <div style="padding-top: 20px; padding-bottom: 20px; text-align: center;"></div>
    <div class="input-group" style="margin-left: 33%;">
        <span class="input-group-addon" id="basic-addon1">用户名</span>
        <input type="text" style="width: 300px;" maxlength="50" class="form-control" placeholder="用户名" id="userName" aria-describedby="basic-addon1" />
    </div>
    <div class="input-group" style="padding-top: 20px; margin-left: 33%">
        <span class="input-group-addon" id="basic-password">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
        <input type="password" style="width: 300px;" maxlength="50" class="form-control" placeholder="密码" id="password" aria-describedby="basic-password" />
    </div>
    <div class=" container" style="padding-top: 20px;width: 310px;">
        <div id="captcha"></div>
        <div id="msg"></div>
    </div>
    <div class="input-group" style="padding-top: 20px; margin-left: 40%">
        <button type="button" class="btn btn-default navbar-btn" id="btnLogin">Sign in</button>
        <a href="reg_ResetPass.aspx" style="margin-left: 20px;">忘记密码？</a>
    </div>
    <script type="text/javascript">
        ///
        jigsaw.init({
            el: document.getElementById('captcha'),
            onSuccess: function () {
               
                document.getElementById('msg').innerHTML = '验证通过！'//#52ccba
                $("#msg").css('color', '#52ccba');
            },
            onFail: cleanMsg,
            onRefresh: cleanMsg
        })
        function cleanMsg() {
            document.getElementById('msg').innerHTML = '请拖动到指定位置！'
        }
        ///
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                document.getElementById("btnLogin").click();
            }
        })
        $('body').attr("onkeydown");
        $("#btnLogin").click(function () {
          
            if (document.getElementById('msg').innerHTML == "") {            
                document.getElementById('msg').innerHTML = '请先通过验证！！';               
                return;
            } else if (document.getElementById('msg').innerHTML == "验证通过！") {
                if ($("#userName").val().length == 0 || $("#password").val().length == 0) {
                    alert("请输入用户名或者密码");
                    return;
                }

                var stuUer = {
                    userName: $("#userName").val(),
                    password: $("#password").val()
                };
                var strSut = JSON.stringify(stuUer);
                $.ajax({
                    type: "Post",
                    url: "reg_Login.aspx/Login1",
                    dataType: "Json",
                    contentType: "application/json;charset=utf-8",
                    data: strSut,
                    success: function (data) {
                        var reValue = JSON.parse(data.d);
                        //alert(reValue.message);
                        // alert("首次报名成功，请牢记您的登录用户名：" + reValue.SignUpNum);
                        if (reValue.code == 1) {
                            $(location).attr('href', 'reg_EntityInfo.aspx');
                        } else {
                            alert("请重新登陆！！");
                        }
                    },
                    error: function (errdata) {
                        alert("后台数据错误");
                    }
                });
            }
               
        })
    </script>
</asp:Content>
