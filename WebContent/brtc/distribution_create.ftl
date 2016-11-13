<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<script src="distribution_create.js"></script>

<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/distributionList.buet?fileNo=All"> Distribution List</a>
            </li>
            <li>
                <i class="fa fa-file"></i><a href="/brtc/brtc/viewBrtcProject.buet?fileNo=${fileNo}"> Project</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating Project
            </li>

        </ol>
    </div>
</div>

<div class="row">

    <div class="col-lg-12 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <div class="row" style="background-color: #e5dfe3; margin: 0 10 0 10">
                    <div class="col-lg-12 text-center">
                        <h3 class="text-left text-success">Distribution Form</h3>
                    </div>
                    <div class="col-lg-12 text-left" style="font-size: 21px">
                        <b>File ${fileNo} : </b> ${project.projectTitle}
                    </div>
                    <div class="col-lg-12 text-left" style="color: #200080">
                        <div class="row">
                            <div class="col-lg-2"><h4 class="text-left text-success"><b>BRTC No. : </b></h4></div>
                            <div class="col-lg-3">
                            ${brtcNos}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5 text-right"><label id="brtcNosErrMsg" class="errMsgLabel"
                                                                    style="color: red"></label></div>
                        </div>

                    </div>
                    <div class="col-lg-12 text-left">
                        <hr/>
                    </div>
                </div>
                <div class="col-lg-12 text-left"><br/></div>
                <div class="row" style="background-color: #fdf7fb; margin: 0 10 0 10">
                    <form name="distributionDataForm" id="distributionDataForm" action="saveDistribution.buet"
                          method="POST">

                        <input type="hidden" name="fileNo" id="fileNo" value="${fileNo}"/>


                        <div class="col-lg-12 text-center">
                            <div class="row">
                                <div class="col-lg-2 text-left">
                                    Total Amount:
                                </div>
                                <div class="col-lg-2 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="totalAmount" id="totalAmount" value="0"
                                                   class="form-control has-success dist-amount">
                                            <label id="totalAmountErrMsg" class="errMsgLabel"
                                                   style="color: red"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-right">
                                    Advances (Dept.):
                                </div>
                                <div class="col-lg-2 text-center">
                                    <div class="form-group has-success">
                                        <input type="text" name="advances" id="advances" value="0"
                                               class="form-control has-success dist-amount">
                                        <label id="advancesErrMsg" class="errMsgLabel" style="color: red"></label>
                                    </div>
                                </div>
                                <div class="col-lg-2 text-right">
                                    Others :
                                </div>
                                <div class="col-lg-2 text-center">
                                    <div class="form-group has-success">
                                        <input type="text" name="others" id="others" value="" readonly
                                               class="form-control has-success">
                                        <label id="othersErrMsg" class="errMsgLabel" style="color: red"></label>
                                    </div>
                                </div>
                            </div>

                            <!--Consultants List-->
                            <div class="row">
                                <div class="col-lg-2 text-left">
                                    Consultant:
                                </div>
                                <div class="col-lg-10 text-center">

                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th>Consultant Name</th>
                                                <th>Designation</th>
                                                <th>Type</th>
                                                <th>Team</th>
                                                <th class="col-sm-2">Amount</th>
                                                <th>Is Active</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#assign y = 0>
                                                <#if teacherList??>
                                                    <#list teacherList as teacher>
                                                        <#assign color = (teacher.active == "Inactive")?string("red", "green")>
                                                    <tr style="color: ${color};">
                                                        <td>${teacher.name}</td>
                                                        <td>${teacher.designation}</td>
                                                        <td>${teacher.type}</td>
                                                        <td>${teacher.team}</td>
                                                        <td>
                                                            <input type="text" name="consultantsFees" id="" value="0"
                                                                   <#if teacher.active == "Inactive">readonly</#if>
                                                                   onkeypress="clearErrMsg()"
                                                                   class="form-control has-success dist-amount teacherAmount">
                                                        </td>
                                                        <td>${teacher.active}</td>
                                                    </tr>
                                                        <#assign y = y + 1>
                                                    </#list>
                                                </#if>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                            <#if teacherList??>
                                <#list teacherList as teacher>
                                    <input type="hidden" value="${teacher.id}" name="consultantsId" class="teacherId"/>
                                </#list>

                            </#if>


                            <div class="row">
                                <div class="col-lg-4 text-left">
                                </div>
                                <div class="col-lg-8 text-right">
                                    <button type="reset" class="btn btn-primary" name="reset" value="reset">Reset
                                    </button>
                                    <button type="button" onclick="saveDistribution();" name="save" value="save"
                                            class="btn btn-success">Save
                                    </button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->

<script type="text/javascript">
    var consultantFeesTotal = 0.0;
    var consultantFees = "";
    var consultantIds = "";

    $('.dist-amount').keyup(function () {
        $('#othersErrMsg').html("");
        $(this).val(parseInt(
                $(this).val() === "" ? "0" : $(this).val()
        ));

        consultantFeesTotal = 0.0;
        consultantFees = "";
        consultantIds = "";
        $(".teacherAmount").each(function() {
            var v = $(this).val();
            consultantFeesTotal += parseInt(v)
            consultantFees += v+",";
        });
        $(".teacherId").each(function() {
            consultantIds += $(this).val()+",";
        });

        var advances = parseInt($('#advances').val());
        consultantFeesTotal = parseInt(consultantFeesTotal);
        var totalAmountE = $('#totalAmount');
        var totalAmount = parseInt(totalAmountE.val()); //advances + consultantFeesTotal;


        if ($(this).attr('id') === "totalAmount") {
            var calTotAmount = advances + consultantFeesTotal;
            if (totalAmount < calTotAmount) {
                $(this).val(calTotAmount);
                return false;
            }
        } else {
            var amount = totalAmountE.val();
            if (amount <= 0) {
                $(this).val("0");
                return false;
            }
        }
        var othersE = $('#others');
        if (totalAmount - advances - consultantFeesTotal < 0) {
            var x = $(this).val();
            var othersAmount = parseInt(othersE.val());
            var thisAmount = parseInt(x.substr(0, x.length - 1));
            $(this).val('0');
            if (x.length > 1)
                othersE.val(othersAmount + thisAmount);
            return false;
        }
        var others = totalAmount - advances - consultantFeesTotal;
        othersE.val(others);

        //console.log("consultantIds = " + consultantIds + " & Fees = " + consultantFees);
    });

    function saveDistribution() {
        var totalAmount = parseInt($('#totalAmount').val());
        var advances = parseInt($('#advances').val());
        var others = totalAmount - advances - consultantFeesTotal;
        //console.log(others + " - " + totalAmount + " - " + advances + " - " + consultantFeesTotal)
        var fileNo = $('#fileNo').val();
        var brtcNos = $('#brtcNos').val();
        if ([brtcNos].indexOf("null") > -1) {
            $('#brtcNosErrMsg').html("Please Select a BRTC number.");
            return false;
        }
        if (totalAmount == 0) {
            $('#totalAmountErrMsg').html("This field can't be empty");
            return false;
        }
        $.ajax({
            url: '/brtc/brtc/saveDistribution.buet',
            data: {
                totalAmount: totalAmount,
                advances: advances,
                consultantFeesTotal: consultantFeesTotal,
                others: others,
                consultantFees: consultantFees,
                consultantIds: consultantIds,
                fileNo: fileNo,
                brtcNos: brtcNos
            },
            dataType: "json",
            success: function (data) {
                if (data.success == "yes") {
                    $('#alertModal-success').modal('show');
                    $('#alert-success-title').html("Yes !");
                    $('#alert-success-body').html(data.msg);
                    setTimeout(function () {
                        window.location.href = '/brtc/brtc/viewBrtcProject.buet?fileNo=' + fileNo;
                    }, 3000);
                } else {
                    alert("Sorry brother");
                }
            }
        });
    }

    $('#brtcNos').on('change', function(){
        clearErrMsg();
    });
</script>





</@layout.my_app_layout>








