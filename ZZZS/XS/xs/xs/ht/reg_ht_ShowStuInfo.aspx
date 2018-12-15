<%@ Page Title="" Language="C#" MasterPageFile="~/ht/Ht.Master" AutoEventWireup="true" CodeBehind="reg_ht_ShowStuInfo.aspx.cs" Inherits="xs.ht.reg_ht_ShowStuInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>姓名</th>
                        <%-- <th>性别</th>--%>
                        <th>身份证号</th>
                        <th>高考考号</th>
                        <th>手机号</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
            <nav class="text-center">
                <ul class="pagination"></ul>
            </nav>
            <div class="text-center">
                <a class="btn" id="btnOutExcleAll">导出全部数据到EXCLE</a>
                <a class="btn" id="btnOutStuAllInfoToExcle">导出的所有信息</a>
                <a href="#" id="aFileDlown" >下载文件</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#aFileDlown").hide();
            $('.pagination').jqPaginator({
                totalPages: 100,
                visiblePages: 5,
                currentPage: 1,
                totalCounts: 1000,
                first: '<li class="first" ><a href="javascript:void(0);">第一页</a></li>',
                prev: '<li class="prev" ><a href="javascript:void(0);">上一页</a></li>',
                statistics: '<li class="disabled" ><a>共{{totalPages}}页  共{{totalCounts}}条</a></li>',
                next: '<li class="next" ><a href="javascript:void(0);">下一页</a></li>',
                last: '<li class="last" ><a href="javascript:void(0);">最后一页</a></li>',
                page: '<li class="page" ><a href="javascript:void(0);">{{page}}</a></li>',
                onPageChange: function (num, type) {
                    $(".table-hover tbody").empty();
                    var pagePar = JSON.stringify({
                        pageIndex: num,
                        pageSize: 10,
                    });

                    $.ajax({
                        type: "Post",
                        url: "reg_ht_ShowStuInfo.aspx/getStudentInfoPage",
                        dataType: "Json",
                        contentType: "application/json;charset=utf-8",
                        data: pagePar,
                        success: function (data) {
                            var reValue = JSON.parse(data.d);
                            if (reValue.code == 0) {
                                alert(reValue.message);
                                $(location).attr('href', 'reg_ht_login.aspx');
                            } else if (reValue.code == 1) {
                                var tr = ""
                                $.each(reValue.stuUserPage.Items, function (index, item) {
                                    tr = tr + "<tr>";
                                    tr = tr + "<td><a target=\"_Blank\" href=\"../reg_EntityInfo.aspx?id=" + item.Id + "\">" + item.StuName + "</a></td>";
                                    tr = tr + "<td>" + item.Sfzh + "</td>";
                                    tr = tr + "<td>" + item.Zkzh + "</td>";
                                    tr = tr + "<td>" + item.Mobile + "</td>";
                                    tr = tr + "</tr>";
                                });
                                $(".table-hover tbody").append(tr);
                            }
                            $('.pagination').jqPaginator('option', {
                                totalPages: reValue.stuUserPage.TotalPages,
                                totalCounts: reValue.stuUserPage.TotalItems
                            });
                        },
                        error: function (errdata) {
                            alert("后台数据错误");
                        }
                    });
                }
            })
        });
        ///打印分页显示出来的数据到EXCLE
        $("#btnOutExcleAll").click(function () {
            $.ajax({
                type: "Post",
                url: "reg_ht_ShowStuInfo.aspx/getAllDataToExcle",
                dataType: "Json",
                async: false,
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    var reValue = JSON.parse(data.d);
                    if (reValue.code == 1) {
                        var str = window.location.host ;
                        $("#aFileDlown").show().attr("href", "http://"+str + "/" + reValue.filePath);
                    }
                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            })
        });
        ///导出的所有信息
        $("#btnOutStuAllInfoToExcle").click(function () {
            $.ajax({
                type: "Post",
                url: "reg_ht_ShowStuInfo.aspx/getstuAllInfoToExcle",
                dataType: "Json",
                async: false,
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    var reValue = JSON.parse(data.d);
                    if (reValue.code == 1) {
                        var str = window.location.host;
                        $("#aFileDlown").show().attr("href", "http://" + str + "/" + reValue.filePath);
                    }
                },
                error: function (errdata) {
                    alert("后台数据错误");
                }
            })
        });
    </script>
</asp:Content>
