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
                <i class="fa fa-list"></i>  <a id="departmentToggleBreadcrumb" onclick=""></a>
            </li>

        </ol>
    </div>
</div>
<div class="row"  id="departmentList">
    <div class="col-lg-12 text-center" style="min-height: 350px">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped pagination-table" id="departmentListTable">
                        <thead>
                        <tr>
                            <th class="text-center">Actions</th>
                            <th>ID</th>
                            <th>Department Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Teacher</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list departmentList as department>
                            <tr>
                                <td class="text-center col-md-1">
                                    <button type="button" class="fa fa-pencil editDepartment"></button>
                                    <button type="button" class="fa fa-times text-danger deleteDepartment" deptId="${department.id}"></button>
                                </td>
                                <td class="id">${department.id}</td>
                                <td class="name">${department.name}</td>
                                <td class="email"><#if department.email??>${department.email}</#if></td>
                                <td class="phone"><#if department.phone??>${department.phone}</#if></td>
                                <td class="address"><#if department.address??>${department.address}</#if></td>
                                <td class="address"><#if department.userDetailsList??>${department.userDetailsList?size}</#if></td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <div class="col-lg-12" style="background-color: #c7c7c7;">
        <div class="row">
            <div class="col-lg-6 text-left" >
                <div class="displaying-div"></div>
            </div>
            <div class="col-lg-6 text-right paging-div"></div>
        </div>
    </div>
</div>

<!--End First Row -->
<div class="row"  id="departmentCreate">
    <div class="col-lg-6 text-center">
        <form name="departmentDataForm" id="departmentDataForm" action="saveDepartment.buet" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success" id="form-title">${PageTitle}</h3>

                    <!--This hidden field is used on edit -->
                    <input type="hidden" name="id" id="id" value=""/>

                    <div class="col-lg-4 text-left">
                        Department:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="name" class="form-control" id="name" onclick="clearErrMsg()">
                                <label id="nameErrMsg" class="errMsgLabel" style="color: red;"></label>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Phone:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="phone" class="form-control" id="phone">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Email:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="email" class="form-control" id="email">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Address:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <textarea class="form-control" rows="3" name="address" id="address"></textarea>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                    </div>
                    <div class="col-lg-8 text-right">
                        <button type="reset" class="btn btn-primary" onclick="departmentList();" id="resetBtn">Reset</button>
                        <button type="button" class="btn btn-success" id="saveBtn">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--End Second Row -->
<script type="text/javascript">
    $('#saveBtn').click(function(){
        var name = $('#name');
        if (name.val()=="") {
            $('#nameErrMsg').html("Please insert a name.")
            name.css("background-color", "yellow");
            name.focus();
            return;
        }
        document.departmentDataForm.submit();
    });

    $('#name').click(function(){
        $('#name').css("background-color", "white");
    });
    $(document).ready(function(){
        $("#departmentCreate").hide();
        var dtbc = $("#departmentToggleBreadcrumb");
        dtbc.text("Create Department");
        dtbc.attr("onclick", "createDepartment()");
    });

    $('.deleteDepartment').click(function(){
        var id = $(this).attr('deptId');
        //alert(id); return;
        $.ajax({
            url: '/brtc/hrm/deleteDepartment.buet',
            data: "id="+id,
            dataType: "json",
            success: function(data){
                if(data.success == "no"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("This Department can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    $('#alertModal-success').modal('show');
                    $('#alert-success-title').html("Yes !") ;
                    $('#alert-success-body').html("Delete has been deleted successfully.") ;
                    //$.growl.notice({title: "Yes !", message: "Client has been deleted successfully." });
                    setTimeout(function(){
                        window.location.href = '/brtc/hrm/createDepartment.buet';
                    }, 2000);
                }
            }
        });
    });

    function createDepartment(){
        $("#departmentToggleBreadcrumb").text("Department List");
        $("#departmentCreate").show();
        $("#departmentList").hide();
        document.getElementById("saveBtn").innerHTML = "Create";
        document.getElementById("resetBtn").innerHTML = "Reset";
        $("#resetBtn").attr("onclick", "");
        $("#departmentToggleBreadcrumb").attr("onclick", "departmentList()");
    }

    function departmentList(){
        $("#departmentToggleBreadcrumb").text("Create Department");
        $("#departmentCreate").hide();
        $("#departmentList").show();
        $("#departmentToggleBreadcrumb").attr("onclick", "createDepartment()");
    }


    $(".editDepartment").click(function () {
        var $row = $(this).closest("tr");    // Find the row
        var $id = $row.find(".id").text();

        var $name = $row.find(".name").text();
        var $email = $row.find(".email").text();
        var $phone  = $row.find(".phone").text();
        var $address = $row.find(".address").text();

        $('#id').val($id);
        $('#name').val($name);
        $('#email').val($email);
        $('#phone').val($phone);
        $('#address').val($address);

        $('#saveBtn').html("Update");
        $('#resetBtn').html("Back");
        $('#form-title').html("Update Department");

        $("form").attr("action", "updateDepartment.buet");
        $("#departmentList").hide();
        $("#departmentCreate").show();
        $("#name").focus();
        $("#name").select();
    });

    jQuery(function($) {
        var items = $(".pagination-table tbody tr");
        var pagingDiv = ".paging-div";
        var pagingUl = pagingDiv + " ul";      //instead of $('#departmentPaging ul')

        var numItems = items.length;
        var perPage = 10;
        items.slice(perPage).hide();
        $(pagingDiv).pagination({
            items: numItems,
            itemsOnPage: perPage,
            onPageClick: function(pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
                $(pagingUl).prop('class', 'pagination');   //bootstrap css for pagination
                $('.displaying-div').html("Displaying "+(showFrom+1)+"-"+(showTo<=numItems? showTo : numItems)+" out of "+numItems);
            }
        });
        $(pagingUl).prop('class', 'pagination');    //bootstrap css for pagination
        $('.displaying-div').html("Displaying 1-"+(perPage<=numItems? perPage : numItems)+" out of "+numItems);
    });


</script>



</@layout.my_app_layout>