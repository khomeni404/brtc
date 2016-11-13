<div class="panel panel-default"  style="background-color: #d8d8d8">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-2 text-left" style="font-size: 20px; font-weight: bold;">Financial Statements</div>
            <div class="col-lg-10 text-left" style="border-left: 3px solid white">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <select name="progressStatus" id="progressStatus-FS-1" class="form-control">
                                    <option value="null">--Select a Progress Status--</option>
                                    <option value="-1">All</option>
                                    <option value="0">Not Assigned</option>
                                    <option value="1">Assigned</option>
                                    <option value="2">No Response</option>
                                    <option value="3">Negotiating</option>
                                    <option value="4">Negotiation Failed</option>
                                    <option value="5">Running</option>
                                    <option value="6">Stopped</option>
                                    <option value="7">Completed</option>
                                    <option value="8">Others</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <select name="financialStatus" id="financialStatus-FS-1" class="form-control">
                                    <option value="null">--Select a Financial Status--</option>
                                    <option value="-1">All</option>
                                    <option value="0">No deposit</option>
                                    <option value="1">Partial deposit</option>
                                    <option value="2">Full deposit</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <select name="distributionStatus" id="distributionStatus-FS-1" class="form-control">
                                    <option value="null">--Select a Distribution Status--</option>
                                    <option value="-1">All</option>
                                    <option value="0">No distribution</option>
                                    <option value="1">Partial distributed</option>
                                    <option value="2">Full distributed</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <button type="button" id="downloadReport-FS"
                                        class="btn btn-success"><span
                                        class="fa fa-file-pdf-o"></span> Download Report
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $('#downloadReport-FS').click(function () {
        // progressStatus   distributionStatus financialStatus
        var ps = $('#progressStatus').val();
        var fs = $('#financialStatus').val();
        var ds = $('#distributionStatus').val();
        var paramArr = ps + "," + fs + "," + ds;
        if ([ps, fs, ds].indexOf("null") > -1) {
            alert("Please select every status !");
        } else {
            window.location.href = '/brtc/report/projectListAccordingStatuses.buet?paramArr=' + paramArr;
        }
    });

    $(function () {
        $("#example1").datepicker({ dateFormat: 'yy-dd-mm'});
    });

</script>
