<#--Adding Member Modal -->
<form name="setFinalFeeForm" id="setFinalFeeForm" action="updateProjectFee.buet" method="GET">
    <div class="modal fade" id="addFinalFeeModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Setting up FINAL FEE </h4>
                </div>
                <div class="modal-body" id="teamModal">
                    <div class="row">
                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${project.fileNo}" disabled/>
                            </div>
                        </div>
                        <div class="col-lg-4 text-left">
                            Previous Fee:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${project.finalFee}" disabled/>
                            </div>
                        </div>
                         <input type="hidden" id="fileNo" name="fileNo" value="${project.fileNo}"/>
                        <div class="col-lg-4 text-left">
                            Final Fee:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text" id="finalFee" name="finalFee" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="setFinalFeeNotNow();" class="btn btn-success">Not Now</button>
                    <button type="button" onclick="setFinalFee();" class="btn btn-success">Update Fee</button>
                    <button type="submit" class="btn btn-primary"  data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    function setFinalFee(){
        var fileNo = $('#fileNo').val();
        var finalFee = $('#finalFee').val();
        if(finalFee == "" || !$.isNumeric(finalFee)){
            alert("You must put an amount before save !") ;
            return false;
        }
        $.ajax({
            url: '/brtc/brtc/updateProjectFee.buet',
            data: "fileNo="+fileNo+"&finalFee="+finalFee,
            dataType: "json",
            success: function(data){
                if(data.success == "Yes"){
                    $('#addFinalFeeModal').modal('hide');
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Final fee set up successfully !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    $('#addFinalFeeModal').modal('hide');
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Sorry") ;
                    $('#alert-danger-body').html("Final fee can't be set...") ;
                }
            }
        });
    }

    $('#alert-danger-ok-button').click(function(){
        window.location = " /brtc/brtc/viewBrtcProject.buet?fileNo="+$('#fileNo').val();
    });

    function setFinalFeeNotNow(){
        $("#progressStatusUpdateModal").modal("show");
        $('#addFinalFeeModal').modal('hide');
    }
</script>

