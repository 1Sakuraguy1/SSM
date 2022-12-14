<%--
  Created by IntelliJ IDEA.
  User: Sakura
  Date: 2022/8/13
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>

    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.7.2.min.js"></script>
    <link href="${APP_PATH}/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script  src="${APP_PATH}/bootstrap-3.4.1-dist/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
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
            <button type="button" class="btn btn-primary">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
<%--    显示数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">
                     <tr>
                           <th>${emp.empId}</th>
                           <th>${emp.empName}</th>
                           <th>${emp.gender=="m"?"男":"女"}</th>
                           <th>${emp.email}</th>
                           <th>${emp.department.deptName}</th>
                           <th>
                              <button type="button" class="btn btn-primary btn-sm" >
                                <span class="glyphicon glyphicon-pencil"></span> 修改
                             </button>
                             <button type="button" class="btn bg-danger btn-sm" >
                                <span class="glyphicon glyphicon-trash"></span>删除
                             </button>
                        </th>
                     </tr>

                    </c:forEach>

                </tr>
            </table>
        </div>
    </div>

<%--    显示分页信息--%>
    <div class="row">
<%--        分页文字信息--%>
        <div class="col-md-6">
            当前${pageInfo.pageNum}页,共${pageInfo.pages}页,总${pageInfo.total}条录数
        </div>
<%--    分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${APP_PATH}/emps?pn=1">首页</a>
                    </li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                       <c:if test="${page_Num==pageInfo.pageNum}">
                           <li class="active" ><a href="#">${page_Num}</a> </li>
                       </c:if>
                        <c:if test="${page_Num!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a> </li>
                        </c:if>
                    </c:forEach>



                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>

            </nav>
        </div>
    </div>


</div>


</body>
</html>
