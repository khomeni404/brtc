<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-reply"></i><a href="viewBrtcProject.buet?id=${team.project.id}"> Project</a>
            </li>
            <li>
                <i class="fa fa-list-alt"></i> ${PageTitle} Details
            </li>

        </ol>
    </div>
</div>
<div class="row">Thi is new team ${team.id}</div>
<#--
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default" id="main-panel">
            <div class="panel-body">

                <div class="col-lg-12">
                    <h2 class="text-center">Project : ${project.fileNo}</h2>
                </div>

                <div class="col-lg-6">
                    <strong>Project Title:</strong> ${project.projectTitle}
                    <br/>
                    <strong>Client :</strong> ${project.client.name}, Address: goes here...
                </div>
                <div class="col-lg-6">
                    Project Statuses.....goes here...
                </div>

                <div class="col-lg-12">
                    <div class="panel">
                        <div class="panel-body">
                            <#if team??>
                                <div class="panel-title">Team</div>
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>File No</th>
                                        <th>Project Title</th>
                                        <th class="text-center">Fees</th>
                                        <th>Is Active</th>
                                        <th>Status</th>
                                        <th>Team</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            <#else >
                                <h3>Team : </h3> No team Formed yet  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <i class="fa fa-plus-square"></i><a href="/brtc/brtc/brtcProjectList.buet"> Create Team</a>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            <!--#main-panel-->
        </div>
    </div>
</div>
-->
<!--End First Row -->




</@layout.my_app_layout>


