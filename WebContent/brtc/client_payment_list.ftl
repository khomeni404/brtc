<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->

    <#assign statusArray = ['PA Submitted', 'Encashed', 'Checked', 'All']/>


<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square"></i><a href="/brtc/brtc/createClientPayment.buet?for=new">
                Create ${PageTitle}</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List (${statusArray[status]})
            </li>
        </ol>
    </div>

</div>

<div class="row" id="firstRow">
    <div class="col-lg-6 text-center">
        <#if  paymentList??>
            <h3 class="text-left text-primary">
            ${PageTitle} List ( ${statusArray[status]} )
            </h3>
        </#if>
    </div>
    <div class="col-lg-3 text-center">
        <div class="form-group">
            <div class="form-group has-success">
                <select name="findForOption" id="findForOption" class="form-control">
                    <option value="-1">--Select Status--</option>
                    <option value="0">PA Submitted</option>
                    <option value="1">Encashed</option>
                    <option value="2">Checked</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
            $('#findForOption').on('change', function () {
                var status = this.value;
                window.location = "clientPaymentList.buet?findFor=all&status=" + status;
            });
        </script>
    </div>
    <div class="col-lg-3 text-center">
        <form role="form" action="clientPaymentList.buet" method="GET">
            <input type="hidden" name="status" id="status" value="3"/>
            <input type="hidden" name="searchText" id="searchText" value="${findFor}"/>
            <script>
                function focusAndHighlight(){
                    var ff =  $('#findFor');
                    var text = $('#searchText').val();
                    $('.brtcColl').highlight(text + "");
                    ff.attr("placeholder", text);
                    ff.focus();
                }
            </script>
            <div class="form-group input-group">
                <input type="text" name="findFor" id="findFor" class="form-control" placeholder="BRTC No.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="this.submit();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <#if  paymentList??>
                <table class="table table-bordered table-hover table-striped pagination-table">
                    <thead>
                    <tr>
                        <#if status == 1>
                            <th class="text-center">Checked</th>
                        </#if>
                        <#if status == 2>
                        </#if>
                        <#if status == 0>
                            <th class="text-center">Encash/Delete</th>
                        </#if>
                        <#if status == 3>
                            <th class="text-center">Actions</th>
                        </#if>
                        <th>File No</th>
                        <th>Client Name</th>
                        <th>BRTC No.</th>
                        <th>MR No.</th>
                        <th>Amount</th>
                        <th>Payment Date</th>
                        <#if status == 2>
                            <th>Checked By</th>
                        <#else >
                            <th>Operator</th>
                        </#if>
                    </tr>
                    </thead>
                    <tbody>
                        <#list paymentList as payment>
                            <#if status == payment.status || status == 3>
                            <tr>
                                <!--First td start -->
                                <#if payment.status == 0>
                                    <td class="text-center">
                                        <a href="#" title="Encash" data-toggle="modal" data-target="#paymentEncash"
                                           value="${payment.brtcNo}" title="Click to Encash"
                                           class="fa fa-bank fa-lg text-pad-t-3 financial-modal-link"></a>
                                        &nbsp;&nbsp;
                                        <a href="deleteClientPayment.buet?id=${payment.id}" title="Click to Delete"
                                           class="fa fa-times fa-lg text-pad-t-3"></a>
                                        &nbsp;&nbsp;
                                        <a href="#<#--deleteClientPayment.buet?id=${payment.id}-->"
                                           title="Click to Disable"
                                           class="fa fa-power-off fa-lg text-pad-t-3"
                                           onclick="makModalAlert('warning', 'Sorry', 'Enable/Disable feature is not available')"></a>
                                    </td>
                                </#if>
                                <#if payment.status == 1>
                                    <td class="text-center">
                                        <a href="checkClientPayment.buet?id=${payment.id}" title="Click to Check"
                                           class="fa fa-check-square-o fa-lg text-pad-t-3"></a>
                                    </td>
                                </#if>
                                <#if payment.status == 2 && status == 3>
                                    <td class="text-center">
                                        ----
                                    </td>
                                </#if>
                                <!--First td close -->
                                <td class="col-md-1">${payment.project.fileNo}</td>
                                <td class="col-md-3">${payment.project.client.name}</td>
                                <td class="brtcColl">${payment.brtcNo}</td>
                                <td class=""><#if payment.mrNo??>${payment.mrNo}<#else><strong class="faa-ring animated"
                                                                                               style="color: red">-_-</strong></#if>
                                </td>
                                <td class="">${payment.amount}</td>
                                <td class="">
                                    <#if payment.encashDate??> ${payment.encashDate} <#else ><strong
                                            class="faa-ring animated" style="color: red">-_-</strong></#if>
                                </td>
                                <#if payment.status == 2>
                                    <td class="">${payment.checkedBy.token.userDetails.name}</td>
                                <#else >
                                    <td class="">${payment.operator.token.userDetails.name}</td>
                                </#if>
                            </tr>
                            </#if>
                        </#list>

                    </tbody>
                </table>
            <#else >
                <h1 class="text-danger"> No such BRTC No. found in Database..</h1>
            </#if>
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

<#--Payment Encash Add Modal -->
    <#include "modals/payment_encash.ftl"/>

<script>

    $(".financial-modal-link").click(function () {
        var myDataValue = $(this).attr("value");
        document.getElementById("brtcNo").value = myDataValue;
        //alert(myDataValue);
    });

    jQuery(function ($) {
        focusAndHighlight();
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


</script>

</@layout.my_app_layout>


