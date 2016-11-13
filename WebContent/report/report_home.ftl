<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body" style="margin: 0 10 0 10">
                <div class="row">
                    <h3 class="text-left text-success">Report Home</h3>
                </div>
                <div class="row" id="project_list">
                    <#include "/report/projects/project_list_overview.ftl"/>
                </div>

                <div class="row">
                    <#include "/report/teacher/consultants_overview.ftl"/>
                </div>
                <div class="row">
                    <#include "/report/project/project_overview.ftl"/>
                </div>
                <div class="row">
                    <#--<#include "/report/financial_statement.ftl"/>-->
                </div>
            </div>
        </div>
    </div>
</div>

</@layout.my_app_layout>
