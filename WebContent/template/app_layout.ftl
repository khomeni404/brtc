<#macro app_layout title="">
<html>
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <#include "stylesheets.ftl"/>
    <#include "scripts.ftl"/>
</head>
<body>
<div id="wrapper">
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->

    <#include "header.ftl"/>
    <!-- Top Menu Items -->

    <#include "top_menu.ftl"/>
    <!-- Left Menue -->
    <#include "menu.ftl"/>
    <!-- /.navbar-collapse -->
</nav>

<div id="page-wrapper">

<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-6">
        <h3 class="page-header">
            Project Statistics
            <small> Overview</small>
        </h3>
    </div>
    <div class="col-lg-6  text-right">
       <#--<img class="img-thumbnail" src="resources/images/logo/logo_admin.png" alt="">-->
    </div>
</div>


<div class="row">
    <div class="col-lg-4"  style="height: 90%;">
        <div class="panel panel-default"  style="height: 90%;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-angle-double-right fa-lg"></i> Welcome to BRTC, BUET</h3>
            </div>
            <div class="panel-body">
                <div class="text-justify">
                    As a center of excellence, BUET is not only continuing as the focal point for the development and dissemination of engineering and technological know-how within the country, but also it is involved to solve complicated practical problems of national importance faced by the planners, engineers and technologists of the country. The university being the home of highly trained man power, expert services are given through this bureau, causing a fourfold enrichment – enrichment of the nation from the expert services, enrichment of the university, enrichment of the staff and enriched teaching and research from the knowledge acquired through The Bureau of Research, Testing and Consultation. BRTC undertakes research, testing and consultation works in the field of engineering, architecture and planning as entrusted to them by private parties and by government and autonomous bodies in order to achieve following objectives:
                </div>
                <div class="text-right">
                    <a href="http://www.buet.ac.bd/?page_id=71" target="_blank">View Details <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4"  style="height: 90%;">
        <div class="panel panel-default"  style="height: 90%;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-spinner fa-spin fa-lg"></i> Activity Panel : Last five activities</h3>
            </div>
            <div class="panel-body" >
                <div class="list-group" >
                    <#list activityDataList as activity>
                        <a href="/brtc/brtc/projectHistoryList.buet?fileNo=${activity.file}" class="list-group-item">

                            [ <label style="color: blue; font-weight: bolder"> File  ${activity.file}  </label>  ] <label class="badge badge-info">${activity.time}</label>
                            <br/>${activity.note}
                        </a>
                    </#list>

                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4"  style="height: 90%;">
        <div class="panel panel-default" style="height: 90%;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-gear fa-spin fa-lg"></i> Running Projects</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>File No.</th>
                            <th>Received</th>
                            <th>Distributed</th>
                            <th>Rest</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list projectDataList as data>
                            <tr>
                                <td>
                                    <a href="/brtc/brtc/viewBrtcProject.buet?fileNo=${data.fileNo}">
                                    ${data.fileNo} <#--<span class="blink"><#if data.exists?string == "true">*<#else >-</#if></span>-->
                                    </a>
                                </td>
                                <td class="text-right">${data.received}</td>
                                <td class="text-right">${data.distributed}</td>
                                <#assign rest = data.received-data.distributed>
                                <td class="text-right">${rest}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <a href="/brtc/brtc/brtcProjectList.buet?findFor=PSOption5">View all running project  <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.row -->

</div>
<!-- /.container-fluid -->


</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>
</html>
</#macro>