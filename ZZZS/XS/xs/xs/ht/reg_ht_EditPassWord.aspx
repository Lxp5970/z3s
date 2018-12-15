<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg_ht_EditPassWord.aspx.cs" Inherits="xs.ht.reg_ht_EditPassWord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改管理员密码</title>
    <script src="../scripts/jquery-3.3.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../scripts/JqureySession.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/myCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <script src="../scripts/dist/jquery.validate.min.js"></script>
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
                <div style="padding: 10px 10px 10px 10px; margin-left: 33%">
                    <div class="input-group input-group-top">
                        <span class="input-group-addon" id="basic-userName">站点登陆的管理员：</span>
                        <input type="text" style="width: 300px;" class="form-control" autofocus="autofocus" readonly="true" placeholder="用户名称" aria-describedby="basic-userName" id="userName" name="userName" />
                    </div>
                    <input type="hidden" id="stuID" />
                    <div class="input-group input-group-top">
                        <span class="input-group-addon" id="basic-Adduser" style="width: 152px;">管理员设置级别：</span>
                        <input type="text" class="form-control" style="width: 300px;" autofocus="autofocus" readonly="true" placeholder="管理员级别" aria-describedby="basic-Adduser" id="Adduser" name="Adduser" />
                    </div>
                    <div class="input-group input-group-top">
                        <span class="input-group-addon" id="basic-TeacherName" style="width: 152px;">管理员名称：</span>
                        <input type="text" class="form-control" style="width: 300px;" autofocus="autofocus" readonly="true" placeholder="管理员名称" aria-describedby="basic-TeacherName" id="TeacherName" name="TeacherName" />
                    </div>
                    <div class="input-group input-group-top">
                        <span class="input-group-addon" id="basic-password" style="width: 152px;">密   &nbsp;&nbsp;   码：</span>
                        <input type="password" style="width: 300px;" class="form-control" autofocus="autofocus" placeholder="请输入密码" aria-describedby="basic-password" id="password" name="password" />
                    </div>
                    <div class="input-group input-group-top">
                        <span class="input-group-addon" id="basic-password1" style="width: 152px;">确  认  密  码：</span>
                        <input type="password" style="width: 300px;" class="form-control" autofocus="autofocus" placeholder="请输入确认密码" aria-describedby="basic-password1" id="password1" name="password1" />
                    </div>
                    <div class=" input-group-btn input-group-top">
                        <button type="button" class="btn btn-default navbar-btn" id="editPassword">修改密码</button>
                    </div>
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
            $(document).ready(function () {
                $.ajax({
                    type: "Post",
                    url: "reg_ht_EditPassword.aspx/showInfo",
                    dataType: "Json",
                    contentType: "application/json;charset=utf-8",
                    success: function (data) {
                        var reValue = JSON.parse(data.d);
                        if (reValue.user != null) {
                            $("#userName").val(reValue.user.UserName);
                            $("#Adduser").val(reValue.user.AddUser);
                            $("#TeacherName").val(reValue.user.TeacherName);
                        } else if (reValue.user == null) {
                            alert("请登陆后再修改密码！");
                            $(location).attr('href', 'reg_ht_login.aspx');
                        }
                    },
                    error: function (errdata) {
                        alert("后台数据错误");
                    }
                });
            });
            $("#form1").validate({
                debug: true,
                rules: {
                    password: { required: true, equalTo: "#password1", minlength: 6 },
                    password1: { required: true, equalTo: "#password", minlength: 6 },
                },
                messages: {
                    password: { required: "请输入密码", equalTo: "与确认密码不相同！", minlength: "密码最少是6个字符!!!" },
                    password1: { required: "请再此确认密码", equalTo: "两次密码不相同！", minlength: "密码最少是6个字符!!!" },
                }
            });
            $("#editPassword").click(function () {
                if ($("#form1").valid() == true) {
                    var teacheruser = {
                        UserName: $("#userName").val(),
                        password: $("#password").val()
                    };
                    var stuUser = JSON.stringify(teacheruser);
                    $.ajax({
                        type: "Post",
                        url: "reg_ht_EditPassWord.aspx/editPass",
                        dataType: "Json",
                        contentType: "application/json;charset=utf-8",
                        data: stuUser,
                        success: function (data) {
                            var reValue = JSON.parse(data.d);
                            alert(reValue.message);
                            if (reValue.code == 1) {
                                $(location).attr('href', 'reg_ht_login.aspx');
                            }
                        },
                        error: function (errdata) {
                            alert("后台数据错误");
                        }
                    });
                } else {
                    return false;
                }
            });
        </script>
    </form>
</body>
</html>
