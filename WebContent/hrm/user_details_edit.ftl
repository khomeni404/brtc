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
                <i class="fa fa-list"></i><a> <a href="/brtc/hrm/userDetailsList.buet"> User List</a>
            </li>
            <li class="active">
                <i class="fa fa-arrow-circle-o-right"></i>User Details
            </li>

        </ol>
    </div>
</div>


<div class="row">
    <form name="userDetailsForm" id="userDetailsForm" action="updateUserDetails.buet" method="POST">
        <div class="col-lg-12 text-center">
            <h3 class="text-left text-success">Edit User</h3>
            <input type="hidden" id="id" name="id" value="${details.id}"/>

            <div class="panel panel-default">
                <div class="panel-body" style="background-color: #e4e8c7">
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Group:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="groupId" id="groupId">
                                    <option value="${details.token.user.authorizedGroups[0].authorizedId}">
                                    ${details.token.user.authorizedGroups[0].authorizationName}
                                    </option>
                                    <#list groups as group>
                                        <#if details.token.user.authorizedGroups[0].authorizationName != group.authorizationName>
                                            <#if group.authorizedId != 1>
                                                <option value="${group.authorizedId}">${group.authorizationName}</option>
                                            </#if>
                                        </#if>
                                    </#list>
                                    <input type="hidden" name="groupIdOld" id="groupIdOld"
                                           value="${details.token.user.authorizedGroups[0].authorizedId}"/>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Full Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="${details.name}">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Nick Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="nickName" class="form-control"
                                           value="${details.nickName}" id="nickName">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Designation:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="desiId" id="desiId">
                                    <option value="${details.designation.id}">${details.designation.name}</option>
                                    <#list designationList as designation>
                                        <#if details.designation.id != designation.id>
                                            <#if designation.id != 1>
                                                <option value="${designation.id}">${designation.name}</option>
                                            </#if>
                                        </#if>
                                    </#list>
                                    <input type="hidden" name="desiIdOld" id="desiIdOld"
                                           value="${details.designation.id}"/>
                                </select>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Department:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="dptId" id="dptId">
                                    <option value="${details.department.id}">${details.department.name}</option>
                                    <#list departmentList as department>
                                        <#if details.department.id != department.id>
                                            <option value="${department.id}">${department.name}</option>
                                        </#if>
                                    </#list>
                                    <input type="hidden" name="dptIdOld" id="dptIdOld"
                                           value="${details.department.id}"/>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6 text-center">
                        <div class="col-lg-4 text-left">
                            Office Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="officePhone"
                                           value="${details.officePhone}" class="form-control" id="officePhone">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Cell Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="cellPhone"
                                           value="${details.cellPhone}" class="form-control" id="cellPhone">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Work Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="workEmail"
                                           value="${details.workEmail}" class="form-control" id="workEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Personal Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="personalEmail"
                                           value="${details.personalEmail}" class="form-control" id="personalEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Web Link:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" class="form-control"
                                           value="${details.webLink}" id="webLink" name="webLink"">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary"
                                    onclick="parent.location='userDetailsList.buet'">Cancel
                            </button>
                            <button type="button" onclick="updateUserDetails();" class="btn btn-success">Update</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<!--End First Row -->
<script type="text/javascript">

    function updateUserDetails() {
        document.userDetailsForm.submit();
    }
</script>
</@layout.my_app_layout>


