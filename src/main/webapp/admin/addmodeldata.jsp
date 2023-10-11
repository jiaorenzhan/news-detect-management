<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="javabean.Base" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>数据添加</title>
    <!-- layui -->
    <link rel="stylesheet" href="../public/layui/css/layui.css">
    <script src="../public/layui/layui.js"></script>
    <style>
        .layui-form{
            margin: 10px 20px;

        }

    </style>
</head>

<body>



<form class="layui-form layui-form-pane" action="" lay-filter="formFilter">

    <div class="layui-form-item">
        <label class="layui-form-label">数据集ID</label>
        <div class="layui-input-block">
            <input type="text" name="sortId" lay-verify="required" required autocomplete="off"  class="layui-input" value="<%=request.getParameter("id") %>">
        </div>
    </div>

<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">数据ID</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="text" name="id" lay-verify="required" required autocomplete="off" placeholder="请输入数据ID" class="layui-input">--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">post_id</label>
        <div class="layui-input-block">
            <input type="text" name="postId" lay-verify="required" required autocomplete="off" placeholder="请输入post_id" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">post_text</label>
        <div class="layui-input-block">
            <input type="text" name="postText" lay-verify="required" required autocomplete="off" placeholder="请输入post_text" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">user_id</label>
        <div class="layui-input-block">
            <input type="text" name="userId" lay-verify="required" required autocomplete="off" placeholder="请输入user_id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">image_id</label>
        <div class="layui-input-block">
            <input type="text" name="imageId" lay-verify="required" required autocomplete="off" placeholder="请输入image_id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">username</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" required autocomplete="off" placeholder="请输入username" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">label</label>
        <div class="layui-input-block">
            <input type="text" name="label" lay-verify="required" required autocomplete="off" placeholder="请输入label" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="submitButton">立即提交</button>
        </div>
    </div>
</form>
<script>


    layui.use(['form', 'jquery'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer
        //监听提交
        form.on('submit(submitButton)', function(data){
            $.ajax({
                url: './addModelData',
                method: 'post',
                data: data.field,
                dataType: 'json',
                success: function(data){
                    if(data.code == "0"){
                        parent.layer.msg("添加成功",{
                            icon: 6,
                            time: 500
                        });
                        setTimeout(function(){
                            parent.location.reload();
                        }, 500);
                    }else{
                        layer.msg(data.msg);
                    }

                }
            })


            return false;
        });
    });

</script>
</body>
</html>