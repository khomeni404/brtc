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
                <i class="fa fa-arrow-circle-o-right"></i>${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 text-center">
        <form name="designationDataForm" id="designationDataForm" action="saveDesignation.buet" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">${PageTitle}</h3>
                    <input type="hidden" name="id" id="id" value=""/>

                    <div class="col-lg-4 text-left">
                        Designation:
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
                        Description:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="description" class="form-control" id="description"
                                       onclick="clearErrMsg()">
                                <label id="descriptionErrMsg" class="errMsgLabel" style="color: red;"></label>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 text-left">
                    </div>
                    <div class="col-lg-8 text-right">
                        <button type="reset" class="btn btn-primary">Reset</button>
                        <button type="button" class="btn btn-success" id="saveBtn">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-primary">Designation List</h3>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>Sl</th>
                            <th>Designation</th>
                            <th>Description</th>
                            <th class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#assign sl = 1>
                            <#list designationList as designation>
                                <#if designation.id !=1>
                                <tr>
                                    <td class="id">${sl}</td>
                                    <td class="name"><#if designation.description??>${designation.name}</#if></td>
                                    <td class="desc"><#if designation.description??> ${designation.description}</#if></td>
                                    <td class="text-center">
                                        <a href="#" title="Delete" onclick="deleteDesignation(${designation.id})"
                                           class="fa fa-times fa-lg text-pad-t-3"></a>
                                        &nbsp;&nbsp;
                                        <a title="Edit" class="fa fa-pencil fa-lg text-pad-t-3 designation-edit editBtn"
                                           designationId="${designation.id}" id="editBtn"></a>
                                    </td>
                                </tr>
                                    <#assign sl = 1+sl>
                                </#if>
                            </#list>

                        <script type="text/javascript">

                            $('#saveBtn').click(function () {
                                var name = $('#name');
                                var description = $('#description');
                                if (name.val() == "") {
                                    $('#nameErrMsg').html("Please insert a name.")
                                    name.css("background-color", "yellow");
                                    name.focus();
                                    return;
                                }
                                if (description.val() == "") {
                                    $('#descriptionErrMsg').html("Please insert description.")
                                    description.css("background-color", "yellow");
                                    description.focus();
                                    return;
                                }
                                document.designationDataForm.submit();
                            });

                            $('#name').click(function () {
                                $('#name').css("background-color", "white");
                            });
                            $('#description').click(function () {
                                $('#description').css("background-color", "white");
                            });
                            $(".designation-edit").click(function () {
                                var $row = $(this).closest("tr");    // Find the row
                                var $text1 = $(this).attr('designationId'); // Find the text
                                var $text2 = $row.find(".name").text(); // Find the text
                                var $text3 = $row.find(".desc").text(); // Find the text
                                $('#id').val($text1);
                                $('#name').val($text2);
                                $('#description').val($text3);
                                $('#saveBtn').html("Update");
                                $("form").attr("action", "updateDesignation.buet");

                            });
                            function deleteDesignation(id) {
                                var row = $(this).closest("tr");
                                $.ajax({
                                    url: '/brtc/hrm/deleteDesignation.buet',
                                    data: "id=" + id,
                                    dataType: 'json',
                                    success: function (data) {
                                        if (data.msg == "Yes") {
                                            //row.remove();
                                            window.location = '/brtc/hrm/createDesignation.buet'
                                        } else {
                                            makModalAlert('warning', 'Sorry !', 'This designation already used.')
                                        }
                                    }
                                })
                            }
                        </script>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

</div>
<!--End First Row -->

</@layout.my_app_layout>