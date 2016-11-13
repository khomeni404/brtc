<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->


<div class="row">
    <div class="col-lg-10">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/brtcProjectList.buet?findFor=all"> Project List</a>
            </li>
            <#if fileNo != "ALL">
                <li>
                    <i class="fa fa-plus-square "></i><a href="/brtc/brtc/viewBrtcProject.buet?fileNo=${fileNo}">
                    Project</a>
                </li>
            </#if>
            <#if project??>
                <li class="active" id="addNewHistory">
                    <i class="fa fa-plus-square"></i><a href="#"> New History</a>
                </li>
            </#if>
            <li class="active">
                <i class="fa fa-list"></i> ${PageTitle}
            </li>

        </ol>
    </div>
    <#if fileNo != "ALL" && project??>
        <div class="col-lg-2">
            <ol class="breadcrumb">
                <li>
                    <i class="fa fa-file-pdf-o fa-1x "></i><a
                        href="/brtc/report/projectHistory.buet?fileNo=${fileNo}">
                    Download PDF</a>
                </li>
            </ol>
        </div>
    </#if>
</div>

<div class="row" id="firstRow">
    <div class="col-lg-10 text-left">
        <strong style="font-size: 25px; color: #ff7217">Project History <#if fileNo == "ALL" || project??>
            of ${fileNo}</#if></strong>
    </div>

    <div class="col-lg-2 text-center">
        <form name="searchForm" role="form" id="searchForm" action="projectHistoryList.buet" method="GET">
            <script>
                function submitForm() {
                    document.searchForm.submit();
                }
                Ext.onReady(function () {
                    $("#fileNumber").focus();
                });
            </script>
            <div class="form-group input-group">
                <input type="text" name="fileNo" id="fileNumber" class="form-control" placeholder="File No.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th>Sl.</th>
                    <th>Record Date</th>
                    <th>Before (Min ago)</th>
                    <th class="text-justify">Note</th>
                    <th>Created By</th>
                </tr>
                </thead>
                <tbody>
                    <#if historyList??>
                        <#assign x = 1>
                        <#list historyList as history>
                            <#if x<=105>
                            <tr>
                                <td class="col-md-1">${x}</td>
                                <td class="col-md-2">${history.recordDate}</td>
                                <td class="col-md-2">${history.before}</td>
                                <td class="col-md-4">${history.note}</td>
                                <td class="col-md-3">${history.createdBy}</td>

                            </tr>
                            </#if>
                            <#assign x = x+1>
                        </#list>
                    <#else >
                    <tr>
                        <td colspan="5">
                            <#if project??>
                                No History found for this search.
                            <#else >
                                NO FILE exists by this number "<b style="color: red;">${fileNo}</b>"
                            </#if>
                        </td>
                    </tr>
                    </#if>


                </tbody>
            </table>
        </div>

    </div>
</div>

<!--End First Row -->

<script>
    $('#addNewHistory').click(function () {
        $('#projectHistoryCreateModal').modal('show')
    });
</script>



<#--Add History Modal -->
<form name="projectHistoryDataForm" id="projectHistoryDataForm" action="saveProjectHistory.buet" method="POST">
    <div class="modal fade" id="projectHistoryCreateModal" tabindex="-1" role="dialog" aria-labelledby="basicModal"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> New Project History </h4>
                </div>
                <div class="modal-body" id="teamModal">
                    <div class="row">
                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${fileNo}" disabled/>
                            </div>
                        </div>
                        <input type="hidden" name="fileNo" value="${fileNo}"/>

                        <div class="col-lg-4 text-left">
                            Note / History :
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="historyNote" id="historyNote" class="form-control"
                                          rows="3"></textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Discard</button>
                    <button type="button" id="saveProjectHistory" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    $('#saveProjectHistory').click(function () {
        var note = $('#historyNote').val();
        if (note == "") {
            makModalAlert('warning', 'Attention !', "Please type note/history.")
        } else {
            document.projectHistoryDataForm.submit();
        }
    });
</script>



</@layout.my_app_layout>