<#--Adding Member Modal -->
<div class="modal fade" id="addMemberModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <form name="addMemberForm" id="addMemberForm" action="saveTeamMember.buet" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Adding Team Member </h4>
                </div>
                <div class="modal-body" id="teamModal">
                    <div class="row">
                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" id="" type="text"
                                       value="${project.fileNo}" disabled/>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Team Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                            <#if team??>
                                <input class="form-control" type="text"
                                       value="${team.id}"
                                       disabled/>
                                <input type="hidden" id="teamId" name="teamId" value="${team.id}"/>
                            </#if>

                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Member Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="memberId" id="memberId">
                                    <option value="null">--Select a name--</option>
                                <#if userList??>
                                    <#list userList as teamMember>
                                        <#if teamMember.userType != "admin" &&  teamMember.token.userDetails??>
                                            <option value="${teamMember.authorizeId}">${teamMember.token.userDetails.name}</option>
                                        </#if>
                                    </#list>
                                </#if>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Member Type:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="memberTypeIndex" id="memberTypeIndex">
                                    <option value="null">--Select a type--</option>
                                    <option value="0">Team Leader</option>
                                    <option value="1">Member</option>
                                    <option value="2">Others</option>
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
                    <button type="button" id="saveTeamMember" class="btn btn-success">Save Member</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $('#saveTeamMember').click(function () {
        var teamId = document.getElementById("teamId").value;
        var memberId = document.getElementById("memberId").value;
        //alert(teamId+", "+memberId);
        var memberTypeIndex = document.getElementById("memberTypeIndex").value;
        if (memberId == "null" || memberTypeIndex == "null") {
            $('#addMemberModal').modal('hide');
            makModalAlert('warning', 'Attention !', 'You must select a MEMBER and a TYPE');
            return false;
        }

        $.ajax({
            url: '/brtc/brtc/checkDuplicateTeamMember.buet',
            data: "teamId=" + teamId + "&memberId=" + memberId,
            dataType: "json",
            success: function (data) {
                if (data.msg == "Yes") {
                    $('#addMemberModal').modal('hide');
                    makModalAlert('danger', 'Sorry', "<b style='color: red'>"+data.memberName+"</b> already EXISTS in this team as <b style='color: green'>"+data.memberType+"</b>");
                } else {
                    document.addMemberForm.submit();
                }
            }
        })
    });

</script>

