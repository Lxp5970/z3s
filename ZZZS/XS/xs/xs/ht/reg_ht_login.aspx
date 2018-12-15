<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg_ht_login.aspx.cs" Inherits="xs.ht.reg_ht_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台登陆</title>
    <script src="../scripts/jquery-3.3.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/myCss.css" rel="stylesheet" />
    <script src="../scripts/JqureySession.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <style>
            #msg {
                width: 100%;
                line-height: 40px;
                font-size: 14px;
                text-align: center;
                color: red;
            }

            a:link, a:visited, a:hover, a:active {
                margin-left: 100px;
                color: #0366D6;
            }
        </style>
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 hidden-sm">
                    <img src="../Images/logo.gif" alt="太原城市学院" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12" style="height: 82px; background-color: blue;">
                    <div id="sysName" class="text-center">
                        单独招生报考系统后台管理
                    </div>
                    <div id="sysEName" class="text-right">
                        Sole Recruit Students
                    </div>
                </div>
            </div>
            <!--页面-->
            <div class="row">
                <div style="padding-top: 20px; padding-bottom: 20px; text-align: center;"></div>
                <div class="input-group" style="margin-left: 33%;">
                    <span class="input-group-addon" id="basic-addon1">管理员账号</span>
                    <input type="text" style="width: 300px;" maxlength="50" class="form-control" placeholder="管理员账号" id="userName" aria-describedby="basic-addon1" />
                </div>
                <div class="input-group" style="padding-top: 20px; margin-left: 33%">
                    <span class="input-group-addon" id="basic-password">&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;</span>
                    <input type="password" style="width: 310px;" maxlength="50" class="form-control" placeholder="密码" id="password" aria-describedby="basic-password" />
                </div>
                <div class=" container" style="padding-top: 20px; width: 310px;">
                    <div id="captcha"></div>
                    <div id="msg"></div>
                </div>
                <div class="input-group" style="padding-top: 20px; margin-left: 40%">
                    <button type="button" class="btn btn-default navbar-btn" id="btnLogin">Sign in</button>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 bootDiv1">
                </div>
                <div class="col-lg-12 bootDiv2 text-center">
                    版权所有：©太原城市职业技术学院
                </div>
            </div>
        </div>
        <script type="text/javascript">
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                document.getElementById("btnLogin").click();
            }
        })
        $('body').attr("onkeydown");
        $("#btnLogin").click(function () {
                if ($("#userName").val().length == 0 || $("#password").val().length == 0) {
                    alert("请输入管理员账号或者密码");
                    return;
                }
                var stuUer = {
                    userName: $("#userName").val(),
                    password: $("#password").val()
                };
                var strSut = JSON.stringify(stuUer);
                $.ajax({
                    type: "Post",
                    url: "reg_ht_login.aspx/login_ht",
                    dataType: "Json",
                    contentType: "application/json;charset=utf-8",
                    data: strSut,
                    success: function (data) {
                       var reValue = JSON.parse(data.d);
                       if (reValue.code == 1) {
                            $(location).attr('href', 'reg_ht_ShowStuInfo.aspx');
                       } else {
                            alert(reValue.message);
                        }
                    },
                    error: function (errdata) {
                        alert("后台数据错误");
                    }
                }); 
        })
    </script>
    </form>
</body>
</html>
