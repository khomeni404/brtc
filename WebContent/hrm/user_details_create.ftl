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
    <form name="userDetailsForm" id="userDetailsForm" action="saveUserDetails.buet" method="POST">
        <div class="col-lg-12 text-center">
            <h3 class="text-left text-success">Create User</h3>

            <div class="panel panel-default">
                <div class="panel-body" style="background-color: #e8e8e8">
                    <div class="col-lg-6 text-center">
                        <div class="col-lg-3 text-left">
                            Username:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">

                                    <input type="text" name="username" onblur="checkUserDuplicate()"
                                           class="form-control" id="username">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 text-left">
                            User Type:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="userType" id="userType">
                                    <option value="0">--Select a type--</option>
                                    <option value="Teacher">Teacher</option>
                                    <option value="Staff">Staff</option>
                                    <option value="Peon">Peon</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6 text-center">
                        <div class="col-lg-3 text-left">
                            Password:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="password" name="password" class="form-control" id="password">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Confirm Password:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="password" class="form-control" id="confirmPassword"
                                           name="confirmPassword"">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body" style="background-color: #e4e8c7">
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-3 text-left">
                            Group:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="groupId" id="groupId">
                                    <option value="0">--Select a group--</option>
                                    <#list groups as group>
                                        <#if group.authorizedId != 1>
                                            <option value="${group.authorizedId}">${group.authorizationName}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Full Name:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="name" class="form-control" id="name">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Nick Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="nickName" class="form-control" id="nickName">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Designation:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="desiId" id="desiId">
                                    <option value="0">--Select a designation--</option>
                                    <#list designationList as designation>
                                        <#if designation.id != 1>
                                            <option value="${designation.id}">${designation.name}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>


                        <div class="col-lg-3 text-left">
                            Department:
                        </div>
                        <div class="col-lg-1 text-right blink">*</div>
                        <div class="col-lg-8 text-left">
                            <div class="form-group">
                                <select class="form-control" name="dptId" id="dptId">
                                    <option value="0">--Select a department--</option>
                                    <#list departmentList as department>
                                        <option value="${department.id}">${department.name}</option>
                                    </#list>
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
                                    <input type="text" name="officePhone" class="form-control" id="officePhone">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Cell Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="cellPhone" class="form-control" id="cellPhone">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Work Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="workEmail" class="form-control" id="workEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Personal Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="personalEmail" class="form-control" id="personalEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Web Link:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" class="form-control" id="webLink" name="webLink"">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="saveUserDetails();" class="btn btn-success">Save</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<!--End First Row -->
<script type="text/javascript">
    //username groupId  password workEmail personalEmail webLink
    // confirmPassword cellPhone userType name nickName  desiId  dptId officePhone
    function checkUserDuplicate() {
        var username = $('#username').val();
        $.ajax({             //duplicateMsg
            url: '/brtc/security/checkDuplicateUser.buet',
            data: "username=" + username,
            dataType: "json",
            success: function (data) {
                if (data.msg == "Yes") {
                    $('#username').val("");
                    makModalAlert('danger', "Username already exists !", "Username \"<b>" + username + "</b>\"is used by <b>" + data.name + ".</b></br> Please choose another one");
                } else {
                    //document.dataForm.submit();
                }
            }
        });
    }
    function saveUserDetails() {
        //alert("yes") ;
        var username = $('#username').val();
        var groupId = $('#groupId').val();
        var password = $('#password').val();
        var workEmail = $('#workEmail').val();
        var personalEmail = $('#personalEmail').val();
        var webLink = $('#webLink').val();
        var confirmPassword = $('#confirmPassword').val();
        var cellPhone = $('#cellPhone').val();
        var name = $('#name').val();
        var userType = $('#userType').val();
        var nickName = $('#nickName').val();
        var dptId = $('#dptId').val();
        var desiId = $('#desiId').val();
        var officePhone = $('#officePhone').val();
        ///alert(userType) ;


        if (username == "" || groupId == 0 || password == ""
                || confirmPassword == ""
                || name == "" || userType == 0 || dptId == 0 || desiId == 0
        /*|| workEmail == "" || nickName == "" || cellPhone == ""
        || personalEmail == "" || webLink == "" || officePhone == ""*/) {
            makModalAlert("warning", "Attention !", "Please fill all required field [ <span class=\"blink\">*</span> marked ] up of the form before submit.");
            return false;
        }
        $.ajax({
            //I have used two step to save user and user details
            //First user by ajax secondly details by submitting form
            url: '/brtc/security/saveUser.buet',
            data: {
                username: username,
                password: password,
                confirmPassword: confirmPassword,
                userType: userType
            },
            dataType: "json",
            success: function (data) {
                if (data.success == "no") {
                    makModalAlert("danger", "Sorry !", data.msg);
                } else {
                    makModalAlert("success", "Yes !", data.msg);
                    setTimeout(function () {
                        //Here is the function to save user details
                        document.userDetailsForm.submit();
                    }, 1000);

                }
            }
        });
    }
</script>
</@layout.my_app_layout>


