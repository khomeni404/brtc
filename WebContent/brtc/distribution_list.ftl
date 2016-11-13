<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->

<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square"></i><a id="createDistribution" href="#"> Create
                Distribution</a>
            </li>
            <li>
                <i class="fa fa-list"></i> Distribution List
            </li>
        </ol>
    </div>
    <script>
        $('#createDistribution').click(function () {
            $('#distributionPromptModal').modal('show');
        });
    </script>

</div>

<div class="row" id="firstRow">
    <div class="col-lg-9 text-center">
        <h3 class="text-left text-primary">
            Distribution List
        </h3>
    </div>
    <div class="col-lg-3 text-center">
        <form name="distSearchForm" role="form" id="distSearchForm" action="distributionList.buet" method="GET">
            <script>
                function submitForm() {
                    document.distSearchForm.submit();
                }
            </script>
            <div class="form-group input-group">
                <input type="text" name="fileNo" id="distributionSearchId" class="form-control"
                       placeholder="File No. / All">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <#if  distList??>
                <table class="table table-bordered table-hover table-striped <#--pagination-table-->">
                    <thead>
                    <tr>
                        <th>File No</th>
                        <th>Distribution Date</th>
                        <th>BRTC No.</th>
                        <th class="amount">Total Amount</th>
                        <th class="amount">Consultant Fees</th>
                        <th>Consultants</th>
                        <th class="amount">Dept Advances</th>
                        <th class="amount">Others</th>

                    </tr>
                    </thead>
                    <tbody>
                        <#list distList as distribution>
                        <tr>
                            <td>
                                <a href="/brtc/brtc/viewBrtcProject.buet?fileNo=<#if distribution.project??>${distribution.project.fileNo}</#if>">
                                    <#if distribution.project??>${distribution.project.fileNo}</#if>
                                </a>
                            </td>
                            <td><#if distribution.distributionDate??>${distribution.distributionDate}</#if></td>
                            <td><#if distribution.brtcNos??>${distribution.brtcNos}</#if></td>
                            <td class="amount"><#if distribution.totalAmount??>${distribution.totalAmount}</#if></td>
                            <td class="amount">
                                <#if distribution.consultantFees??>${distribution.consultantFees}</#if>
                            </td>
                            <td>
                                <#assign x = 1>
                                <#list distribution.receiverList as receiver>
                                ${x}. ${receiver.sanctionFor.token.userDetails.name} (${receiver.amount} /=)<br/>
                                    <#assign x = x + 1>
                                </#list>
                            </td>
                            <td class="amount"><#if distribution.advances??>${distribution.advances}</#if></td>
                            <td class="amount"><#if distribution.others??>${distribution.others}</#if></td>
                        </tr>
                        </#list>

                    </tbody>
                </table>
                <style>
                    .amount {
                        text-align: right;
                        padding-right: 80px;
                        font-weight: bolder;
                    }

                </style>
            <#else >
                <h1 class="text-danger"> No Distribution found</h1>
            </#if>
        </div>
    </div>
<#--
    <div class="col-lg-12" style="background-color: #c7c7c7;">
        <div class="row">
            <div class="col-lg-6 text-left">
                <div class="displaying-div"></div>
            </div>
            <div class="col-lg-6 text-right paging-div"></div>
        </div>
    </div>-->
</div>

<!--End First Row -->
<script>
    $(document).ready(function () {
        $('#distributionSearchId').focus();
    });
</script>


</@layout.my_app_layout>


