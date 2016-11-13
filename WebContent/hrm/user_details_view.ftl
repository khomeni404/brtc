<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="../home.buet">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-dashboard"></i> <a href="../home.buet">Dashboard</a>
            </li>
            <li class="active">
                <i class="fa fa-plus-square"></i>User Details Main
            </li>
        </ol>
    </div>
</div>
<!--Row for Form-->
<div class="row">
    <form name="dataForm" id="dataForm" action="saveUserDetails.buet" method="POST">
        <div class="col-lg-6 text-center">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">Create User Details</h3>

                    <div class="col-lg-4 text-left">
                        Token/Username:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control" name="tokenId">
                                <#list users as user>
                                    <#if user.token.userDetails??>
                                    <#else >
                                        <option value="${user.token.tokenId}">${user.token.username}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Group:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control" name="groupId">
                                <#list groups as group>
                                    <option value="${group.authorizedId}">${group.authorizationName}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Full Name:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="name" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Nick Name:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="nickName" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Designation:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control" name="desiId">
                                <#list designationList as designation>
                                    <option value="${designation.id}">${designation.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Department:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control" name="dptId">
                                <#list departmentList as department>
                                    <option value="${department.id}">${department.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Office Phone:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="officePhone" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Cell Phone:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="cellPhone" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Work Email:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="workEmail" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Personal Email:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="personalEmail" class="form-control" id="inputSuccess">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Web Link:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" class="form-control" id="inputSuccess" name="webLink"">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                    </div>
                    <div class="col-lg-8 text-right">
                        <button type="reset" class="btn btn-primary">Reset</button>
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>


                </div>
            </div>
        </div>
        <div class="col-lg-6 text-center">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-primary">User Details List</h3>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Designation</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list userDetailsList as userDetails>
                                    <#if userDetails.token.username == "admin">
                                    <#else >
                                    <tr>
                                        <td>${userDetails.name}</td>
                                        <td>${userDetails.token.username}</td>
                                        <td>${userDetails.designation.name}</td>
                                        <td class="text-center">
                                            <a href="deleteUserDetails.buet?id=${userDetails.id}" title="Delete"
                                               class="fa fa-times fa-lg text-pad-t-3"></a>
                                            &nbsp;&nbsp;
                                            <a href="editUserDetails.buet?id=${userDetails.id}" title="Edit"
                                               class="fa fa-pencil fa-lg text-pad-t-3"></a>
                                        </td>
                                    </tr>
                                    </#if>
                                </#list>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</@layout.my_app_layout>


