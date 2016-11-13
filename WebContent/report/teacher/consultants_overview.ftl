<div class="panel panel-default" style="background-color: #dff1c7">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-2 text-left" style="font-size: 20px; font-weight: bold;">Consultant Overview</div>
            <div class="col-lg-10 text-left" style="border-left: 3px solid white">
                <div class="row" style="border-bottom: 3px solid white; margin-bottom: 10px">
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>Please Select department and click button to download/view Report </label>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group has-success" id="">
                            <select name="departmentId-CO" id="departmentId-CO" class="form-control">
                                <option value="null">--Select a Department--</option>
                                <option value="1">Civil Engineering</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <label>1. Teacher List : Consulted Project Status (According Department) </label>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-CO-1" reportURL="teachersProjectView"
                                    class="btn btn-info viewReport-CO"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-CO-1"
                                    class="btn btn-success"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success">
                            <label class="">2. Teacher List : Teachers & Received Amount (According
                                Department) </label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-CO-2" reportURL="teachersFinanceView"
                                    class="btn btn-info viewReport-CO"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-CO-2"
                                    class="btn btn-success"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <div class="form-group has-success">
                            <label class="">3. Teacher Projects </label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group has-success" id="">
                            <select name="teacherId-CO-3" id="teacherId-CO-3" class="form-control">
                                <option value="null">--Select Teacher--</option>
                            <#list teacherList as teacher>
                                <option value="${teacher.authorizeId}">${teacher.token.userDetails.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-CO-3" reportURL=""  onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning <#--viewReport-CO-->"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-CO-3"
                                    class="btn btn-success"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <div class="form-group has-success">
                            <label class="">4. Teacher Finance </label>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group has-success" id="">
                            <select name="teacherId-CO-4" id="teacherId-CO-4" class="form-control">
                                <option value="null">--Select Teacher--</option>
                            <#list teacherList as teacher>
                                <option value="${teacher.authorizeId}">${teacher.token.userDetails.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-CO-4" reportURL="" onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning <#--viewReport-CO-->"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-CO-4"
                                    class="btn btn-success"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $('.viewReport-CO').click(function () {
        //alert("Hi"); return false;
        var url = $(this).attr("reportURL");
        var deptId = $('#departmentId-CO').val();
        if ([deptId].indexOf("null") > -1) {
            ExpandSelect("departmentId-CO");
            return;
        } else {
            window.location.href = '/brtc/report/' + url + '.buet?deptId=' + deptId;
        }
    });

    $('#downloadReport-CO-1').click(function () {
        var deptId = $('#departmentId-CO').val();
        if ([deptId].indexOf("null") > -1) {
            ExpandSelect("departmentId-CO");
        } else {
            window.location.href = '/brtc/report/teachersProject.buet?deptId=' + deptId;
        }
    });

    $('#downloadReport-CO-2').click(function () {
        var deptId = $('#departmentId-CO').val();
        if ([deptId].indexOf("null") > -1) {
            ExpandSelect("departmentId-CO");
        } else {
            window.location.href = '/brtc/report/teachersFinance.buet?deptId=' + deptId;
        }
    });

    $('#downloadReport-CO-3').click(function () {
        var deptId = $('#departmentId-CO').val();
        var teacherId = $('#teacherId-CO-3').val();
        if ([teacherId, deptId].indexOf("null") > -1) {
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !");
            $('#alert-warning-body').html("Please select each option");
            return false;
        } else {
            window.location.href = '/brtc/report/teacherProjects.buet?deptId=' + deptId + "&teacherId=" + teacherId;
        }
    });
    $('#downloadReport-CO-4').click(function () {
        var deptId = $('#departmentId-CO').val();
        var teacherId = $('#teacherId-CO-4').val();
        if ([teacherId, deptId].indexOf("null") > -1) {
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !");
            $('#alert-warning-body').html("Please select each option");
            return false;
        } else {
            window.location.href = '/brtc/report/teacherFinance.buet?deptId=' + deptId + "&teacherId=" + teacherId;
        }
    });

</script>
