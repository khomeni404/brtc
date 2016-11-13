<#import "../../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >

<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-home"></i><a href="/brtc/report/reportHome.buet"> Report Home</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Teacher List & Projects
            </li>

        </ol>
    </div>
</div>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default" id="main-panel">
            <div class="panel-body" id="myPrintDiv">

                <!--Head Col Project and Client-->
                <div class="col-sm-12 ">

                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">
                            <h2 class="panel-title fa-2x">Consultant & Consulted Project Status</h2>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 text-success" style="font-size: 20px">
                                <div class="panel-body text-justify">
                                ${Department}
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="panel-body">
                                    Data From :     <br>
                                    Date To :
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <!--Box div-->
                <div class="col-lg-12">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-lg-6 text-left">
                                    Teacher List
                                </div>

                                <div class="col-lg-6 text-right">
                                    <input type="button" class="btn-info" value="Download Report" onClick="parent.location='/brtc/report/teachersProject.buet?deptId=${DeptId}'"/>

                                </div>
                            </div>
                        </div>
                        <table id="teamTable" class=" table table-bordered table-hover table-striped"> <!--hideMe-->
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Designation</th>
                                <th>Projects</th>
                                <th>Negotiating</th>
                                <th>Running</th>
                                <th>Completed</th>
                                <th>Others</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list dataList as data>
                                <tr>
                                    <td>${data.Name}</td>
                                    <td>${data.Designation}</td>
                                    <td>${data.Projects}</td>
                                    <td>${data.Negotiating}</td>
                                    <td>${data.Running}</td>
                                    <td>${data.Completed}</td>
                                    <td>${data.Others}</td>
                                </tr>

                                </#list>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!--Box div End-->
            </div>
            <!--#main-panel-->
        </div>
    </div>
</div>


</@layout.my_app_layout>


