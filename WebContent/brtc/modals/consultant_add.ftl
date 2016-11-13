<#--Adding Member Modal -->

<div class="modal fade" id="addConsultantModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
     aria-hidden="true">
    <form name="addConsultantForm" id="addConsultantForm" action="saveConsultant.buet" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Adding Consultant </h4>
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
                            Nego. Team Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <#if negotiateTeam??>
                                    <input class="form-control" type="text"
                                           value="${negotiateTeam.id}"
                                           disabled/>
                                    <input type="hidden" id="negoTeamId" name="negoTeamId" value="${negotiateTeam.id}"/>
                                </#if>

                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Consultant Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="consultantId" id="consultantId">
                                    <option value="null">--Select a name--</option>
                                <#if userList??>
                                    <#list userList as consultant>
                                        <#if consultant.userType != "admin" &&  consultant.token.userDetails??>
                                            <option value="${consultant.authorizeId}">${consultant.token.userDetails.name}</option>
                                        </#if>
                                    </#list>
                                </#if>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Consultant Type:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="consultantTypeIndex" id="consultantTypeIndex">
                                    <option value="null">--Select a type--</option>
                                    <option value="0">Team Leader</option>
                                    <option value="1">Member</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Note (If any):
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="notes" id="notes" class="form-control"
                                          rows="3">---</textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Discard</button>
                    <button type="button" onclick="createConsultant();" class="btn btn-success">Save</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    function createConsultant(){
        var negoTeamId = document.getElementById("negoTeamId").value;
        var consultantId = document.getElementById("consultantId").value;
        var consultantTypeIndex = document.getElementById("consultantTypeIndex").value;
        if(consultantId == "null" || consultantTypeIndex == "null"){
            $('#addConsultantModal').modal('hide');
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !") ;
            $('#alert-warning-body').html("You must select a MEMBER and a TYPE") ;
            return false;
        }

        $.ajax({
            url: '/brtc/brtc/checkDuplicateConsultant.buet',
            data: "negoTeamId="+negoTeamId+"&consultantId="+consultantId,
            dataType: "json",
            success: function(data){
                if(data.msg == "Yes"){
                    $('#addConsultantModal').modal('hide');
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Sorry") ;
                    $('#alert-danger-body').html("<b style='color: red'>"+data.memberName+"</b> already EXISTS in this team as <b style='color: green'>"+data.memberType+"</b>") ;
                    return false;
                }else{
                    document.addConsultantForm.submit();
                }
            }
        });
    }
</script>
