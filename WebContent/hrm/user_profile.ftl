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

    <div class="col-lg-12 text-center">
        <h3 class="text-left text-success">User Profile</h3>

        <div class="panel panel-default">
            <div class="panel-body" style="background-color: #e8e8e8">
                <div class="col-lg-6 text-center">
                    <div class="col-lg-4 text-left">
                        Username:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">

                                <input type="text" name="username"
                                       class="form-control" id="username" readonly value="${user.token.username}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 text-left">
                        User Type:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <input type="text" value="${user.userType}" readonly class="form-control"
                                   name="userType" id="userType"/>
                        </div>
                    </div>

                </div>
                <div class="col-lg-6 text-center">
                    <div class="col-lg-4 text-left">
                        Password:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="password" value="" name="password"
                                       class="form-control editable" readonly id="password">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Confirm Password:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group has-success">
                            <input type="password" class="form-control editable" readonly id="confirmPassword"
                                   name="confirmPassword" value="">
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body" style="background-color: #e4e8c7">
                <form name="userDetailsForm" id="userDetailsForm" action="/brtc/hrm/updateUserDetails.buet"
                      method="POST">
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Group:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input type="text" class="form-control"
                                       value="${user.authorizedGroups[0].authorizationName}" readonly/>
                                <input type="hidden" value="${user.authorizedGroups[0].authorizedId}" name="groupIdOld"
                                       id="groupIdOld"/>
                                <input type="hidden" value="${user.authorizedGroups[0].authorizedId}" name="groupId"
                                       id="groupId"/>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Full Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" value="${details.name}" name="name" class="form-control" readonly
                                           id="name">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Nick Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" value="${details.nickName}" name="nickName"
                                           class="form-control editable" readonly id="nickName">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Designation:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input type="text" value="${details.designation.name}" readonly class="form-control"/>
                                <input type="hidden" value="${details.designation.id}" name="desiId" id="desiId"/>
                                <input type="hidden" value="${details.designation.id}" name="desiIdOld" id="desiIdOld"/>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Department:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input type="text" value="${details.department.name}" readonly
                                       class="form-control"/>
                                <input type="hidden" value="${details.department.id}" name="dptIdOld" id="dptIdOld"
                                       class="form-control"/>
                                <input type="hidden" value="${details.department.id}" name="dptId" id="dptId"
                                       class="form-control"/>
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
                                    <input value="${details.officePhone}" readonly="true" type="text" name="officePhone"
                                           class="form-control editable" readonly id="officePhone">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Cell Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" value="${details.cellPhone}" name="cellPhone"
                                           class="form-control editable" readonly id="cellPhone">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Work Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" value="${details.workEmail}" name="workEmail"
                                           class="form-control editable" readonly id="workEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Personal Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" value="${details.personalEmail}" name="personalEmail"
                                           class="form-control editable" readonly id="personalEmail">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Web Link:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" value="${details.webLink}" class="form-control editable" readonly
                                           id="webLink" name="webLink"">
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="id" value="${details.id}"/>

                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="button" onclick="editUserDetails()" class="btn btn-primary">General Edit</button>
                            <button type="button" onclick="administrativeEditUserDetails()" class="btn btn-warning">Administrative Edit</button>
                            <button type="button" onclick="updateUserDetails()" class="btn btn-success">Update</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<!--End First Row -->
<script type="text/javascript">
    $(document).ready(function () {
        var v = $('#myEditButton');
        v.attr("onclick", "editUserDetails()");
    });

    function editUserDetails() {
        var editableElements = document.getElementsByClassName("editable");
        for (var i = 0; i < editableElements.length; i++) {
            editableElements[i].style.backgroundColor = "yellow";
            editableElements[i].style.fontSize = "18px";
            $(editableElements[i]).attr("readonly", false);
        }
        $('#password').focus();
    }
    function administrativeEditUserDetails() {
        window.location = "/brtc/hrm/editUserDetails.buet?id="+${details.id};
    }
    function updateUserDetails() {
        var password = $('#password').val();
        var confirmPassword = $('#confirmPassword').val();
        var id = ${user.authorizeId};

        if (password != confirmPassword) {
            makModalAlert("warning", "Attention !", "Password doesn't match !.");
            return false;
        }
        $.ajax({
            url: '/brtc/security/updateUser.buet',
            data: "password=" + password + "&id=" + id,
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


