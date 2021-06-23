<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 管理系统大布局 - Layui</title>
    <link rel="stylesheet" th:href="@{/layui/css/layui.css}">
    <script th:src="@{/layui/layui.js}"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="color:#FFF;"><i class="layui-icon layui-icon-home"></i>&nbsp;学生公寓管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this"><a href="">学生管理</a></li>
            <li class="layui-nav-item "><a th:href="@{/apart}">寝室分配</a></li>
            <li class="layui-nav-item "><a th:href="@{/uploadController}">上传</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <i class="layui-icon layui-icon-username"></i>&nbsp;<span th:text="${session.user}"></span>
            </li>
            <li class="layui-nav-item"><a href="/StudentApartmentMS/DoLogout">退出<span class="layui-badge-dot"></span></a></li>
        </ul>
    </div>
    <div style="padding: 15px;">
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
        </script>
        <script type="text/html" id="barHeadDemo">
            <a class="layui-btn layui-btn-primary layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加学生</a>
        </script>
        <div  style="max-width:1500px;margin:0 auto;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>搜索</legend>
            </fieldset>
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane" lay-filter="example">
                        <div class="layui-inline" style="width: auto;">
                            <label class="layui-form-label">信息查询</label>
                            <div class="layui-input-block">
                                <input type="text" name="keyword" required  lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo1"><i class="layui-icon layui-icon-search"></i>搜索学生</button>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-form-mid layui-word-aux">&nbsp;&nbsp;关键字可以是任意列的值</div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-card">
                <!-- 原始table容器 -->
                <table class="layui-hide" id="stuTable" lay-filter="stuTable"></table>
                <script>
                    //创建一个表格
                    layui.use(['layer', 'form', 'table', 'element'], function(){
                        var layer = layui.layer
                            ,form = layui.form
                            ,table = layui.table //表格
                            ,element = layui.element //元素操作
                            ,$ = layui.jquery;

                        //监听表单提交
                        form.on('submit(demo1)', function   (data){
                            table.reload('stuTable', {
                                url:'/select'
                                ,where: data.field
                            });
                            return false;  //不跳转
                        });

                        table.render({
                            elem: '#stuTable'
                            ,cellMinWidth: 120
                            ,url:'/ceshi12'
                            ,toolbar: '#barHeadDemo'
                            ,title: '学生表'
                            ,cols: [
                                [
                                    {field:'id', title:'学号', fixed: 'left', sort: true}
                                    ,{field:'name', title:'姓名'}
                                    ,{field:'sex', title:'性别'}
                                    ,{field:'major', title:'专业'}
                                    ,{field:'school', title:'学院'}
                                    ,{field:'clas', title:'班级', sort: true}
                                    ,{field:'sushe', title:'公寓号'}
                                    ,{field:'room', title:'宿舍号'}
                                    ,{fixed: 'right', align:'center', width:160, toolbar: '#barDemo'}
                                ]
                            ]
                            ,limit: 12
                            ,limits: [12,30,60,80,100]
                            ,page:true
                            ,response: {
                                statusCode: 0 ,//重新规定成功的状态码为 200，table 组件默认为 0
                            }
                            ,parseData: function (res) {
                                var result;
                                if (this.page.curr) {
                                    console.log(this.page.curr);
                                    result = res.data.slice(this.limit * (this.page.curr - 1), this.limit * this.page.curr);
                                } else {
                                    result = res.data.slice(0, this.limit);
                                }
                                return {"code": res.code, "msg": res.msg, "count": res.count, "data": result};
                            }
                        });

                        //监听行工具事件
                        table.on('tool(stuTable)', function(obj){
                            var data = obj.data //获得当前行数据
                                ,layEvent = obj.event; //获得 lay-event 对应的值
                            //删除操作
                            if(layEvent === 'del'){
                                layer.confirm('真的删除'+data.id+'么', function(index){
                                    //请求服务器
                                    $.ajax({
                                        url: '/del',
                                        data:{'id':data.id},
                                        type: 'GET',
                                        async: false,
                                        dataType: 'json',
                                        success: function (data) {
                                            layer.msg("删除失败", {time:3000});
                                        },
                                        error: function () {
                                            obj.del(); //删除对应行（tr）的DOM结构
                                            layer.close(index);
                                            layer.msg("删除成功", {time:3000});
                                        }
                                    });
                                });
                            }
                            //编辑操作
                            else if(layEvent === 'edit'){

                                //赋值表单操作
                                $("#addStuForm")[0].reset();
                                form.render(null, 'addStuForm');
                                //表单初始赋值
                                form.val('addStuForm', {
                                    "major": data.major
                                    ,"school": data.school
                                    ,"id": data.id
                                    ,"name": data.name
                                    ,"clas": data.clas
                                    ,"sex": data.sex
                                    ,"sushe":data.sushe
                                    ,"room":data.room
                                });

                                layer.open({
                                    title: '编辑：'+ data.id
                                    ,btn: ['更改','取消']
                                    ,success: function (layero, index) {
                                        //添加form标识
                                        layero.addClass('layui-form');
                                        //将按钮重置为可提交按钮以触发表单验证
                                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formContent').attr('lay-submit', '');
                                        form.render();
                                    }
                                    ,yes: function(index, layero){
                                        //监听提交按钮
                                        form.on('submit(formContent)', function (data) {
                                            console.log(data)
                                            //转为json字符串
                                            var formObject = {};
                                            var formArray =$('#layui-layer'+index).find('form').serializeArray();
                                            $.each(formArray,function(i,item){
                                                formObject[item.name] = item.value;
                                            });
                                            // var formJson = JSON.stringify(formObject);
                                            console.log(formObject)
                                            // console.log(formJson);
                                            /*var date={
                                                "major": data.major
                                                ,"school": data.school
                                                ,"id": data.id
                                                ,"name": data.name
                                                ,"clas": data.clas
                                                ,"sex": data.sex
                                                ,"sushe":data.sushe
                                                ,"room":data.room
                                            };*/
                                            console.log(data.name);
                                            //请求服务器
                                            $.ajax({
                                                url: '/update',
                                                data: {
                                                    "major": formObject.major
                                                    ,"school": formObject.school
                                                    ,"id": formObject.id
                                                    ,"name": formObject.name
                                                    ,"clas": formObject.clas
                                                    ,"sex": formObject.sex
                                                    ,"sushe":formObject.sushe
                                                    ,"room":formObject.room
                                                },
                                                type: 'POST',
                                                async: false,
                                                dataType: 'json',
                                                success: function (data) {
                                                    layer.msg("修改失败", {time:3000});
                                                },
                                                error: function () {

                                                    layer.msg("修改成功", {time:3000});
                                                    table.reload('stuTable', {
                                                    });
                                                    layer.closeAll();
                                                }
                                            });
                                        });
                                    }
                                    ,btn2: function(index, layero){
                                        //按钮【按钮二】的回调
                                    }
                                    ,type: 1
                                    ,area: ['400px', '455px']
                                    ,content: $('#noDisplayFormAdd')
                                    ,end: function(index, layero){
                                        // 清空表单
                                        $("#addStuForm")[0].reset();
                                        form.render(null, 'addStuForm');
                                        //表单初始赋值
                                        form.val('addStuForm', {
                                            "_major": "软件工程"
                                            ,"_college": "软件"
                                        });
                                    }
                                });
                            }
                        });

                        //监听头工具栏事件
                        table.on('toolbar(stuTable)', function(obj){
                            var checkStatus = table.checkStatus(obj.config.id)
                                ,data = checkStatus.data; //获取选中的数据
                            switch(obj.event){
                                case 'add':
                                    layer.open({
                                        title: '添加：'
                                        ,btn: ['添加','取消']
                                        ,success: function (layero, index) {
                                            //添加form标识
                                            layero.addClass('layui-form');
                                            //将按钮重置为可提交按钮以触发表单验证
                                            layero.find('.layui-layer-btn0').attr('lay-filter', 'formContent').attr('lay-submit', '');
                                            form.render();
                                        }
                                        ,yes: function(index, layero){
                                            //监听提交按钮
                                            form.on('submit(formContent)', function (data) {
                                                //转为json字符串
                                                var formObject = {};
                                                var formArray =$('#layui-layer'+index).find('form').serializeArray();
                                                $.each(formArray,function(i,item){
                                                    formObject[item.name] = item.value;
                                                });
                                                var formJson = JSON.stringify(formObject);
                                                console.log(formJson);
                                                //请求服务器
                                                $.ajax({
                                                    url: '/add',
                                                    type: 'POST',
                                                    data: formObject,
                                                    async: false,
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        layer.msg("添加失败", {time:3000});
                                                    },
                                                    error: function () {
                                                        layer.msg("添加学生成功，并已自动分配宿舍", {time:3000});
                                                        table.reload('stuTable', {
                                                        });
                                                        layer.closeAll();
                                                    }
                                                });
                                            });
                                        }
                                        ,btn2: function(index, layero){
                                            //按钮【按钮二】的回调
                                        }
                                        ,type: 1
                                        ,area: ['400px', '455px']
                                        ,content: $('#noDisplayFormAdd')
                                        ,end: function(index, layero){
                                            // 清空表单
                                            $("#addStuForm")[0].reset();
                                            form.render(null, 'addStuForm');
                                            //表单初始赋值
                                            form.val('addStuForm', {
                                                "_major": "软件工程"
                                                ,"_college": "软件"
                                            });
                                        }
                                    });
                                    break;
                            };
                        });

                        //添加表单初始赋值
                        form.val('addStuForm', {
                            "_major": "软件工程"
                            ,"_college": "软件"
                        });

                        // //表单验证
                        // form.verify({
                        //     stuno: [
                        //         /^[\S]{10}$/
                        //         ,'学号必须10位，且不能出现空格'
                        //     ],
                        //     clssno: [
                        //         /^[\S]{4}$/
                        //         ,'班号必须4位，且不能出现空格'
                        //     ]
                        // });

                    });


                </script>
            </div>
        </div>
        <!-- 以下是隐藏的表单容器 -->
        <div id="noDisplayFormAdd" style="display: none;">
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane" lay-filter="addStuForm" id="addStuForm">
                        <div class="layui-form-item">
                            <label class="layui-form-label">学号</label>
                            <div class="layui-input-block">
                                <input type="text" name="id" required  lay-verify="required|number|stuno" placeholder="请输入学号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item"  pane="">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" title="男" checked>
                                <input type="radio" name="sex" value="女" title="女">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">专业</label>
                            <div class="layui-input-block">
                                <input type="text" name="major" required  lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">学院</label>
                            <div class="layui-input-block">
                                <input type="text" name="school" required  lay-verify="required" placeholder="请输入学院" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">班级</label>
                            <div class="layui-input-block">
                                <input type="text" name="clas" required  lay-verify="required|number|clssno" placeholder="请输入班级" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">公寓</label>
                                <div class="layui-input-block" style="margin-top: 15px;">
                                    <input type="text" name="sushe" required  lay-verify="required" placeholder="请输入公寓" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 15px;">
                                <label class="layui-form-label">宿舍</label>
                                <div class="layui-input-block">
                                    <input type="text" name="room" required  lay-verify="require" placeholder="请输入宿舍" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

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
</body>
</html>