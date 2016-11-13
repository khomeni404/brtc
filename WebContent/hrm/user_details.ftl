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
                <i class="fa fa-plus"></i><a> <a href="/brtc/hrm/userDetailsCreate.buet"> Create User</a>
            </li>
            <li class="active">
                <i class="fa fa-arrow-circle-o-right"></i>User Details
            </li>

        </ol>
    </div>
</div>


<div class="row" id="firstRow">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-primary">User Details List</h3>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped pagination-table">
                        <thead>
                        <tr>
                            <th class="text-center">Actions</th>
                            <th>Name & Nick Name</th>
                            <th>Username & Group</th>
                            <th>Designation & Department</th>
                            <th>Contact</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list userDetailsList as userDetails>
                                <#if userDetails.token.username == "admin">
                                <#else >
                                <tr>
                                    <td class="text-center col-md-1">
                                        <button type="button" class="fa fa-pencil editDetails"
                                                detailsId="${userDetails.id}"></button>
                                        |
                                        <button type="button" class="fa fa-times text-danger deleteDetails"
                                                detailsId="${userDetails.id}"></button>
                                    </td>
                                    <td>${userDetails.name}<br>(${userDetails.nickName})</td>
                                    <td>${userDetails.token.username}
                                        <br>${userDetails.token.user.authorizedGroups[0].authorizationName}</td>
                                    <td>${userDetails.designation.name}, ${userDetails.department.name}<br/> ${userDetails.webLink}</td>
                                    <td>
                                    ${userDetails.cellPhone} /
                                    ${userDetails.officePhone}<br>
                                    ${userDetails.workEmail} /
                                    ${userDetails.personalEmail}
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

    <div class="col-lg-12" style="background-color: #c7c7c7;">
        <div class="row">
            <div class="col-lg-6 text-left">
                <div class="displaying-div"></div>
            </div>
            <div class="col-lg-6 text-right paging-div"></div>
        </div>
    </div>
</div>


<!--End First Row -->
<script type="text/javascript">
    $('.editDetails').on('click', function () {
        var id = $(this).attr('detailsId');
        window.location.href = '/brtc/hrm/editUserDetails.buet?id=' + id;
    });

    $('.deleteDetails').click(function () {
        var id = $(this).attr('detailsId');
        $.ajax({
            url: '/brtc/hrm/deleteUserDetails.buet',
            data: "id=" + id,
            dataType: "json",
            success: function (data) {
                if (data.success == "false") {
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("This User can't be deleted !");
                    $('#alert-danger-body').html(data.msg);
                } else {
                    $('#alertModal-success').modal('show');
                    $('#alert-success-title').html("Yes !");
                    $('#alert-success-body').html("User has been deleted successfully.");
                    //$.growl.notice({title: "Yes !", message: "Client has been deleted successfully." });
                    setTimeout(function () {
                        window.location.href = '/brtc/hrm/userDetailsList.buet';
                    }, 3000);
                }
            } ,
            failure: function(){
                $('#alertModal-danger').modal('show');
                $('#alert-danger-title').html("Sorry !");
                $('#alert-danger-body').html("Server Error");
            }
        });
    });

    //Pagination
    jQuery(function ($) {
        var items = $(".pagination-table tbody tr");
        var pagingDiv = ".paging-div";
        var pagingUl = pagingDiv + " ul";      //instead of $('#departmentPaging ul')

        var numItems = items.length;
        var perPage = 5;
        items.slice(perPage).hide();
        $(pagingDiv).pagination({
            items: numItems,
            itemsOnPage: perPage,
            onPageClick: function (pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
                $(pagingUl).prop('class', 'pagination');   //bootstrap css for pagination
                $('.displaying-div').html("Displaying " + (showFrom + 1) + "-" + (showTo <= numItems ? showTo : numItems) + " out of " + numItems);
            }
        });
        $(pagingUl).prop('class', 'pagination');    //bootstrap css for pagination
        $('.displaying-div').html("Displaying 1-" + (perPage <= numItems ? perPage : numItems) + " out of " + numItems);
    });
</script>



</@layout.my_app_layout>


