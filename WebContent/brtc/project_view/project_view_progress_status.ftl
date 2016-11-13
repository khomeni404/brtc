<div class="col-lg-4 col-md-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-2">
                    <i class="fa fa-cog <#if project.projectStatus.progressStatus==5> fa-spin</#if> fa-4x"></i>
                </div>
                <div class="col-xs-10 text-justify mak-min-height-5">
                    <div>Progress Status</div>
                    <#assign progress = ['Not Assigned', 'Assigned', 'No Response', 'Negotiating', 'Negotiation Failed', 'Running', 'Stopped', 'Completed', 'Others']>
                    <div class="text-success fa-lg">
                        <#if project.projectStatus??>
                            <strong> ${progress[project.projectStatus.progressStatus]}</strong>
                        </#if>
                    </div>
                    <hr/>
                    <div>
                    <#if lastHistory??>
                        <div class="text-justify">
                        ${lastHistory.note}
                        </div>
                        <div class="text-right">
                            [ ${lastHistory.createdBy.token.userDetails.name}    ]
                        </div>
                    </#if>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-footer text-justify">
            <span class="pull-left">
                <a href="#" data-toggle="modal" onclick="checkBothStatus()">
                    <i class="fa fa-arrow-circle-o-up"></i> Update Status
                </a>
            <#--Progress Status Update Modal -->
            <#include "../modals/progress_status_update.ftl"/>
            </span> &nbsp;&nbsp;
            <span class="text-centre">
                <a href="#" data-toggle="modal" data-target="#projectHistoryCreateModal">
                    <i class="fa fa-plus-square"></i> Add History
                </a>
            </span>

            <span class="pull-right">
                <a href="projectHistoryList.buet?fileNo=${project.fileNo}" >
                    View History <i class="fa fa-arrow-circle-right"></i>
                </a>
            </span>
        </div>
    </div>
</div>
