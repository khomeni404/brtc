<#--Adding Member Modal -->
<form name="dataForm" id="dataForm" action="updateProjectStatus.buet" method="GET">
    <div class="modal fade" id="progressStatusUpdateModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Updating Progress Status </h4>
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

                    <#--Hidden -->
                        <input name="fileNo" type="hidden" value="${project.fileNo}"/>
                        <input name="statusId" type="hidden" value="${project.projectStatus.id}"/>
                        <input name="type" type="hidden" value="progress"/>


                        <div class="col-lg-4 text-left">
                            Current Status:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text" id="currentStatus"
                                       value="${progress[project.projectStatus.progressStatus]}" disabled/>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            New Status:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control statusIndex" id="statusIndex" name="statusIndex">
                                    <option value="0">--Select a Status--</option>
                                    <option value="2">No Response</option>
                                    <option value="3">Negotiating</option>
                                    <option value="4">Negotiation Failed</option>
                                    <option value="5">Running</option>
                                    <option value="6">Stopped</option>
                                    <option value="7">Completed</option>
                                    <option value="8">Others</option>
                                    <option value="0">Not Assigned</option>
                                    <option value="1">Assigned</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Discard</button>
                </div>
            </div>
        </div>
    </div>
</form>

<#include "../modals/set_final_fee_modal.ftl"/>


<script type="text/javascript">
    $(".statusIndex").change(function () {
        if ($("#statusIndex").val() == 5 && $("#currentStatus").val() != "Running") {
            $("#addFinalFeeModal").modal("show");
            $("#progressStatusUpdateModal").modal("hide");
        }
    });

    function checkBothStatus() {
        if ($("#statusIndex").val() == 5 && $("#currentStatus").val() != "Running") {
            $("#addFinalFeeModal").modal("show");
        } else {
            $("#progressStatusUpdateModal").modal("show");
        }
    }
</script>