<div class="panel panel-default" style="background-color: #dff1c7">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-2 text-left" style="font-size: 20px; font-weight: bold;">Project Overview</div>
            <div class="col-lg-10 text-left" style="border-left: 3px solid white">
                <div class="row" style="border-bottom: 3px solid white; margin-bottom: 10px">
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>Please insert file number and click relevant button to download Report </label>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right">File No: <span class="blink">*</span></div>
                    <div class="col-lg-3">
                        <div class="form-group has-success" id="">
                            <input list="projectDataList-PO-1" name="fileNo-PO-1" id="fileNo-PO-1"
                             style="width: 193px"      class="form-control">
                        <#-- Data List code-->
                            <datalist id="projectDataList-PO-1" autocomplete="on">
                            <#list projectList as project>
                            <option value="${project.fileNo}">
                            </#list>
                            </datalist>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>1. Project Details : By File Number </label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-PO-1" reportURL="viewBrtcProject"
                                    class="btn btn-info viewReport-PO"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-PO-1" reportURL="projectDetails"
                                    class="btn btn-success downloadReport-PO"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>2. Project History : By File Number</label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-PO-2" reportURL="projectHistoryList"
                                    class="btn btn-info viewReport-PO"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-PO-2" reportURL="projectHistory"
                                    class="btn btn-success downloadReport-PO"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>3. Financial & Distribution Status : By File Number </label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-PO-3" reportURL=""   onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning <#--viewReport-PO-->"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-PO-3" reportURL="projectFinance"
                                    class="btn btn-success downloadReport-PO"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>4. Assignment Letter of the project : By File Number </label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-PO-4" reportURL=""   onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning <#--viewReport-PO-->"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-PO-4"
                                    class="btn btn-success downloadReport-PO" reportURL="assignmentLetter"><span
                                    class="fa fa-print"></span> Print
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="form-group has-success" id="">
                            <label>5. Clients' Payment </label>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="viewReport-PO-5" reportURL="" onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning <#--viewReport-PO-->"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group has-success" id="">
                            <button type="button" id="downloadReport-PO-5"
                                    class="btn btn-success downloadReport-PO" reportURL="projectPayments"><span
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

    $('.downloadReport-PO').click(function () {
        var url = $(this).attr("reportURL");
        var file = $('#fileNo-PO-1');
        var fileNo = file.val();
        if ([fileNo].indexOf("") > -1) {
            makModalAlert('warning',"Attention !","Please Put a File Number");
            file.focus();
            return;
        } else {
            window.location.href ='/brtc/report/' + url + '.buet?fileNo=' + fileNo;
        }
    });
    $('.viewReport-PO').click(function () {
        var url = $(this).attr("reportURL");
        var file = $('#fileNo-PO-1');
        var fileNo = file.val();
        if ([fileNo].indexOf("") > -1) {
            makModalAlert('warning',"Attention !","Please Put a File Number");
            file.focus();
            return;
        } else {
            window.location.href = '/brtc/brtc/' + url + '.buet?fileNo=' + fileNo;
        }
    });

</script>
