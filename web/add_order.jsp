<%--
  Created by IntelliJ IDEA.
  User: lyg99
  Date: 2020/10/18
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>代下订单</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/lib/layui/css/layui.css" media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>新建订单</legend>
</fieldset>

<form  id="test" class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/order/addorder" method="post" height="100%" scrolling="yes" lay-filter="add_product_form">
    <div class="layui-form-item">
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-block">
            <input type="text" name="order_id" required   lay-verify="product_id" autocomplete="off" class="layui-input" placeholder="请输入订单编号">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">订单内容</label>
        </div>
        <div class="layui-inline">
            <input name="product" type="checkbox" title="圆柱内浮顶罐" value="20201001">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-block">
                <input type="text" name="product_1" lay-verify="product_1" autocomplete="off" placeholder="请输入购买数量" width="40%" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">

                <input type="text" autocomplete="off" value="9000" width="40%" class="layui-input" readonly>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label"></label>
        </div>
        <div class="layui-inline">
            <input name="product" type="checkbox" title="不锈钢内浮盘" value="20201002">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-block">
                <input type="text" name="product_1" lay-verify="product_2" autocomplete="off" placeholder="请输入购买数量" width="40%" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text"  autocomplete="off" value="14500" width="40%" class="layui-input" readonly>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label"></label>
        </div>
        <div class="layui-inline">
            <input name="product" type="checkbox" title="纯铝制内浮盘" value="20201003">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-block">
                <input type="text" name="product_1" lay-verify="product_3" autocomplete="off" placeholder="请输入购买数量" width="40%" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" value="999" width="40%" class="layui-input" readonly>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" hidden></label>
        </div>
        <div class="layui-inline">
            <input name="product" type="checkbox" title="铝合金内浮盘" value="20201004">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-block">
                <input type="text" name="product_1" lay-verify="product_3" autocomplete="off" placeholder="请输入购买数量" width="40%" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" value="16000" width="40%" class="layui-input" readonly>
            </div>
        </div>
    </div>

    <button lay-submit type="button" class="layui-btn layui-btn-fluid" lay-filter="add_product_form" >提交</button>
</form>

<script src="${pageContext.request.contextPath}/common/lib/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script>
    layui.use(['form', 'layedit'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
        ;

        form.val("add_product_form",{
            "serve_creator":"${account.name}", //对应的name
        });

        form.on('submit(add_product_form)', function(data){
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
        form.render();
    });

</script>
</body>
</html>
