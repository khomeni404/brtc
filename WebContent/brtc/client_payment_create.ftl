<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/clientPaymentList.buet?findFor=all&status=0"> Deposit
                List</a>
            </li>
            <li>
                <i class="fa fa-cog fa-spin"></i> Creating ${PageTitle}
            </li>

        </ol>
    </div>
</div>


<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">Add Cheque Deposit Slip</h3>
                <hr/>
                <hr/>
                <form name="dataForm" id="dataForm" action="saveClientPayment.buet" method="POST">
                    <div class="col-lg-6 text-center">


                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group input-group  has-success">
                                <input list="projectList" name="fileNo" value="${fileNo}" id="fileNo"
                                       onkeyup="checkClient();" onblur="checkClient();" class="form-control ValBgYC"/>
                                <span class="input-group-btn">
                                    <button onclick="checkClient();" class="btn btn-success" type="button">Check Client
                                        &nbsp;&nbsp;
                                        <i class="fa fa-arrow-right fa-lg"></i>
                                    </button>
                                </span>
                            <#-- Data List code-->
                                <datalist id="projectList" autocomplete="off">
                                    <#list projectList as project>
                                    <option value="${project.fileNo}">
                                    </#list>
                                </datalist>

                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            BRTC Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="brtcNo" id="brtcNo" class="form-control ValBgYC"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Deposit Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="depositNo" id="depositNo" class="form-control ValBgYC"
                                           value=""/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Ref. Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="refNo" id="refNo" class="form-control ValBgYC" value=""/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Cheque Details:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="chequeDetails" id="chequeDetails"
                                           class="form-control ValBgYC" value=""/>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Amount:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group input-group  has-success">
                                <span class="input-group-addon">BDT.</span>
                                <input name="amount" id="amount" class="form-control ValBgYC" type="text" value=""
                                       readonly/>
                                <span class="input-group-addon">.00/-</span>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="submitForm()" class="btn btn-success">Save</button>
                        </div>

                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center" id="mak-right-column">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-lg-3 text-left">
                                    Client's Name:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="clientName" id="clientName" class="form-control"
                                                   disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 text-left">
                                    Client's Address:
                                </div>
                                <div class="col-lg-9 text-left">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="clientAddress" id="clientAddress"
                                                   class="form-control"
                                                   disabled/>
                                            <!-- <label class="form-control" id="clientAddress"></label>    -->
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Spokes Man:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="spokesMan" id="spokesMan" class="form-control"
                                                   disabled/>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Cell Number:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="cell" id="cell" class="form-control" disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 text-left">
                                    Work Description:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <textarea disabled name="projectTitle" id="projectTitle"
                                                      class="form-control  text-success text-justify"
                                                      rows="5"></textarea>
                                            <!--<label id="projectTitle" class="text-success text-justify"></label>-->
                                        </div>
                                    </div>
                                </div>

                                <script type="text/javascript">
                                    $('.ValBgYC').click(function () {
                                        $(this).css("background-color", "white");
                                    });

                                    function submitForm() {
                                        var fileNo = $('#fileNo');
                                        if (fileNo.val() == "") {
                                            makModalAlert('warning', 'Attention !', "Please select a file");
                                            fileNo.css("background-color", "yellow");
                                            fileNo.focus();
                                            return;
                                        }

                                        var brtcNo = $('#brtcNo');
                                        if (brtcNo.val() == "") {
                                            makModalAlert('warning', 'Attention !', "Please type a BRTC number");
                                            brtcNo.css("background-color", "yellow");
                                            brtcNo.focus();
                                            return;
                                        }

                                        var sss = brtcNo.prop('readonly');
                                        if(sss){
                                            makModalAlert('warning', 'Attention !', "Please Insert a valid 'File Number' first");
                                            return;
                                        }

                                        var amount = $('#amount');
                                        if (!$.isNumeric(amount.val())) {
                                            makModalAlert('warning', 'Attention !', "Only number is allowed in Amount field");
                                            amount.css("background-color", "yellow");
                                            amount.focus();
                                            return;
                                        }
                                        var depositNo = $('#depositNo');
                                        depositNo.val(depositNo.val() == "" ? "---" : depositNo.val());
                                        var refNo = $('#refNo');
                                        refNo.val(refNo.val() == "" ? "---" : refNo.val());
                                        var chequeDetails = $('#chequeDetails');
                                        chequeDetails.val(chequeDetails.val() == "" ? "---" : chequeDetails.val());

                                        $.ajax({
                                            url: '/brtc/brtc/saveClientPayment.buet',
                                            data: {
                                                brtcNo: brtcNo.val(),
                                                fileNo: fileNo.val(),
                                                depositNo: depositNo.val(),
                                                refNo: refNo.val(),
                                                chequeDetails: chequeDetails.val(),
                                                amount: amount.val()
                                            },
                                            dataType: 'json',
                                            success: function (data) {
                                                if (data.success == "No") {
                                                    makModalAlert('warning', 'Sorry', data.msg);
                                                } else {
                                                    window.location = '/brtc/brtc/clientPaymentList.buet?findFor='+brtcNo.val()+'&status=3'
                                                }
                                            }
                                        })
                                        //document.dataForm.submit();
                                    }
                                    function checkClient() {
                                        clearAll();
                                        var fileNo = $('#fileNo').val();
                                        var brtcNo = $("#brtcNo");
                                        Ext.Ajax.request({
                                            url: '/brtc/brtc/findBrtcProject.buet',
                                            params: {
                                                fileNumber: fileNo
                                            },
                                            success: function (conn, response, options, eOpts) {
                                                var result = Ext.JSON.decode(conn.responseText, true);
                                                $("#projectTitle").val(result.title);
                                                $("#clientAddress").val(result.address);
                                                $("#clientName").val(result.client);
                                                $("#spokesMan").val(result.spokesMan);
                                                $("#cell").val(result.spokesManCell);
                                                if (result.found) {
                                                    $("#amount").attr("readonly", false);
                                                    brtcNo.attr("readonly", false);
                                                } else {
                                                    $("#amount").attr("readonly", true);
                                                    brtcNo.attr("readonly", true);
                                                    brtcNo.val("Please insert a valid File Number first");
                                                }
                                            }
                                        });
                                    }
                                    function clearAll() {
                                        document.getElementById("projectTitle").value = "No project Found !";
                                        document.getElementById("clientName").value = "";
                                        document.getElementById("spokesMan").value = "";
                                        document.getElementById("cell").value = "";
                                        document.getElementById("clientAddress").value = "";
                                        $("#brtcNo").val("");
                                    }

                                    $(document).ready(function () {
                                        // checkClient();
                                        var forWhat = document.getElementById("fileNo").value;
                                        if (forWhat != "") {
                                            checkClient();
                                        }
                                    });

                                </script>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>
