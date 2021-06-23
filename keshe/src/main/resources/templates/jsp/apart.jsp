<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<html>
<head>
    <meta charset="utf-8">
    <title></title>
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
            <li class="layui-nav-item layui-this"><a th:href="@{/Apart/apart}">寝室分配</a></li>
            <li class="layui-nav-item "><a th:href="@{/uploadController}">上传</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <i class="layui-icon layui-icon-username"></i>&nbsp;&nbsp;<span th:text="${session.user}"></span>
            </li>
            <li class="layui-nav-item"><a href="/StudentApartmentMS/DoLogout">退出<span class="layui-badge-dot"></span></a></li>
        </ul>
    </div>
    <div class="layui-card">
        <!-- 原始table容器 -->
        <div id="noDisplayTable" style="display:none;">
            <table class="layui-hide" id="stuTable" lay-filter="stuTable"></table>
        </div>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="detail"><i class="layui-icon layui-icon-tips"></i>查看住户</a>
        </script>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>搜索</legend>
        </fieldset>
        <div class="layui-card">
            <div class="layui-card-body">
                <form class="layui-form layui-form-pane" lay-filter="example">
                    <div class="layui-inline" style="width: auto;">
                        <div class="layui-inline" style="width: auto;">
                            <label class="layui-form-label">关键字</label>
                            <div class="layui-input-block">
                                <input type="text" name="dormitory" required  lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo1"><i class="layui-icon layui-icon-search"></i>搜索宿舍</button>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">&nbsp;&nbsp;关键字可以是宿舍号、学院名</div>
                    </div>
                </form>
            </div>
        </div>
        <!-- 原始table容器 -->
        <table class="layui-hide" id="apartTable" lay-filter="apartTable"></table>
        <script>
            //创建一个表格
            layui.use(['layer', 'form', 'table', 'element'], function(){
                var layer = layui.layer
                    ,form = layui.form
                    ,table = layui.table //表格
                    ,element = layui.element; //元素操作

                //表单初始赋值
                form.val('example', {
                    "building": "1"
                });

                //监听表单提交
                form.on('submit(demo1)', function(data){
                    table.reload('apartTable', {
                        url:'/Apart/selectApart'
                        ,where: data.field
                    });
                    return false;  //不跳转
                });

                table.render({
                    elem: '#apartTable'
                    ,cellMinWidth: 120
                    ,url:'/Apart/getapart'
                    ,toolbar: "true"
                    ,title: '公寓表'
                    ,cols: [
                        [
                        {field:'sushe', title:'公寓号', fixed: 'left', sort: true}
                        ,{field:'room', title:'宿舍号'}
                        ,{field:'max', title:'总人数'}
                        ,{field:'num', title:'已住人数', sort: true}
                        ,{field:'school', title:'所属学院'}
                        ,{fixed: 'right', align:'center', width:120, toolbar: '#barDemo'}
                    ]
                    ]
                    ,limit: 12
                    ,limits: [12,30,60,80,100]
                    ,page: true
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                });

                //监听行工具事件
                table.on('tool(apartTable)', function(obj){
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event //获得 lay-event 对应的值
                        ,$ = layui.jquery;
                    if(layEvent === 'detail'){
                        //显示层
                        layer.open({
                            title: '查看'+data.sushe+'-'+data.room+'住户：'
                            ,type: 1
                            ,area: ['750px', '260px']
                            ,content: $('#noDisplayTable')
                            ,end: function(index, layero){

                            }
                        });

                        //绘制表格
                        table.render({
                            elem: '#stuTable'
                            ,cellMinWidth: 120
                            ,url:'/Apart/findapart?sushe='+data.sushe+'&room='+data.room
                            ,data:{
                                "sushe":data.sushe
                                ,"room":data.room
                            }
                            ,type: 'POST'
                            ,title: '学生表'
                            ,cols: [
                                [
                                {field:'id', title:'学号', fixed: 'left'}
                                ,{field:'name', title:'姓名'}
                                ,{field:'sex', title:'性别'}
                                ,{field:'major', title:'专业'}
                                ,{field:'school', title:'学院'}
                                ,{field:'clas', title:'班级'}
                            ]
                            ]
                            ,response: {
                                statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                            }
                        });
                    }
                });

            });
        </script>
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