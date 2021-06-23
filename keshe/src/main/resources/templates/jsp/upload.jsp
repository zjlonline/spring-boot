<html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" th:href="@{/layui/css/layui.css}">
<script th:src="@{/layui/layui.js}"></script>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="color:#FFF;"><i class="layui-icon layui-icon-home"></i>&nbsp;学生公寓管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item "><a th:href="@{/login}">学生管理</a></li>
            <li class="layui-nav-item "><a th:href="@{/Apart/apart}">寝室分配</a></li>
            <li class="layui-nav-item layui-this "><a th:href="@{/uploadController}">上传</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <i class="layui-icon layui-icon-username"></i>&nbsp;<span th:text="${session.user}"></span>
            </li>
            <li class="layui-nav-item"><a href="/StudentApartmentMS/DoLogout">退出<span class="layui-badge-dot"></span></a></li>
        </ul>
    </div>


    <div class="layui-upload-drag" id="test10" style="width: 100%;margin-top: 205px;text-align:center">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
            <hr>
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
<%--            <img src="" alt="上传成功后渲染" style="max-width: 196px" class="layui-upload-img">--%>
    </div>


    <script src="layui/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
    <script>
        layui.use(['upload', 'element', 'layer'], function(){
            var $ = layui.jquery
                ,upload = layui.upload
                ,element = layui.element
                ,layer = layui.layer;


            //拖拽上传
            upload.render({
                elem: '#test10'
                ,url: '/up'
                ,before: function(obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo2').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                        console.log(result);
                    });
                }
                ,done: function(res){
                    layer.msg('上传成功');
                    // layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
                    console.log(res)
                }
            });


        });

    </script>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });
</script>
</body>
</html>
