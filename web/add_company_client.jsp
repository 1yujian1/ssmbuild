<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/15
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新企业客户</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>
<form id="test" class="layui-form  layui-form-pane" action="${pageContext.request.contextPath}/company/addCompany" method="post" height="100%" scrolling="yes" lay-filter="add_company_client_form">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>添加新企业客户</legend>
    </fieldset>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">企业名称</label>
            <div class="layui-input-block">
                <input type="text" name="coname" lay-verify="company_coname" autocomplete="off" placeholder="请输入企业名称" class="layui-input" style="width: 300px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">企业电话</label>
            <div class="layui-input-block">
                <input type="text" name="cophone" lay-verify="company_cophone" autocomplete="off" placeholder="请输入联系电话" class="layui-input" >
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">企业性质</label>
            <div class="layui-input-block">
<%--                单选框name值应相等--%>
                <input type="radio" name="csort" value="国企" title="国企">
                <input type="radio" name="csort" value="外企" title="外企">
                <input type="radio" name="csort" value="私企" title="私企">
                <input type="radio" name="csort" value="军队采购网" title="军队采购网">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">企业地址</label>
        <div class="layui-input-block">
            <input type="text" name="coadress" lay-verify="company_coadress" autocomplete="off" placeholder="请输入公司详细地址" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">总经理</label>
            <div class="layui-input-block">
                <input type="text" name="cname" lay-verify="company_cname" autocomplete="off" placeholder="请输入总经理姓名" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <%--                单选框name值应相等--%>
                <input type="radio" name="csex" value="男" title="男">
                <input type="radio" name="csex" value="女" title="女">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="cphone" lay-verify="company_cphone" autocomplete="off" placeholder="请输入总经理联系方式" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">email</label>
            <div class="layui-input-block">
                <input type="text" name="cemail" lay-verify="company_cemail" autocomplete="off" placeholder="请输入总经理email地址" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注信息</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" required name="remark" lay-verify="company_remark"></textarea>
        </div>
    </div>

    <button lay-submit type="button" class="layui-btn layui-btn-fluid" lay-filter="add_company_client_form">提交</button>
</form>

    <script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script>
    layui.use(['form', 'layedit','laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        var laydate = layui.laydate;
        // laydate.render({
        //     elem: '#time',// input里时间的Id
        //     type: 'datetime',
        //     value: new Date(),
        //     done: function (value, date) {
        //     }
        // });
        form.render();
        form.on('submit(add_company_client_form)', function(data){
            /*           console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                       console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                       console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}*/

            layer.confirm('确认提交?', function(index){
                //do something
                $("#test").submit();
                layer.msg("提交成功")
                layer.close(index);
            });

        });
    });


</script>

</body>
</html>
