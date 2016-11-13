<#--Financial Status View Modal -->
<form name="updateEncashmentDataForm" id="updateEncashmentDataForm" action="updateClientPayment.buet" method="POST">

    <div class="modal fade" id="paymentEncash" tabindex="-1" role="dialog" aria-labelledby="basicModal"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="financialModalStatement">
                <div class="modal-header">
                    <span class="input-group-addon"> <i class="fa fa-bank fa-3x"></i>
                    <h4 class=" text-success modal-title" id="myModalLabel"> Payment Encashment </h4>
                    </span>

                </div>
                <div class="modal-body" id="teamModal">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-green" id="main-panel">
                                <div class="panel-body">

                                    <div class="col-lg-4 text-left">
                                        BRTC Number:
                                    </div>
                                    <div class="col-lg-8 text-center">
                                        <div class="form-group">
                                            <div class="form-group has-success">
                                                <input type="text" name="brtcNo" id="brtcNo"
                                                       class="form-control" readonly
                                                       >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 text-left">
                                        MR Number:
                                    </div>
                                    <div class="col-lg-8 text-left">
                                        <div class="form-group">
                                            <div class="form-group has-success">
                                                <input type="text" name="mrNo" id="mrNo"
                                                       class="form-control "     onkeypress="clearErrMsg()"  onchange="clearErrMsg()"
                                                        >
                                                <label id="mrNoErrMsg" class="errMsgLabel" style="color: red"></label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-lg-4 text-left">
                                        Encash Date:
                                    </div>
                                    <div class="col-lg-8 text-left">
                                        <div class="form-group">
                                            <div class="form-group has-success">
                                                <input type="text" name="encashDate" readonly id="encashDate" onchange="clearErrMsg()"
                                                       class="form-control"
                                                       placeholder="YYYY-MM-DD">
                                                <label id="encashDateErrMsg" class="errMsgLabel" style="color: red"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Discard</button>
                    <button type="button" class="btn btn-success" id="encashRecord">
                        Save MR
                    </button>
                </div>
            </div>
        </div>

    </div>

</form>
<script>
    $('#encashRecord').click(function(){
        var mrNo = $('#mrNo').val();
        var encashDate = $('#encashDate').val();
        if(mrNo === ""){
            $('#mrNoErrMsg').html("Please insert MR No.");
            return false;
        }
        if(encashDate === ""){
            $('#encashDateErrMsg').html("Please insert Encash Date");
            return false;
        }
        document.updateEncashmentDataForm.submit();
    });

    $(function () {
        $('#encashDate').datepicker({
            format: 'yyyy-mm-dd',
            //startDate: '-3d',
            endDate: '1d',
            autoclose: true
        })
    });
</script>

