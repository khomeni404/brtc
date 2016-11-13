<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashboardLink}">Dashboard</a>
            </li>
            <li class="active">
                <i class="fa fa-arrow-circle-o-right"></i>${PageTitle}
            </li>

        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">${PageTitle} List</h3>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Feature Name</th>
                            <th>Description</th>
                            <th class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list groupsList as group>
                            <tr>
                                <td class="id">${group.authorizedId}</td>
                                <td class="name">${group.authorizationName}</td>
                                <td class="desc"><#if group.authorizationDescription??>${group.authorizationDescription}</#if></td>
                                <td class="text-center">
                                    <a href="deleteAuthorizedGroups.buet?id=${group.authorizedId}" title="Delete"
                                       class="fa fa-times fa-lg text-pad-t-3"></a>
                                    &nbsp;&nbsp;
                                    <a title="Edit" class="fa fa-pencil fa-lg text-pad-t-3 group-edit editBtn"
                                       id="editBtn"></a>
                                </td>
                            </tr>
                            </#list>

                        <script type="text/javascript">
                            $(".group-edit").click(function () {
                                var $row = $(this).closest("tr");
                                var $id = $row.find(".id").text();
                                var $name = $row.find(".name").text();
                                var $desc = $row.find(".desc").text();

                                $('#id').val($id);
                                var name = $('#name');
                                name.val($name);
                                $('#desc').val($desc);
                                $('#saveBtn').html("Update")
                                //document.getElementById("saveBtn").innerHTML = "Update";
                                $("form").attr("action", "updateAuthorizedGroups.buet");
                                name.focus();
                                name.select();

                            });
                        </script>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End First Row -->

<!--Start Second Row for-->
<div class="row">
    <div class="col-lg-12 text-center">
        <form name="dataForm" id="dataForm" action="saveAuthorizedGroups.buet" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">Create ${PageTitle}</h3>
                    <input type="hidden" name="id" id="id" value=""/>

                    <div class="col-lg-2 text-right">
                        Authorized Group Name:
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="name" class="form-control" id="name">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 text-right">
                        Description:
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="desc" class="form-control" id="desc">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8 text-left">
                    </div>
                    <div class="col-lg-4 text-right">
                        <button type="reset" class="btn btn-primary">Reset</button>
                        <button type="submit" class="btn btn-success" id="saveBtn">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--End Second Row -->


</@layout.my_app_layout>