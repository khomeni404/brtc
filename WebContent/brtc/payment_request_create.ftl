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
                <i class="fa fa-list"></i><a href="/brtc/brtc/paymentRequestList.buet?findFor=all&status=0"> Requisition
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
                <h3 class="text-left text-success">Requisition For Advance Payment</h3>
                <hr/>
                <hr/>
                <form name="savePaymentRequestForm" id="savePaymentRequestForm" action="savePaymentRequest.buet" method="POST">
                    <div class="col-lg-6 text-center">


                        <div class="col-lg-3 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group input-group  has-success">
                                <input list="projectList" name="fileNumber" id="fileNumber"
                                       onkeyup="getProjectByFileNumber();" onblur="getProjectByFileNumber();"
                                       class="form-control"/>

                                <span class="input-group-btn">
                                    <button onclick="getProjectByFileNumber();" class="btn btn-success" type="button">
                                        Check Project &nbsp;&nbsp;
                                        <i class="fa fa-arrow-right fa-lg"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    <#-- Data List code-->
                        <datalist id="projectList" autocomplete="off">
                            <#list projectList as project>
                            <option value="${project.fileNo}">
                            </#list>
                        </datalist>


                        <div class="col-lg-3 text-left">
                            In favour of:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" checked onclick="setFavourOf(this)" name="optionsRadiosSelfOrNot"
                                           id="optionsRadiosSelfOrNot1"
                                           value="self" checked>Self
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" onclick="setFavourOf(this)" name="optionsRadiosSelfOrNot"
                                           id="optionsRadiosSelfOrNot2"
                                           value="others">Others
                                </label>
                            </div>
                        </div>


                        <div class="col-lg-3 text-left msDiv">
                            Mr. / Mrs. / MS :
                        </div>
                        <div class="col-lg-9 text-center msDiv">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="inFavourOf" id="inFavourOf"
                                           class="form-control" value="Self"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Purchase of /<br/>Supply of /<br/>Service of:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <textarea name="purposes" id="purposes"
                                              class="form-control  text-success text-justify"
                                              rows="3"></textarea>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-3 text-left" id="brtcNoLabel">
                            BRTC Number:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group">
                                <div class="form-group has-success" id="brtcListCreateDiv">
                                    <select name="brtcNumber" id="brtcNumber" class="form-control">

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Previous Advance:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="adv" id="adv" class="form-control" disabled>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-3 text-left">
                            New Advance:
                        </div>
                        <div class="col-lg-9 text-left">
                            <div class="form-group input-group  has-success">
                                <span class="input-group-addon">BDT.</span>
                                <input name="amount" id="amount" class="form-control" type="text" value="">
                                <span class="input-group-addon">.00/-</span>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="savePaymentRequest()" class="btn btn-success">Save</button>
                        </div>

                    </div>
                </form>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center" id="mak-right-column">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-lg-3 text-left">
                                    Project Name:
                                </div>
                                <div class="col-lg-9 text-left">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <textarea disabled name="projectTitle" id="projectTitle"
                                                      class="form-control  text-success text-justify"
                                                      rows="3"></textarea>
                                            <!--<label id="projectTitle" class="text-success text-justify"></label>-->
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Client's Name:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="clientName" id="clientName" class="form-control"
                                                   disabled>
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
                                                   disabled>
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
                                                   disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Cell Number:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="cell" id="cell" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</div>

<!--End First Row -->

<script type="text/javascript">
    Ext.onReady(function () {
        $(".msDiv").hide();
    });

    function setFavourOf(obj) {
        if(obj.value == "others"){
            //$("#inFavourOf").removeAttr('disabled');
            document.getElementById("inFavourOf").value = "";
            $(".msDiv").show();
            $("#inFavourOf").focus();
        }else{
            //$("#inFavourOf").prop('disabled', true);
            document.getElementById("inFavourOf").value = "Self";
            $(".msDiv").hide();
        }
    }

    function savePaymentRequest() {
        var fileNumber = document.getElementById("fileNumber").value;
        var optionsRadiosSelfOrNot = $("input[name=optionsRadiosSelfOrNot]:checked").val();
        var inFavourOf = document.getElementById("inFavourOf").value;
        var purposes = document.getElementById("purposes").value;
        var brtcNumber = document.getElementById("brtcNumber").value;
        var amount = document.getElementById("amount").value;


        if (fileNumber == "" || inFavourOf == "" || purposes == "" || brtcNumber == "--Select a BRTC number--"
             || !$.isNumeric(amount)) {
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !");
            $('#alert-warning-body').html("Make sure the form is filled up fully.");
            return false;
        }
        document.savePaymentRequestForm.submit();
    }

    function getProjectByFileNumber() {
        var fileNo = document.getElementById("fileNumber").value;

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
                $("#adv").val(result.receivedAmount);
                $("#brtcNoLabel").text("BRTC Number (" + result.totalBrtc + ")");
                $('#brtcNumber').html(result.brtcNos);// brtcString;
            }
        });
    }
</script>



</@layout.my_app_layout>
