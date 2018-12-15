<%@ Page Title="" Language="C#" MasterPageFile="~/xsMaste.Master" AutoEventWireup="true" CodeBehind="reg_ResetPass.aspx.cs" Inherits="xs.reg_ResetPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-top: 20px; padding-bottom: 20px;">

        <div class="input-group reset-input-group" >
            <span class="input-group-addon" id="basic-sfzh">请输入身份证号</span>
            <input type="text" style="width: 300px;" class="form-control" placeholder="身份证号" id="Sfzh" aria-describedby="basic-sfzh" />
        </div>
        <div class="input-group reset-input-group" >
            <span class="input-group-addon" id="basic-zkzh">请输入高考考号</span>
            <input type="text" style="width: 300px;" class="form-control" placeholder="高考考号" id="Zkzh" aria-describedby="basic-zkzh" />
        </div>
        <div class="input-group reset-input-group" style="margin-left:50%">
            <button type="button"   class="btn btn-default navbar-btn" id="btnRestPass">找回密码</button>
        </div>
    </div>
    <script type="text/javascript">
        $("#btnRestPass").click(function () {
            if ($("#Sfzh").val().length == 0 || $("#Zkzh").val().length == 0) {
                alert("请输入身份证号和高考证号");
                return;
            }
            var stuUer = {
                Sfzh: $("#Sfzh").val(),
                Zkzh: $("#Zkzh").val()
            };
            var strSut = JSON.stringify(stuUer);
            $.ajax({
                type: "Post",
                url: "reg_ResetPass.aspx/restPassword",
                dataType: "Json",
                contentType: "application/json;charset=utf-8",
                data: strSut,
                success: function (data) {
                    var reValue = JSON.parse(data.d);                   
                    alert(reValue.message);
                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            });
        })
    </script>
</asp:Content>
