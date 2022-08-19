<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2022/8/14
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.0.min.js"></script>
<link href="${APP_PATH}/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
<script  src="${APP_PATH}/bootstrap-3.4.1-dist/js/bootstrap.min.js" type="text/javascript"></script>

<html>
<head>
    <title>员工信息</title>
</head>
<body>
<%--修改员工的form--%>
<div class="modal fade" id="empUpdateModeal" tabindex="-1" role="dialog" aria-labelledby="myModealLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工添加</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p  class="form-control-static" id="empName_update_static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <%--                    <input type="text" class="form-control" id="gender_input" placeholder="gender">--%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="m" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update"  value="w"> 女
                            </label>
                        </div>
                    </div>


                    <%--                设置部门的下拉选项--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--                    <input type="text" class="form-control" id="gender_input" placeholder="gender">--%>
                            <select  class="form-control" name="dId" id="dept_select_add">
                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>


<%--添加员工的form--%>
<div class="modal fade" id="empAddModeal" tabindex="-1" role="dialog" aria-labelledby="myModealLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModealLabel">员工添加</h4>
            </div>

        <div class="modal-body">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">empName</label>
                    <div class="col-sm-10">
                        <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text" name="email" class="form-control" id="email_input" placeholder="email@qq.com">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                   <label class="col-sm-2 control-label">gender</label>
                   <div class="col-sm-10">
<%--                    <input type="text" class="form-control" id="gender_input" placeholder="gender">--%>
                       <label class="radio-inline">
                          <input type="radio" name="gender" id="gender1_add" value="m" checked="checked"> 男
                       </label>
                       <label class="radio-inline">
                        <input type="radio" name="gender" id="gender2_add"  value="w"> 女
                       </label>
                   </div>
                </div>


<%--                设置部门的下拉选项--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">deptName</label>
                    <div class="col-sm-4">
                        <%--                    <input type="text" class="form-control" id="gender_input" placeholder="gender">--%>
                            <select  class="form-control" name="dId" id="dept_select_add">
                            </select>
                    </div>
                </div>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button class="btn btn-primary" id="emp_save_btn">保存</button>
        </div>
      </div>
    </div>
</div>



<%--搭建显示页面--%>
<div class="container">
    <%--    标题--%>
    <dibv class="row">
        <div class="col-md-12">
            <h1>sss_crud</h1>
        </div>
    </dibv>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="delete_all_btn">删除</button>
        </div>
    </div>
    <%--    显示数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>

        </div>
    </div>

    <%--    显示分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="page_info">

        </div>
        <%--    分页条信息--%>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>


</div>

<script type="text/javascript">
    var totalRecord,currenNum;
    $(function (){
        to_page(1);
    });

    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result){
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_paeg_nav(result);
            }
        });

    }


    function build_emps_table(result){
        //清空table表格
        $("#emps_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var checkBoxId = $("<td><input type='checkbox' class='check_item'></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append( item.gender=='m'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBth = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));

            // 添加自定义属性
            editBth.attr("edit-id",item.empId);



            var delBth = $("<button></button>").addClass("btn bg-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
             var btnTd = $("<td></td>").append(editBth).append(delBth);
            delBth.attr("delete_btn",item.empId);
            $("<tr></tr>").append(checkBoxId).append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    //2.解析显示分页信息
    function build_page_info(result){
        $("#page_info").empty();
        $("#page_info").append("当前"
            + result.extend.pageInfo.pageNum+"页,共"
            +result.extend.pageInfo.pages+"页,总"
            +result.extend.pageInfo.total+"条录数")
        totalRecord=result.extend.pageInfo.total;
        currenNum=result.extend.pageInfo.pageNum;
    }


    //3.解析显示分页条数据
    function build_paeg_nav(result){
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href",""));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        }

        //为元素添加单击翻页的事件
        firstPageLi.click(function (){
           to_page(1);
        });
        prePageLi.click(function (){
            to_page(result.extend.pageInfo.pageNum - 1)
        });

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if (result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled")
        }
        nextPageLi.click(function (){
           to_page(result.extend.pageInfo.pageNum + 1)
        });

        lastPageLi.click(function (){
            to_page(result.extend.pageInfo.pages);
        })

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
           if(result.extend.pageInfo.pageNum==item){
               numLi.addClass("active");
           }
           numLi.click(function (){
              to_page(item);
           });

            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav")
    }


    //清空表单和样式
    function reset_form(ele){
        $(ele)[0].reset();
        //清空样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //设置添加员工的窗口
    $("#emp_add_modal_btn").click(function (){
        //清除表单
        // $("#empAddModeal form")[0].reset();
        reset_form("#empAddModeal form");
        //发送ajax请求，查出部门信息，显示再下拉列表中
        getDepts("#empAddModeal select");
       $("#empAddModeal").modal({
           backdrop:"static"
       });
    });


    function getDepts(ele){
        $(ele).empty();
        $.ajax({
           url: "${APP_PATH}/depts",
           type:"GET",
            success:function (result){
                // $("#empAddModeal select")
              $.each(result.extend.departments,function (){
                 var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                 optionEle.appendTo(ele)
              });
           }
        });
    }

    //校验表单
    function validate_add_form(){
        var empName = $("#empName_input").val();
        var regName = /(^[a-zA_z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

       if(!regName.test(empName)){
           //alert("用户名是2-5中文或者6-16位英文数字的组合");
           show_validate_msg("#empName_input","error","用户名是2-5中文或者6-16位英文数字的组合")

           return false;
       }else {
           show_validate_msg("#empName_input","success","")

       };
       //校验邮箱
        var email = $("#email_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(email)){
            // alert("邮箱格式错误");
            //清空样式
            show_validate_msg("#email_input","error","邮箱格式不正确")
            // $("#email_input").parent().addClass("has-error");
            // $("#email_input").next("span").text("邮箱格式不正确");            $("#email_input").next("span").text("邮箱格式不正确");
            return false;
        }else {
            show_validate_msg("email_input","success","")
            // $("#email_input").prepend().addClass("has-success");
            // $("#empName_input").next("span").text("");
        }
        return true;
    }

    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //检验用户名是否可用
    $("#empName_input").change(function (){
       //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkEmp",
            data:"empName="+empName,
            type:"POST",
            success:function (result){
                if (result.code == 100){
                    show_validate_msg("#empName_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success")
                }else {
                    show_validate_msg("#empName_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error")
                }
            }
        });
    });



    $("#emp_save_btn").click(function (){
       //1.保存输入的信息到数据库中
        //2.发送ajax请求保存数据
        if(!validate_add_form()){
            return false;
        };

        if ($(this).attr("ajax-va")=="error"){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModeal form").serialize(),
            success:function (result){
                if (result.code == 100){
                    $("#empAddModeal").modal('hide');
                    //2.来到最后一页，显示保存的数据
                    to_page(totalRecord);
                }else {
                    if (undefined==result.extend.errorFields.email){
                        show_validate_msg("#email_input","error",result.extend.errorFields.email)

                    }
                    if(undefined == result.extend.errorFields.empName){
                        show_validate_msg("#empName_input","error",result.extend.errorFields.empName)
                    }
                }
                // alert(result.msg)
                //员工保存成功
                //1.关闭模态框

            }
        })
    });


    $(document).on("click",".edit_btn",function (){
        //1.查出部门信息
        getDepts("#empUpdateModeal select")
        //2.查询员工信息
        getEmp($(this).attr("edit-id"));
        //3.把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModeal").modal({
            backdrop: "stetic"
        });
    });

    function getEmp(id){
        $.ajax({
           url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result){
               var empDate = result.extend.emp;
               $("#empName_update_static").text(empDate.empName);
                $("#email_update").val(empDate.email);
                $("#empUpdateModeal input[name=gender]").val([empDate.gender]);
                $("#empUpdateModeal select").val([empDate.dId]);
            }
        });
    }


    //点击更新员工信息
    $("#emp_update_btn").click(function (){
       //验证是否合法
        var email = $("#email_update").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(email)){
            // alert("邮箱格式错误");
            //清空样式
            show_validate_msg("#email_update","error","邮箱格式不正确")
            $("#email_input").next("span").text("邮箱格式不正确");
            return false;
        }else {
            show_validate_msg("email_update","success","");
        }

        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"put",
            data:$("#empUpdateModeal form").serialize(),
            success:function (result){
                // alert(result.msg)
                //1.关闭模态框
                $("#empUpdateModeal").modal("hide")
                //1.回到本页面
                to_page(currenNum)
            }
        })
    });

    //单个删除
    $(document).on("click",".delete_btn",function (){
        //1.弹出是否确定删除
        var empName =  $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete_btn")
        if (confirm("确认删除【"+empName+"】吗？")){
            //确认。发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/" + empId,
                type:"DELETE",
                success:function (result){
                    alert(result.msg);
                    //回到本页
                    to_page(currenNum);
                }
            })
        }
    });


    //完成全选全部选的功能
    $("#check_all").click(function (){
        $(this).prop("checked");
        $(".check_item").prop("checked",$(this).prop("checked"))

    });


    $(document).on("click",".check_item",function (){
       var flag = $(".check_item:checked").length==$(".check_item").length;
       $("#check_all").prop("checked",flag)
    });

    //点击全部删除
    $("#delete_all_btn").click(function (){
       var empNames = "";
       var del_idstr = "";
       $.each($(".check_item:checked"),function (){

           empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
           //组装员工id字符串
           del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";

       });

        empNames = empNames.substring(0,empNames.length-1);
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
       if (confirm("确认删除【"+empNames+"】吗？")){
           $.ajax({
               url:"${APP_PATH}/emp/"+del_idstr,
               type:"DELETE",
               success:function (result){
                   alert(result.msg)
                   to_page(currenNum);
               }
           });
       }
    });


</script>

</body>
</html>
