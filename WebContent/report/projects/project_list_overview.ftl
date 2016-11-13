<div class="panel panel-default" style="background-color: #d8d8d8">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-2 text-left" style="font-size: 20px; font-weight: bold;">Project List Overview</div>
            <div class="col-lg-10 text-left" style="border-left: 3px solid white">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <select name="progressStatus" id="progressStatus" class="form-control">
                                    <option value="null">--Select a Progress Status--</option>
                                    <option value="all">All</option>
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
                                <select name="financialStatus" id="financialStatus" class="form-control">
                                    <option value="null">--Select a Financial Status--</option>
                                    <option value="all">All</option>
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
                                <select name="distributionStatus" id="distributionStatus" class="form-control">
                                    <option value="null">--Select a Distribution Status--</option>
                                    <option value="all">All</option>
                                    <option value="0">No distribution</option>
                                    <option value="1">Partial distributed</option>
                                    <option value="2">Full distributed</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="" reportURL="" onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <button type="button" id="downloadReport-PL-1"
                                        class="btn btn-success"><span
                                        class="fa fa-print"></span> Print
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" placeholder="YYYY-MM-DD" readonly name="startDate-PL-2" id="startDate-PL-2" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" placeholder="YYYY-MM-DD" readonly name="endDate-PL-2" id="endDate-PL-2" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <select name="progressStatus-PL-2" id="progressStatus-PL-2" class="form-control">
                                    <option value="">--Select a Progress Status--</option>
                                    <option value="all">All</option>
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
                    <div class="col-lg-1">
                        <div class="form-group has-success" id="">
                            <button type="button" id="" reportURL="" onclick="alert('This Feature Yet Not Included')"
                                    class="btn btn-warning"><span
                                    class="fa fa-eye"></span> View
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="form-group has-success" id="">
                                <button type="button" id="downloadReport-PL-2"
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
</div>

<script>
    $('#downloadReport-PL-1').click(function () {
        // progressStatus   distributionStatus financialStatus
        var ps = $('#progressStatus').val();
        var fs = $('#financialStatus').val();
        var ds = $('#distributionStatus').val();
        var paramArr = ps + "," + fs + "," + ds;
        if ([ps, fs, ds].indexOf("null") > -1) {
            makModalAlert('warning', 'Attention',"Please select every status !");
        } else {
            window.location.href = '/brtc/report/projectListAccordingStatuses.buet?paramArr=' + paramArr;
        }
    });

    $('#downloadReport-PL-2').click(function () {
        //alert(); return false;
        var ps = $('#progressStatus-PL-2').val();
        var startDate = $('#startDate-PL-2').val();
        var endDate = $('#endDate-PL-2').val();
        var paramArr = startDate + "," + endDate + "," + ps;
        if ([startDate, endDate, ps].indexOf("") > -1) {
            makModalAlert('warning', 'Attention',"Please select each of 3 fields !");
        } else {

            window.location.href = '/brtc/report/projectListAccordingStatusesByDate.buet?paramArr=' + paramArr;
        }
    });

    $(function () {
        $("#startDate-PL-2").datepicker({ format: 'yyyy-mm-dd', autoclose: true});
        $("#endDate-PL-2").datepicker({ format: 'yyyy-mm-dd', autoclose: true});
    });
/*
    $("#endDate-PL-2").change(function () {
        var startDate = $('#startDate-PL-2');
        var endDate = $('#endDate-PL-2');
        if(startDate.val() == "" || endDate.val() == "") {
            return;
        } else {
            validateDate(startDate, endDate);//alert();
        }

    });

    function validateDate(startDate, endDate){
        var start = parseInt(startDate.val().replace("-", "").replace("-", ""));
        var end = parseInt(endDate.val().replace("-", "").replace("-", ""));
        if (start > end) {
            //alert();
           endDate.css("background-color", "yellow");
            return("Date 'To' can't be bigger than Date 'from'");
            *//*
            endDate.text('loading...').delay(1000).queue(function () {
                endDate.val('');
            });*//*
        } else {
            endDate.css("background-color", "");
        }
    }*/
</script>


<#--

var start = parseInt($("#startDate").val().replace("-", "").replace("-", ""));
var end = parseInt($("#endDate").val().replace("-", "").replace("-", ""));
if (start > end) {
alert("Date 'To' can't be bigger than Date 'from'");
$("#endDate").css("background-color", "yellow");
$('#endDate').text('loading...').delay(1000).queue(function () {
$('#endDate').val('');
});
} else {
$("#endDate").css("background-color", "");
}-->
