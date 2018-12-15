<%@ Page Title="" Language="C#" MasterPageFile="~/xsMaste.Master" AutoEventWireup="true" CodeBehind="reg_sqbm.aspx.cs" Inherits="xs.reg_sqbm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/dist/jquery.validate.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" id="rowInput">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">这是公告位置</div>
        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
            <div class="text-center" id="divInputTitle">申请报名序号</div>
            <div class="input-group " style="margin-top: 10px;">
                <span class="input-group-addon" id="basic-addon1">考生姓名</span>
                <input type="text" class="form-control" autofocus="autofocus" required="required" placeholder="请输入  姓  名" aria-describedby="basic-addon1" id="StuName" name="StuName" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span1">身份证号</span>
                <input type="text" class="form-control" autofocus="autofocus" required="required" placeholder="请输入身份证号" aria-describedby="Span1" id="Sfzh" name="Sfzh" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span2">高考考号</span>
                <input type="text" class="form-control" autofocus="autofocus" required="required" placeholder="请输入高考考号" aria-describedby="Span2" id="Zkkh" name="Zkkh" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span3">设置密码</span>
                <input type="password" class="form-control" autofocus="autofocus" required="required" placeholder="请输入设置密码" aria-describedby="Span3" id="Password" name="Password" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span4">确认密码</span>
                <input type="password" class="form-control" autofocus="autofocus" required="required" placeholder="请    确认密码" aria-describedby="Span4" id="QrPassword" name="QrPassword" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span5">移动电话</span>
                <input type="text" class="form-control" autofocus="autofocus" required="required" placeholder="请输入移动电话" aria-describedby="Span5" id="Mobile" name="Mobile" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span6">考生类型</span>
                <select class="form-control selectpicker" aria-describedby="Span6" id="StuType" name="StuType">
                    <option value="99">请选择考生类型</option>
                </select>
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <span class="input-group-addon" id="Span7">电子信箱</span>
                <input type="email" class="form-control" autofocus="autofocus" required="required" placeholder="请输入电子信箱" aria-describedby="Span7" id="E_mail" name="E_mail" />
            </div>
            <div class="input-group" style="margin-top: 10px;">
                <input type="button" class="btn btn-danger" value="提交" id="tijiao" />
            </div>
        </div>
    </div>
    <script type="text/javascript">



        ///像后台发送数据
        $(document).ready(function () {
            $.ajax({
                type: 'Post',
                url: "reg_sqbm.aspx/getStuTypeList",
                dataType: 'json',

                contentType: "application/json;charset=utf-8",
                success: function (responseData) { //成功返回数据执行的方法
                    var obj = JSON.parse(responseData.d);
                    if (obj.length > 0) {
                        $.each(obj, function (index, stutype) {
                            $("<option></option>").val(stutype.Id).text(stutype.StuType).appendTo($("#StuType"));
                        });
                    } else {
                        alert(obj.message);
                    }
                },
                error: function () {
                    alert("错误");
                } //后台发生错误时执行的方法
            });

            $("#form1").validate({
                debug: true,
                rules: {
                    Sfzh: {
                        required: true, rangelength: [18, 18],
                        remote: {
                            url: "CheckData.asmx/isHavaBySfzh", type: "Post",
                            dataFilter: function (data) {
                                //alert(data);
                                var returnValue = false;
                                $("#Sfzh").removeData("previousValue");
                                var reData = $.parseXML(data);
                                var result = reData.firstChild.innerHTML;
                                if (result == "true") {
                                    returnValue = true;
                                } else {
                                    returnValue = false;
                                    $.validator.messages.remote = result;
                                }
                                return returnValue;
                            }
                        }
                    },
                    StuType: { required: true, range: [0, 5] },
                    E_mail: { required: true, email: true },
                    StuName: { required: true, maxlength: 5 },
                    Zkkh: { required: true, minlength: 14 },
                    Password: { required: true, equalTo: "#QrPassword", minlength: 6 },
                    QrPassword: { required: true, equalTo: "#Password", minlength: 6 },
                    Mobile: { required: true, rangelength: [11, 11], isphoneNum: true, }
                },
                messages: {
                    Sfzh: { required: "请输入身份证号", rangelength: "身份证号必须是18位！" },
                    StuType: { required: "请输入考生类型", range: "请输入考生类型" },
                    E_mail: { required: "请输入电子邮箱", email: "请输入有效的电子邮件地址！" },
                    StuName: { required: "请输入姓名！", maxlength: "最多输入5个字！" },
                    Zkkh: { required: "请输入高考考号！", minlength:"最小长度14位！！"},
                    Password: { required: "请输入密码", equalTo: "与确认密码不相同！", minlength: "密码最少是6个字符!!!" },
                    QrPassword: { required: "请再此确认密码", equalTo: "两次密码不相同！", minlength: "密码最少是6个字符!!!" },
                    Mobile: { required: "请输入联系电话", rangelength: "联系方式必须是11位！", isphoneNum: "请输入有效的联系方式！！！" }
                }
            });
            jQuery.validator.addMethod("isphoneNum", function (value, element) {
                //debugger
                var length = value.length;
                var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");
        });
        //自定义手机号验证



        ///提交表单
        $("#tijiao").click(function () {

            if ($("#form1").valid() == true) {
                var strUer = {
                    Sfzh: $("#Sfzh").val(),
                    Password: $("#Password").val(),
                    Zkzh: $("#Zkkh").val(),
                    StuName: $("#StuName").val(),
                    StuType: $("#StuType").val(),
                    Mobile: $("#Mobile").val(),
                    E_mail: $("#E_mail").val()
                };
                var strSut = JSON.stringify(strUer);
                $.ajax({
                    type: 'Post',
                    url: "reg_sqbm.aspx/insterStuUser",
                    dataType: 'json',
                    contentType: "application/json;charset=utf-8",
                    data: strSut,
                    success: function (data) {
                        var reValue = JSON.parse(data.d);
                        alert(reValue.message);
                        if (reValue.code == 1) {
                            $(location).attr('href', 'reg_Login.aspx');
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
        //string Sfzh, string Password,string Zkzh,string StuName, int StuType,string Mobile, string E_mail
    </script>
</asp:Content>
