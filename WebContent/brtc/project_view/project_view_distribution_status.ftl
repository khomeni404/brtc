<div class="col-lg-4 col-md-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-2">
                    <i class="fa fa-clock-o fa-4x"></i>
                </div>

                <div class="col-xs-10 text-justify mak-min-height-5">
                    <div>Distribution Status</div>
                <#assign dist = ['No distribution', 'Partial distributed', 'Full distributed', 'Others']>
                <#if distributionStatus??>
                    <div class="text-success fa-lg"><strong> ${dist[project.projectStatus.distributionStatus]}</strong></div>

                    <div class="progress-wrap progress" data-progress-percent="${(distributionStatus.percent)}">
                        <div class="progress-bar progress" style="color: #000000">
                            ${(distributionStatus.percent)?string("#,##0")}%
                        </div>
                    </div>
                    <br/>
                    <table class="finSt">
                        <tr>
                            <td>Received Total</td>
                            <td>:</td>
                            <td class="amount">${distributionStatus.totalReceived}/=</td>
                        </tr>

                        <tr>
                            <td>Distributed</td>
                            <td>:</td>
                            <td class="amount">${distributionStatus.distributed} by ${distributionStatus.distributions}</td>
                        </tr>
                        <tr>
                            <td>Available</td>
                            <td>:</td>
                            <td class="amount">${distributionStatus.totalReceived-distributionStatus.distributed}/=</td>
                        </tr>
                    </table>
                </#if>
                    <style>
                        .finSt td {
                            padding: 2px 18px 2px 0px
                        }

                        .finSt tr {
                            border-bottom: 2px solid #000000;
                            padding-bottom: 5px
                        }

                        .amount {
                            padding-right: 0px;
                            text-align: right;
                            font-weight: bold
                        }
                    </style>
                </div>
            </div>
        </div>

        <div class="panel-footer text-justify">
            <span class="pull-left">
                <a href="#" data-toggle="modal" data-target="#distributionStatusUpdateModal">
                    <i class="fa fa-arrow-circle-o-up"></i> Update Status
                </a>
            <#--Progress Status Update Modal -->
            <#include "../modals/progress_status_update.ftl"/>
            </span> &nbsp;&nbsp;
            <span class="text-centre">
                <a href="/brtc/brtc/createDistribution.buet?fileNo=${project.fileNo}">
                    <i class="fa fa-plus-square"></i> Add Dist.
                </a>
            </span>

            <span class="pull-right">
                <a href="distributionList.buet?fileNo=${project.fileNo}" >
                    Distributions <i class="fa fa-arrow-circle-right"></i>
                </a>
            </span>
        </div>
    </div>
</div>

<#--Distribution Status Update Modal -->
<#include "../modals/distribution_status_update.ftl"/>