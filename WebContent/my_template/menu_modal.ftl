
<div class="modal fade" id="distributionPromptModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-success">
            <div class="modal-header panel-heading">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title">Type File No & Click Distribution</h3>
            </div>
            <div class="modal-body" style="font-size: 18px">
                <div class="row">
                    <div class="col-lg-2 text-left"></div>
                    <div class="col-lg-3 text-right">
                        File No. :
                    </div>
                    <div class="col-lg-5 text-center">
                        <div class="form-group">
                            <input type="text" name="fileForDist" id="fileForDist" onclick="clearErrMsg()" class="form-control has-success" placeholder="File No">
                            <label for="errMsg" id="fileForDistErrMsg" class="errMsgLabel" style="color: red"></label>
                        </div>
                    </div>
                    <div class="col-lg-2 text-left"></div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Cancel</button>
                <button type="button" id="distPromptModalOkBtn" class="btn btn-success" data-dismiss="modal">Distribution</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal -->



<script>
    $('.createDistributionMenu').click(function () {
        $('#distributionPromptModal').modal('show');
    });

    $('#distPromptModalOkBtn').click(function(){
        var fileNo = $('#fileForDist').val();
        var fileForDistErrMsg = $('#fileForDistErrMsg');
        if(fileNo==""){
            makModalAlert('warning', "Attention", "Please insert file number first !");
        } else{
            $.ajax({
                url: '/brtc/brtc/checkDuplicateProject.buet',
                data: "fileNo="+fileNo,
                dataType: "json",
                success: function(data){
                    if(data.msg == "Yes"){
                        window.location = '/brtc/brtc/createDistribution.buet?fileNo='+fileNo;
                    }else{
                        makModalAlert('warning', "Attention", "No such file found !");
                    }
                }
            });
        }

    });
</script>