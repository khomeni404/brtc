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
<!--End First Row -->

<!--Start Second Row -->
<div class="row">
    <div class="col-lg-12 text-center">
        <form name="dataForm" id="dataForm" action="saveFeature.buet" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">Create ${PageTitle}</h3>
                    <input type="hidden" name="id" id="id" value=""/>

                    <div class="col-lg-4 text-right">
                        Feature Name:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="operation" class="form-control" id="operation">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-right">
                        Description:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="description" class="form-control" id="description">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-right">
                        Module (Component):
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control" name="componentId" id="componentId">
                                <#list componentList as component>
                                    <option value="${component.componentId}">${component.componentName}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-8 text-right text-danger">
                        N.B: Each feature will set automatically to SUPER_ADMIN Authority...
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

<!--Start Third Row for-->
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
                            <th>Module Name</th>
                            <th>Description</th>
                            <th class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list featureLists as feature>
                            <tr>
                                <td class="id">${feature.featureId}</td>
                                <td class="name">${feature.operation}</td>
                                <td class="module">${feature.component.componentName}</td>
                                <td class="email"><#if feature.description??>${feature.description}</#if></td>
                                <td class="text-center">
                                    <a href="deleteDepartment.buet?id=${feature.featureId}" title="Delete"
                                       class="fa fa-times fa-lg text-pad-t-3"></a>
                                    &nbsp;&nbsp;
                                    <a title="Edit" class="fa fa-pencil fa-lg text-pad-t-3 department-edit editBtn"
                                       id="editBtn"></a>
                                </td>
                            </tr>

                            </#list>

                        <script type="text/javascript">
                            $(".department-edit").click(function () {
                                var $row = $(this).closest("tr");    // Find the row
                                var $id = $row.find(".id").text(); // Find the text
                                var $name = $row.find(".name").text(); // Find the text
                                var $email = $row.find(".email").text(); // Find the text
                                var $phone = $row.find(".phone").text(); // Find the text
                                var $address = $row.find(".address").text(); // Find the text

                                document.getElementById("id").value = $id;
                                document.getElementById("name").value = $name;
                                document.getElementById("email").value = $email;
                                document.getElementById("phone").value = $phone;
                                document.getElementById("address").value = $address;
                                document.getElementById("saveBtn").innerHTML = "Update";
                                $("form").attr("action", "updateDepartment.buet");
                                $("#name").focus();
                                $("#name").select();

                            });
                        </script>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
<!--End Third Row -->


</@layout.my_app_layout>