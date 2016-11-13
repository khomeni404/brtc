<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="../home.buet">Dashboard</a>
            </li>

            <li class="active">
                <i class="fa fa-arrow-circle-o-right"></i>User
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 text-center">
        <form name="dataForm" id="dataForm" action="saveUser.buet" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">Create User</h3>
                    <div class="col-lg-12 text-left text-danger">
                    ${errMsg}
                    </div>
                    <br/><br/>
                    <div class="col-lg-4 text-left">
                        Username:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="username" class="form-control" id="username">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Password:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="password" name="password" class="form-control" id="password">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                        Confirm Password:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        User Type:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <select class="form-control"  name="userType" id="userType">
                                <option value="Teacher">Teacher</option>
                                <option value="Staff">Staff</option>
                                <option value="Peon">Peon</option>
                            </select>
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
        </form>
    </div>


<div class="col-lg-6 text-center">
    <div class="panel panel-default">
        <div class="panel-body">
            <h3 class="text-left text-primary">User List</h3>

            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>User Type</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list userList as user>
                            <#if user.token.username == "admin">
                            <#else >
                            <tr>
                                <td>${user.token.username}</td>
                                <td>${user.token.password}</td>
                                <td>${user.userType}</td>
                                <td class="text-center">
                                    <a href="deleteUser.buet?id=${user.authorizeId}" title="Delete"
                                       class="fa fa-times fa-lg text-pad-t-3"></a>
                                    &nbsp;&nbsp;
                                    <a href="editUserDetails.buet?id=${user.authorizeId}" title="Edit"
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

</div>
<!--End First Row -->

</@layout.my_app_layout>
