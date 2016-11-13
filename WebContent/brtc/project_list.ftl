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
                <i class="fa fa-plus-square "></i><a href="/brtc/brtc/createBrtcProject.buet"> Create Project</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List
            </li>

        </ol>
    </div>
    <div class="col-lg-2 text-right" >
        <ol class="breadcrumb">
        <i class="fa fa-file-pdf-o"></i><a href="#" onclick="projectListPdf();"> PDF</a> &nbsp;&nbsp;&nbsp;&nbsp;
        <i class="fa fa-file-excel-o"></i><a href="#" onclick="projectListExcel();"> Excel</a>
        </ol>
    </div>
</div>


<div class="row" id="firstRow">
    <div class="col-lg-4 text-left">
        <strong style="font-size: 25px">Project List</strong>
    </div>
    <div class="col-lg-2 text-center">
        <div class="form-group">
            <div class="form-group has-success">
                <select name="findForFinancialOption" id="findForFinancialOption" class="form-control">
                    <option value="">-- Financial Status --</option>
                    <option value="FSOption0">No Deposit</option>
                    <option value="FSOption1">Partially Deposited</option>
                    <option value="FSOption2">Fully Deposited</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
            $('#findForFinancialOption').on('change', function () {
                var status = this.value;
                window.location = "brtcProjectList.buet?findFor=" + status;
            });
        </script>
    </div>
    <div class="col-lg-2 text-center">
        <div class="form-group">
            <div class="form-group has-success">
                <select name="findForDistributionOption" id="findForDistributionOption" class="form-control">
                    <option value="">-- Distribution Status --</option>
                    <option value="DSOption0">No distribution</option>
                    <option value="DSOption1">Partial distributed</option>
                    <option value="DSOption2">Full distributed</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
            $('#findForDistributionOption').on('change', function () {
                var status = this.value;
                window.location = "brtcProjectList.buet?findFor=" + status;
            });
        </script>
    </div>
    <div class="col-lg-2 text-center">
        <div class="form-group">
            <div class="form-group has-success">
                <select name="findForProgressOption" id="findForProgressOption" class="form-control">
                    <option value="">--Progress Status--</option>
                    <option value="PSOption0">Not Assigned</option>
                    <option value="PSOption1">Assigned</option>
                    <option value="PSOption2">No Response</option>
                    <option value="PSOption3">Negotiating</option>
                    <option value="PSOption4">Negotiation Failed</option>
                    <option value="PSOption5">Running</option>
                    <option value="PSOption6">Stopped</option>
                    <option value="PSOption7">Completed</option>
                    <option value="PSOption8">Others</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
            $('#findForProgressOption').on('change', function () {
                var status = this.value;
                window.location = "brtcProjectList.buet?findFor=" + status;
            });
        </script>
    </div>

    <div class="col-lg-2 text-center">
        <form name="searchForm" role="form" id="searchForm" action="brtcProjectList.buet" method="GET">
            <input type="hidden" value="${searchText}" id="searchText"/>
            <script>
                $(document).ready(function () {
                    var text = $('#searchText').val();
                    $('#firstRow').highlight(text + "");
                    $("#findForProject").attr("placeholder", text);
                    $('#findForProject').focus();
                });
            </script>

            <div class="form-group input-group">
                <input type="text" name="findFor" id="findForProject" class="form-control"
                       placeholder="Query for / key">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="$(this).submit();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center" style="min-height: 450px">
        <div class="table-responsive">
            <table id="projectListTable" class="table table-bordered table-hover table-striped pagination-table">
                <thead>
                <tr>
                    <th class="text-center">Actions</th>
                    <th>File No</th>
                    <th>Project Title</th>
                    <th class="text-center">Fees</th>
                    <th>Is Active</th>
                    <th>Progress Status</th>
                </tr>
                </thead>
                <tbody>
                    <#assign progressStatus = ['Not Assigned', 'Assigned', 'No Response', 'Negotiating', 'Negotiation Failed', 'Running', 'Stopped', 'Completed', 'Others']>
                    <#assign financialStatus = ['No Deposit', 'Partially Deposited', 'Fully Deposited']>
                    <#assign distributionStatus = ['No distribution', 'Partial distributed', 'Full distributed']>
                    <#list projectList as project>
                    <tr style="color:<#if project.active?string == "false">red</#if>">
                        <td class="text-center" style="width: 160px">
                            <button type="button" class="fa fa-list-alt viewProject"  title="View Project"
                                    fileNo="${project.fileNo}"></button>
                            <button type="button" class="fa fa-pencil editProject" title="Edit Project" projectId="${project.id}"></button>
                            <button type="button" class="fa fa-times text-danger deleteProject"  title="Delete Project"
                                    fileNo="${project.fileNo}"></button>
                            <button type="button" class="fa fa-money text-danger createDistribution"  title="New Distribution"
                                    fileNo="${project.fileNo}"></button>
                        </td>
                        <td class="col-md-1">${project.fileNo}</td>
                        <td class="col-md-4">${project.projectTitle}</td>

                        <td class="text-right col-md-1">
                            <b>${project.finalFee}</b>
                        </td>

                        <td class="text-center">
                            <#if project.active?string == "true">Active<#else >Inactive</#if>
                        </td>

                        <td>${progressStatus[project.projectStatus.progressStatus]}
                            | ${financialStatus[project.projectStatus.financialStatus]}
                            | ${distributionStatus[project.projectStatus.distributionStatus]}</td>

                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>

    </div>
    <div class="col-lg-12" style="background-color: #c7c7c7;">
        <div class="row">
            <div class="col-lg-6 text-left">
                <div class="displaying-div"></div>
            </div>
            <div class="col-lg-6 text-right paging-div"></div>
        </div>
    </div>
</div>

<!--End First Row -->
<script type="text/javascript">
    jQuery(function ($) {
        var items = $(".pagination-table tbody tr");
        var pagingDiv = ".paging-div";
        var pagingUl = pagingDiv + " ul";      //instead of $('#departmentPaging ul')

        var numItems = items.length;
        var perPage = 5;
        items.slice(perPage).hide();
        $(pagingDiv).pagination({
            items: numItems,
            itemsOnPage: perPage,
            onPageClick: function (pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
                $(pagingUl).prop('class', 'pagination');   //bootstrap css for pagination
                $('.displaying-div').html("Displaying " + (showFrom + 1) + "-" + (showTo <= numItems ? showTo : numItems) + " out of " + numItems);
            }
        });
        $(pagingUl).prop('class', 'pagination');    //bootstrap css for pagination
        $('.displaying-div').html("Displaying 1-" + (perPage <= numItems ? perPage : numItems) + " out of " + numItems);
    });

    $('.viewProject').click(function () {
        var fileNo = $(this).attr('fileNo');
        window.location.href = '/brtc/brtc/viewBrtcProject.buet?fileNo=' + fileNo;
    });

    $('.editProject').click(function () {
        var id = $(this).attr('projectId');
        window.location.href = '/brtc/brtc/editBrtcProject.buet?id=' + id;
    });

    $('.createDistribution').click(function () {
        var fileNo = $(this).attr('fileNo');
        window.location.href = '/brtc/brtc/createDistribution.buet?fileNo=' + fileNo;
    });

    $('.deleteProject').click(function () {
        var fileNo = $(this).attr('fileNo');
        $.ajax({
            url: '/brtc/brtc/deleteBrtcProject.buet',
            data: "fileNo=" + fileNo,
            dataType: "json",
            success: function (data) {
                if (data.success == "false") {
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Project <b>" + fileNo + "</b> can't be deleted !");
                    $('#alert-danger-body').html(data.msg + "<br/>" + data.teamLeader);
                } else {
                    $('#alertModal-success').modal('show');
                    $('#alert-success-title').html("Yes !");
                    $('#alert-success-body').html("Project has been deleted successfully.");
                    //$.growl.notice({title: "Yes !", message: "Client has been deleted successfully." });
                    setTimeout(function () {
                        window.location.href = '/brtc/brtc/brtcProjectList.buet?findFor=all';
                    }, 3000);

                }
            }
        });
    });

    function projectListPdf() {
        window.location = '/brtc/report/projectList.buet?deptId=1';
    }

    function projectListExcel() {
        makModalAlert('warning', "File Download", "Downloading...... <br/>Please wait.");
        setTimeout(function () {
            hideMakModalAlert('warning');
            makModalAlert('success', "Download Completed ! ", "Please check Drive D:\\ for downloaded excel file. Named \"projectList.xls\"");
        }, 5000);

        $.ajax({
            url: '/brtc/report/projectListExcel.buet',
            //data: "fileNo=" + fileNo,
            dataType: "json",
            success: function (data) {
                if (data.success == "true") {
                    makModalAlert('show', 'Yes', data.msg)
                } else {
                    makModalAlert('show', 'Sorry', data.msg)
                }
            }
        });
    }

</script>
</@layout.my_app_layout>


