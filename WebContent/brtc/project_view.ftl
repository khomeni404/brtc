<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row" xmlns="http://www.w3.org/1999/html">
    <div class="col-lg-8">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/brtcProjectList.buet?findFor=all"> Project List</a>
            </li>
            <li>
                <i class="fa fa-list-alt"></i> ${PageTitle} Details
            </li>

        </ol>
    </div>
    <#if project??>
        <div class="col-lg-4 text-right">
            <ol class="breadcrumb">
                <li class="active">
                    <i class="fa fa-file-pdf-o"></i><a href="/brtc/report/projectFinance.buet?fileNo=${project.fileNo}">
                    Financial & Distribution</a>
                </li>
                <li class="active">
                    <i class="fa fa-file-pdf-o"></i><a href="/brtc/report/projectDetails.buet?fileNo=${project.fileNo}">
                    Project Details</a>
                </li>
            </ol>
        </div>
    </#if>
</div>

    <#if project??>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default" id="main-panel">
                <div class="panel-body" id="myPrintDiv">

                    <!--Head Col Project and Client-->
                    <div class="col-sm-12 ">

                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h2 class="panel-title fa-2x">File : ${project.fileNo}</h2>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 text-success" style="font-size: 20px">
                                    <div class="panel-body text-justify">
                                    ${project.projectTitle}
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="panel-body">
                                        Client : <#if project.client.name??> ${project.client.name}</#if><br/>
                                        Spokes Man : <#if project.client.spokesMan??>${project.client.spokesMan}</#if><br/>
                                        Spokes Man Cell : <#if project.client.spokesManCell??>${project.client.spokesManCell}</#if><br/>
                                        Address :<#if project.client.address??> ${project.client.address}</#if>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <!-- Status Col-->
                    <div class="col-sm-12">
                        <div class="row">
                        <#--Financial Status -->

                        <#include "project_view/project_view_financial_status.ftl"/>

                    <#--Progress Status -->
                        <#include "project_view/project_view_progress_status.ftl"/>

                    <#--Distribution Status -->
                        <#include "project_view/project_view_distribution_status.ftl"/>
                        </div>
                    </div>


                    <!-- Negotiate Team Col -->
                    <#include "project_view/project_view_negotiate_team.ftl"/>

                    <#if negotiateTeam??>
                        <!--Working Team Col -->
                        <#include "project_view/project_view_team.ftl"/>
                    </#if>


                </div>
                <!--#main-panel-->
            </div>
        </div>
    </div>

    <#--Adding Member Modal -->
        <#include "modals/team_member_add.ftl"/>

    <#--Adding Consultant Modal -->
        <#include "modals/consultant_add.ftl"/>

    <#--History Create Modal -->
        <#include "modals/project_history.ftl"/>

    <#--Financial Status View Modal -->
        <#include "modals/financial_status_view.ftl"/>



    <#else >
    <br/><br/><br/><br/><br/>
    <h1 class="text-danger text-center"><b>No such file number exists</b></h1>
    </#if>


<script type="text/javascript">
    Ext.onReady(function () {
        $("#fileNoForProjectSearch").focus();
    });
</script>




</@layout.my_app_layout>


