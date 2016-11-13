<#--Adding Member Modal -->
<form name="dataForm" id="dataForm" action="updateProjectStatus.buet" method="GET">
    <div class="modal fade" id="distributionStatusUpdateModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Updating Distribution Status </h4>
                </div>
                <div class="modal-body" id="teamModal" style="color:white; background-color: #929292">
                    <div class="row">
                        <div class="col-lg-3 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${project.fileNo}" disabled/>
                            </div>
                        </div>

                    <#--Hidden -->
                        <input name="fileNo" type="hidden" value="${project.fileNo}"/>
                        <input name="statusId" type="hidden" value="${project.projectStatus.id}"/>
                        <input name="type" type="hidden" value="distribution"/>


                        <div class="col-lg-3 text-left">
                            Current Status:
                        </div>
                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${dist[project.projectStatus.distributionStatus]}" disabled/>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            New Status:
                        </div>

                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <select class="form-control" name="statusIndex">
                                    <option value="-1">--Select a Distribution Status--</option>
                                    <option value="0">No distribution</option>
                                    <option value="1">Partial distributed</option>
                                    <option value="2">Full distributed</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Update</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Discard</button>
                </div>
            </div>
        </div>
    </div>
</form>