<div class="col-lg-12">
    <div class="panel panel-green">
        <div class="panel-heading">
            <h3 class="panel-title" onclick="$('#teamTable').show();">
            <#if team??>
                Working Team : [ID-${team.id}]
            <#else >
                Working Team:
            </#if>
            </h3>
        </div>

    <#if team??>
        <table id="teamTable" class=" table table-bordered table-hover table-striped"> <!--hideMe-->
            <thead>
            <tr>
                <th>Sl</th>
                <th>Member Name</th>
                <th>Member Type</th>
                <th>Join Date</th>
                <th>Active ?</th>
                <th>Leaving Date</th>
                <th>Note</th>
                <th class="text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <#assign x = 1>
                <#assign memberType = ['Team Leader', 'Member', 'Others']>
                <#list team.teamMemberList as teamMember>
                <#assign color =  teamMember.active?string("green", "red")>
                <#assign btnClass =  teamMember.active?string("btn-danger", "btn-success")>
                <tr style="color: ${color}">
                    <td>${x}</td>
                    <td>${teamMember.teamMember.token.userDetails.name}</td>
                    <td>${memberType[teamMember.memberType]}</td>
                    <td><#if teamMember.activeDate??>${teamMember.activeDate}<#else >---</#if></td>
                    <td>${teamMember.active?string("Active", "Inactive")}</td>
                    <td><#if teamMember.inactiveDate??>${teamMember.inactiveDate}<#else >---</#if></td>
                    <td>${teamMember.note}</td>
                    <td class="fa text-center">
                        &nbsp;&nbsp;
                        <button onclick="updateTeamMember(${teamMember.id}+',activateDeactivate');" class="btn btn-xs ${btnClass}"><i class="fa fa-power-off fa-1x"></i></button>
                        &nbsp;&nbsp;
                        <button onclick="deleteTeamMember(${teamMember.id});" class="btn btn-xs btn-danger"><i class="fa fa-times fa-1x"></i></button>
                    </td>
                </tr>
                    <#assign x = x + 1>
                </#list>
            <td colspan="8" class="text-right">
                <i class="fa fa-plus-square"></i>
                <a href="#" data-toggle="modal" data-target="#addMemberModal">Add Member</a>
            </td>
            </tr>
            </tbody>
        </table>
    <#else >
        &nbsp;&nbsp;&nbsp;&nbsp;
        No team Formed yet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <i class="fa fa-plus-square"></i><a
            href="/brtc/brtc/createTeam.buet?projectId=${project.id}">
        Create Team</a>
    </#if>

    </div>
</div>

<script type="text/javascript">
    function deleteTeamMember(id){
        $.ajax({
            url: '/brtc/brtc/deleteTeamMember.buet',
            data: "id="+id,
            dataType: "json",
            success: function(data){
                if(data.success == "false"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    window.location.href = '/brtc/brtc/viewBrtcProject.buet?fileNo=${project.fileNo}';
                }
            }
        });
    }

    function updateTeamMember(array){
        //alert(array); return false;
        $.ajax({
            url: '/brtc/brtc/updateTeamMember.buet',
            data: {
                array : array
            },
            dataType: "json",
            success: function(data){
                if(data.success == "false"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    window.location.href = '/brtc/brtc/viewBrtcProject.buet?fileNo=${project.fileNo}';
                }
            }
        });
    }
</script>