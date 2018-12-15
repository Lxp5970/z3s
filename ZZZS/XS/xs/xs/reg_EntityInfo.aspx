<%@ Page Title="" Language="C#" MasterPageFile="~/xsMaste.Master" AutoEventWireup="true" CodeBehind="reg_EntityInfo.aspx.cs" Inherits="xs.reg_EntityInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="scripts/dist/jquery.validate.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="scripts/JqureySession.js"></script>
    <div class="col-lg-12">
        <h1 class="text-center">考生志愿填报</h1>
        <div class="row">
            <div class="col-lg-8">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-SignUpNum">报名序号</span>
                    <input type="text" class="form-control" readonly="true" placeholder="报名序号" id="SignUpNum" aria-describedby="basic-SignUpNum" name="SignUpNum" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-Zkzh">高考考号</span>
                    <input type="text" class="form-control" readonly="true" placeholder="高考考号" id="Zkzh" aria-describedby="basic-Zkzh" name="Zkzh" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-Sfzh">身份证号</span>
                    <input type="text" class="form-control" readonly="true" placeholder="身份证号" id="Sfzh" aria-describedby="basic-Sfzh" name="Sfzh" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-StuName">姓名</span>
                    <input type="text" class="form-control" readonly="true" placeholder="姓名" id="StuName" aria-describedby="basic-StuName" name="StuName" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-Csrq">出生年月</span>
                    <input type="text" class="form-control" readonly="true" placeholder="出生年月" id="Csrq" aria-describedby="basic-Csrq" name="Csrq" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-Xb">性别</span>
                    <input type="text" class="form-control" readonly="true" placeholder="性别" id="Xb" aria-describedby="basic-Xb" name="Xb" />
                </div>
                <div class="input-group input-group-top">
                    <span class="input-group-addon" id="basic-Mobile">移动电话</span>
                    <input type="text" class="form-control" readonly="true" placeholder="移动电话" id="Mobile" aria-describedby="basic-Mobile" name="Mobile" />
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-12 imgfile" style="text-align: left;">
                        <img width="150px" height="200px" src="" alt="" id="imgSutPic" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <input type="file" id="fupload" name="fupload" accept="image/*" onchange="PreviewImage(this)" />
                    </div>
                    <div class="col-lg-4">
                        <input type="button" class="btn-danger" id="btnFileUpLoad" value="上传" />
                    </div>
                </div>
            </div>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Nation">民族</span>
            <select class="form-control" id="Nation" name="Nation" aria-describedby="basic-Nation">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-ZZMM">政治面貌</span>
            <select class="form-control" id="ZZMM" aria-describedby="basic-Nation" name="ZZMM">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Health">健康情况</span>
            <select class="form-control" id="Health" aria-describedby="basic-Nation" name="Health">
                <option value="" disabled="disabled" selected="selected" style="display: none">请选择健康情况</option>
                <option value="1">好</option>
                <option value="2">一般</option>
                <option value="3">比较好</option>
                <option value="4">差</option>
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-KSLB">考生类别</span>
            <select class="form-control" id="KSLB" aria-describedby="basic-Nation" name="KSLB">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-AreaCode_Shi">所在市</span>
            <select class="form-control" id="AreaCode_Shi" aria-describedby="basic-Nation" name="AreaCode_Shi">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-AreaCode">所在县(区)</span>
            <select class="form-control" id="AreaCode" aria-describedby="basic-Nation" name="AreaCode">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Byxx">毕业学校</span>
            <input type="text" class="form-control" placeholder="毕业学校" id="Byxx" aria-describedby="basic-Byxx" name="Byxx" />


        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-BYLB">毕业学校类别</span>
            <select class="form-control" id="BYLB" aria-describedby="basic-Nation" name="BYLB">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-LikeSpecial">有何爱好及特长</span>
            <input type="text" class="form-control" placeholder="有何爱好及特长" id="LikeSpecial" aria-describedby="basic-LikeSpecial" name="LikeSpecial" />
        </div>

        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Tel">固定电话(区号+号码)</span>
            <input type="text" class="form-control" placeholder="固定电话(区号+号码)" id="Tel" aria-describedby="basic-Tel" name="Tel" />
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Yzbm">邮政编码</span>
            <input type="text" class="form-control" placeholder="邮政编码" id="Yzbm" aria-describedby="basic-Yzbm" name="Yzbm" />
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-Txdz">通知书邮寄地址</span>
            <input type="text" class="form-control" placeholder="通知书邮寄地址" id="Txdz" aria-describedby="basic-Txdz" name="Txdz" />
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-AcceptPeople">联系人</span>
            <input type="text" class="form-control" placeholder="联系人" id="AcceptPeople" aria-describedby="basic-AcceptPeople" name="AcceptPeople" />
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-FrsZY">第一志愿专业</span>
            <select class="form-control" id="FrsZY" aria-describedby="basic-Nation" name="FrsZY">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-SecZy">第二志愿专业</span>
            <select class="form-control" id="SecZy" aria-describedby="basic-Nation" name="SecZy">
            </select>
        </div>
        <div class="input-group input-group-top">
            <span class="input-group-addon" id="basic-IsAdjust">是否同意调剂志愿</span>
            <input type="checkbox" id="IsAdjust" name="IsAdjust" />
        </div>
        <div class="input-group input-group-top" style="margin-left: 41%;">
            <button class="btn btn-danger" id="btnOK">保存</button>
            <button class="btn btn-danger" style="margin-left: 30px;" id="btnPrint">打印</button>
        </div>
    </div>
    <script type="text/javascript">
        //实时显示照片
        function PreviewImage(obj) {
            $('input[type=file]').each(function () {
                var max_size = 204800;
                $(this).change(function (evt) {
                    var finput = $(this);
                    var files = evt.target.files; // 获得文件对象   
                    var output = [];
                    for (var i = 0, f; f = files[i]; i++) {  //检查文件大小   
                        if (f.size > max_size) {
                            alert("上传的图片不能超过200KB!");
                            $("#fupload").attr("onchange", "");
                            $("#fupload").val("");
                            break;
                        } else {
                            var newsrc = getObjectURL(obj.files[0]);
                            document.getElementById('imgSutPic').src = newsrc;
                        }
                    }
                });
            });
        }

        //建立一個可存取到該file的url
        function getObjectURL(file) {
            var url = null;
            // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        }
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        $(document).ready(function () {
            var id = "0";
            if (GetQueryString("id") != null) {
                id = GetQueryString("id");
            }
            var data = JSON.stringify({ id: id });
            $.ajax({
                type: "Post",
                url: "reg_EntityInfo.aspx/getSelectInfo",
                dataType: "Json",
                contentType: "application/json;charset=utf-8",
                data: data,          
                success: function (data) {
                    var reValue = JSON.parse(data.d);
                    if (reValue.code == 0) {
                        alert(reValue.message);
                        $(location).attr('href', 'reg_Login.aspx');
                    };
                    //alert(reValue.user.StuName);                  
                    $("#SignUpNum").val(reValue.user.SignUpNum);
                    $("#Zkzh").val(reValue.user.Zkzh);
                    $("#Sfzh").val(reValue.user.Sfzh);
                    $("#StuName").val(reValue.user.StuName);
                    $("#Csrq").val(reValue.user.Csrq);
                    $("#Xb").val(reValue.user.Xb);
                    $("#Mobile").val(reValue.user.Mobile);
                    var lp = $("<option></option>").attr("disabled", "disabled").attr("selected", "selected").attr("style", "display: none");
                    $("#ZZMM").append(lp.html("请选择政治面貌"));
                    $.each(reValue.ListZZMM, function (index, element) {
                        $("#ZZMM").append("<option value=\"" + element.ZzmmDm + "\">" + element.ZzmmMc + "</option>")
                    });
                    $("#KSLB").append(lp.clone().html("请选择考生类别"));
                    $.each(reValue.listKslb, function (index, elementkslb) {
                        $("#KSLB").append("<option value=\"" + elementkslb.KslbDm + "\">" + elementkslb.KslbMc + "</option>")
                    });
                    $("#BYLB").append(lp.clone().html("请选择毕业类别"));
                    $.each(reValue.listBylb, function (index, elementbylb) {
                        $("#BYLB").append("<option value=\"" + elementbylb.BylbDm + "\">" + elementbylb.BylbMc + "</option>")
                    });
                    $("#FrsZY").append(lp.clone().html("请选择第一志愿"));
                    $("#SecZy").append(lp.clone().html("请选择第二志愿"));
                    $.each(reValue.listZy, function (index, elementzy) {
                        $("#FrsZY").append("<option value=\"" + elementzy.ZYDM + "\">" + elementzy.ZYMC + "</option>")
                        $("#SecZy").append("<option value=\"" + elementzy.ZYDM + "\">" + elementzy.ZYMC + "</option>")
                    });
                    $("#Nation").append(lp.clone().html("请选择民族"));
                    $.each(reValue.listNation, function (index, elementnation) {
                        $("#Nation").append("<option value=\"" + elementnation.NationCode + "\">" + elementnation.NationName + "</option>")
                    });
                    $("#AreaCode_Shi").append(lp.clone().html("请选择省市"));
                    $.each(reValue.listShiAreaCode, function (index, elem) {
                        $("#AreaCode_Shi").append("<option value=\"" + elem.AreaCode + "\">" + elem.AreaName + "</option>")
                    });
                    var host = window.location.hostname;
                    var port = window.location.port;
                    var domainName = "http://" + host;
                    if (port != "") {
                        domainName += ":" + port + "//";
                    }
                    ///转换date时间
                    function formatDate(dt) {
                        var year = dt.getFullYear();
                        var month = dt.getMonth() + 1;
                        var date = dt.getDate();
                        return year + "-" + month + "-" + date;
                    }
                    if (reValue.stuInfo != null) {
                        var csqr = reValue.stuInfo.Csrq;
                        var Csrq_ = new Date(parseInt(csqr.slice(6, 19)));
                        $("#Csrq").val(formatDate(Csrq_));
                        $("#Xb").val(reValue.stuInfo.Xb == 0 ? '女' : '男');
                        $("#Nation").val(reValue.stuInfo.Nation);
                        $("#ZZMM").val(reValue.stuInfo.ZZMM);
                        $("#Health").val(reValue.stuInfo.Health);
                        $("#KSLB").val(reValue.stuInfo.KSLB);
                        $("#AreaCode_Shi").val(reValue.stuInfo.AreaCode.substring(0, 4)).change();
                        $("#AreaCode").val(reValue.stuInfo.AreaCode);
                        $("#Byxx").val(reValue.stuInfo.Byyx);
                        $("#BYLB").val(reValue.stuInfo.BYLB);
                        $("#LikeSpecial").val(reValue.stuInfo.LikeSpecial);
                        $("#Tel").val(reValue.stuInfo.Tel);
                        $("#Yzbm").val(reValue.stuInfo.Yzbm);
                        $("#Txdz").val(reValue.stuInfo.Txdz);
                        $("#AcceptPeople").val(reValue.stuInfo.AcceptPeople);
                        $("#imgSutPic").attr("src", domainName + reValue.stuInfo.PicPath);

                    }
                    if (reValue.wish != null) {
                        $("#FrsZY").val(reValue.wish.FrsZY);
                        $("#SecZy").val(reValue.wish.SecZY);
                        if (reValue.wish.IsAdjust == 1) {
                            $("#IsAdjust").attr('checked', 'checked');
                        } else {
                            $("#IsAdjust").remove('checked');
                        }
                    }
                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            });

            $("#btnOK").click(function () {
                if ($("#imgSutPic").attr("src").length != 0) {
                    $("#fupload").rules('remove', 'required');
                }
                if ($("#form1").valid() == true) {
                    var _IsAdjust = 0;
                    if ($("#IsAdjust").is(":checked") == true) {
                        _IsAdjust = 1;
                    };
                    var info = {
                        SignUpNum: $("#SignUpNum").val(),
                        Zkzh: $("#Zkzh").val(),
                        Sfzh: $("#Sfzh").val(),
                        Mobile: $("#Mobile").val(),
                        Nation: $("#Nation").val(),
                        ZZMM: $("#ZZMM").val(),
                        Health: $("#Health").val(),
                        KSLB: $("#KSLB").val(),
                        AreaCode: $("#AreaCode").val(),
                        Byxx: $("#Byxx").val(),
                        BYLB: $("#BYLB").val(),
                        LikeSpecial: $("#LikeSpecial").val(),
                        Tel: $("#Tel").val(),
                        Yzbm: $("#Yzbm").val(),
                        Txdz: $("#Txdz").val(),
                        FrsZY: $("#FrsZY").val(),
                        SecZy: $("#SecZy").val(),
                        IsAdjust: _IsAdjust,
                        AcceptPeople: $("#AcceptPeople").val(),
                    }
                    var strInfo = JSON.stringify(info);
                    $.ajax({
                        type: 'Post',
                        url: "reg_EntityInfo.aspx/saveInfo",
                        dataType: "Json",
                        contentType: "application/json;charset=utf-8",
                        data: strInfo,
                        success: function (data) {
                            var reValue = JSON.parse(data.d);
                            alert(reValue.message);
                        },
                        error: function (errdata) {
                            alert("后台数据错误");
                        }
                    });
                } else {
                    return false;
                }
            });
            ///shuju验证
            $("#form1").validate({
                debug: true,
                rules: {
                    Nation: { required: true, },
                    ZZMM: { required: true, },
                    Health: { required: true, },
                    KSLB: { required: true, },
                    AreaCode: { required: true, },
                    AreaCode_Shi: { required: true, },
                    Byxx: { required: true, },
                    BYLB: { required: true, },
                    LikeSpecial: { required: true, },
                    Tel: { required: true, rangelength: [11, 11], isPhone: true, },
                    Yzbm: { required: true, rangelength: [6, 6], isYzbmCode: true, },
                    Txdz: { required: true, minlength: 10, },
                    FrsZY: { required: true, },
                    SecZy: { required: true, },
                    AcceptPeople: { required: true, },
                    fupload: { required: true, }
                },
                messages: {

                    Nation: { required: "请选择民族", },
                    ZZMM: { required: "请选择政治面貌", },
                    Health: { required: "请填写身体健康状况", },
                    KSLB: { required: "请选择考生类别", },
                    AreaCode: { required: "请选择市县", },
                    AreaCode_Shi: { required: "请选择省份", },
                    Byxx: { required: "请输入毕业学校", },
                    BYLB: { required: "请输入毕业学校类别", },
                    LikeSpecial: { required: "请输入爱好", },
                    Tel: { required: "请输入固定电话", rangelength: "请输入有效的固定电话", isPhone: "请输入正确的固定电话", },
                    Yzbm: { required: "请输入邮政编码", rangelength: "请输入有效的邮政编码", isYzbmCode: "请正确填写邮政编码" },
                    Txdz: { required: "请输入通讯地址", minlength: "请准确到门牌号" },
                    FrsZY: { required: "请选择第一志愿", },
                    SecZy: { required: "请选择第二志愿", },
                    AcceptPeople: { required: "请输入联系人", },
                    fupload: { required: "请上传照片", }
                },

            });
            ///验证固定电话
            jQuery.validator.addMethod("isPhone", function (value, element) {
                var length = value.length;
                //var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
                var tel = /^\d{3,4}?\d{6,9}$/;
                return this.optional(element) || tel.test(value);

            }, "请正确填写您的联系电话");
            ///验证邮政编码
            jQuery.validator.addMethod("isYzbmCode", function (value, element) {
                var tel = /^[0-9]{6}$/;
                return this.optional(element) || (tel.test(value));
            }, "请正确填写您的邮政编码");
        });
        ///根据市选择县
        $("#AreaCode_Shi").change(function () {
            var listShi = {
                shiCode: $("#AreaCode_Shi").val()
            };
            var strListShi = JSON.stringify(listShi);
            $.ajax({
                type: "Post",
                url: "reg_EntityInfo.aspx/getXianByShi",
                dataType: "Json",
                contentType: "application/json;charset=utf-8",
                data: strListShi,
                async: false,
                success: function (data) {
                    var reValue = JSON.parse(data.d);
                    //alert(reValue.message);
                    // alert("首次报名成功，请牢记您的登录用户名：" + reValue.SignUpNum);
                    $("#AreaCode").empty();
                    $("#AreaCode").append("<option value=\"\" disabled=\"disabled\" selected=\"selected\" style=\"display:none\">请选择县区</option>");
                    $.each(reValue.listXian, function (index, entity) {
                        $("#AreaCode").append("<option value=\"" + entity.AreaCode + "\">" + entity.AreaName + "</option>")
                    });
                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            });
        });
        ///第一第二专业不能选择一样的
        $("#FrsZY").change(function () {
            var frsValue = $("#FrsZY").get(0).selectedIndex;//查看usux第几个被选中
            $("#SecZy option").css("display", "inline");
            $("#SecZy option:eq(" + (frsValue) + ")").css("display", "none");
        });
        $("#SecZy").change(function () {
            var secValue = $("#SecZy").val();
            $("#FrsZY option").css("display", "inline");
            $("#FrsZY option:eq(" + (secValue) + ")").css("display", "none");
        });
        //上传照片
        $("#btnFileUpLoad").click(function () {
            var fileUpload = $("#fupload").get(0);
            var files = fileUpload.files;//读取用户选择的文件
            if (files.length == 0) {
                alert("请选择上传的照片文件！");
                retuen;
            }
            var data = new FormData();//将文件转换为二进制；流的形式
            var max_size = 204800;
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);

            }
            $.ajax({
                url: "UploadHandler.ashx",
                type: "POST",
                async: false,
                data: data,
                contentType: false,//告诉jq不要设置context-type请求头
                processData: false,//设置jq不要处里发送的数据
                success: function (result) {
                    alert("上传照片成功！！！");
                },
                error: function (err) {
                    alert(err.statusText);
                }

            });
        });
        //打印信息
        $("#btnPrint").click(function () {
            if ($("#imgSutPic").attr("src").length != 0) {
                $("#fupload").rules('remove', 'required');
            }
            $.ajax({
                type: 'Post',
                url: "reg_EntityInfo.aspx/printInfo",
                dataType: "Json",
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    var reValue = JSON.parse(data.d);
                    alert(reValue.message);

                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            });
        });
    </script>
</asp:Content>
