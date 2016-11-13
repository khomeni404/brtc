<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row" xmlns="http://www.w3.org/1999/html">
    <div class="col-lg-9">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/paymentRequestList.buet?status=0"> Request List</a>
            </li>
            <li>
                <i class="fa fa-list-alt"></i> ${PageTitle} Details
            </li>

        </ol>
    </div>
    <div class="col-lg-2 text-right" style="margin-top: 11px">

        <form name="searchPaymentRequest" role="form" id="searchPaymentRequest"
              action="/brtc/brtc/viewPaymentRequest.buet" method="GET">
            <script>
                function submitForm() {
                    document.searchPaymentRequest.submit();
                }
                Ext.onReady(function () {
                    //alert("hello");
                    $("#AprId").focus();
                });
            </script>
            <div class="form-group input-group">
                <input type="text" name="AprId" id="AprId" class="form-control" placeholder="$ Request ID.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-1 text-right">
        <ol class="breadcrumb">
            <#if request??>
            <li class="active">
                    <i class="fa fa-file-pdf-o"></i><a href="../report/paymentRequest.buet?APRId=${request.id}"> PDF</a>
            </li>
            </#if>
        </ol>
    </div>
</div>
<div class="row" id="firstRow" style=" background-color: #f5f4f4">

    <div class="col-lg-12 text-center">
        <h2><b>Payment Request</b></h2>
    </div>

</div>
    <#if request??>
    <div class="row" style="font-size: 19px; padding: 10px; background-color: #f5f4f4">
        <div class="panel panel-default" style="padding: 0 10 0 10">
            <div class="panel-body">

                <style type="text/css">.row {
                    padding: 5 0 5 0
                }</style>
                <div class="row">
                    <div class="col-lg-4" style="background-color:#cbcbdf;">File No.
                        <a href="/brtc/brtc/viewBrtcProject.buet?fileNo=${request.project.fileNo}"><b>${request.project.fileNo}</b></a>
                    </div>
                    <div class="col-lg-4 text-center" style="background-color:#e2fad0;">APR ID : <b
                            id="requestId">${request.id}</b></div>
                    <div class="col-lg-4 text-right" style="background-color:#c9dff2;">Date: <b>${request.applyDate}</b>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="border: 2px solid black"></div>
                    <div class="col-md-6" style="border: 2px solid black"></div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <b>In Favour of : </b>  ${request.inFavourOf}
                    </div>
                    <div class="col-md-8">
                        <b>Requested By : </b>${request.appliedBy.token.userDetails.name}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <b>Request For : </b>  ${request.purposes}
                    </div>
                    <div class="col-md-8">
                        <b>Project Title : </b>${request.project.projectTitle}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4" style="background-color:lavender;">Project Cost :
                        <b>${request.project.finalFee}/=</b></div>
                    <div class="col-sm-4" style="background-color:#e3e3f7;">Deposited Amount : <b>${encashed}/=</b>
                    </div>
                    <div class="col-sm-4" style="background-color:#E6E6FA;">Amount in HoD's A/C : <b>---/=</b></div>
                </div>
                <div class="row">
                    <div class="col-sm-4" style="background-color:#E6E6FA;">Requested Amount :
                        <b>${request.amount}/=</b></div>
                    <div class="col-sm-4" style="background-color:#E6E6FA;">BRTC No. <b>${request.brtcNumber}</b></div>
                    <div class="col-sm-4" style="background-color:#E6E6FA;">Available After :
                        <b>${encashed-request.amount}/=</b></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-12 text-center" style="font-size: 16px;">
                    <div class="col-sm-4 text-left"><b>Countered By . . .</b></div>
                    <div class="col-sm-4 text-left"><b>Approved By . . . </b></div>
                    <div class="col-sm-4 text-left"><b>Received By . . . </b></div>


                    <div class="col-sm-4">
                        <#if request.counteredBy??>
                            <!--<img src="../resources/images/signature/arephin.png"/>--><br/>

                            <div class="col-sm-12"><b
                                    id="counteredBy_COUNTER">${request.counteredBy.token.userDetails.name}</b></div>
                            <div class="col-sm-12"><b>----------------------------------------</b>
                            </div>
                        <#else >
                            <a href="" onclick="signRequest('COUNTER');"><img
                                    src="../resources/images/signature/signature.png"/></a>

                            <div class="col-sm-12"><b>----------------------------------------</b>
                            </div>
                        </#if>
                    </div>

                    <div class="col-sm-4">
                        <#if request.acceptedBy??>
                            <!--<img src="../resources/images/signature/manager.png"/>--><br/>

                            <div class="col-sm-12"><b
                                    id="acceptedBy_ACCEPT">${request.acceptedBy.token.userDetails.name}</b></div>
                            <div class="col-sm-12"><b>----------------------------------------</b>
                            </div>
                        <#else >
                            <#if request.counteredBy??>
                                <a href="" onclick="signRequest('APPROVE');"><img
                                        src="../resources/images/signature/signature.png"/></a>

                                <div class="col-sm-12">
                                    <b>----------------------------------------</b></div>
                            <#else >
                                <img src="../resources/images/signature/signature.png"/>

                                <div class="col-sm-12">
                                    <b>----------------------------------------</b></div>
                            </#if>
                        </#if>
                    </div>

                    <div class="col-sm-4">
                        <#if request.receivedBy??>
                            <!--<img src="../resources/images/signature/manager.png"/>--><br/>

                            <div class="col-sm-12"><b
                                    id="receivedBy_RECEIVE">${request.receivedBy.token.userDetails.name}</b></div>
                            <div class="col-sm-12"><b>----------------------------------------</b>
                            </div>
                        <#else >
                            <#if request.acceptedBy??>
                                <a href="" onclick="signRequest('RECEIVE');"><img
                                        src="../resources/images/signature/signature.png"/></a>

                                <div class="col-sm-12">
                                    <b>----------------------------------------</b></div>
                            <#else >
                                <img src="../resources/images/signature/signature.png"/>

                                <div class="col-sm-12">
                                    <b>----------------------------------------</b></div>
                            </#if>
                        </#if>
                    </div>

                </div>


                <div class="col-sm-12">
                    <hr style=" border: 1px solid blue"/>
                    <h4><b>Previous Advances of this Project (File: ${request.project.fileNo})</b></h4>
                    <table class="table table-bordered table-hover table-striped" style="background-color: #ddd4ee">
                        <thead>
                        <tr>
                            <th style="width: 70px">Apply Date</th>
                            <th class="col-md-3">Requested By</th>
                            <th class="col-md-3">Countered By</th>
                            <th class="col-md-2">Receive Date</th>
                            <!--<th class="col-md-2">Received By</th>-->
                            <th class="col-md-1 text-center">Amount</th>
                            <th class="col-md-2 text-center">BRTC No.</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#assign total = 0.0>
                            <#assign thisId = request.id>
                            <#list requestList as request>
                                <#if request.id != thisId>
                                <tr>
                                    <td>${request.applyDate}</td>
                                    <td>${request.appliedBy.token.userDetails.name}</td>
                                    <td><#if request.counteredBy??>${request.counteredBy.token.userDetails.name}</#if></td>
                                    <td><#if request.receiveDate??>${request.receiveDate}</#if></td>
                                <#--<td><#if request.receivedBy??>${request.receivedBy.token.userDetails.name}</#if></td>-->
                                    <td class="text-center"><b>${request.amount}/=</b></td>
                                    <td>${request.brtcNumber}</td>
                                </tr>
                                    <#assign total = total + request.amount>
                                </#if>
                            </#list>
                        <tr>
                            <td colspan="4" class="text-right"><b>T O T A L =</b></td>
                            <td class="text-center"><b>${total}/=</b></td>
                            <td class="text-center"></td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>




    <#else >
    <br/><br/><br/><br/><br/>
    <h1 class="text-danger text-center"><b>No such Payment Request exists</b></h1>
    </#if>

<script type="text/javascript">
    function signRequest(signFor) {
        //$("img").attr("width","500");
        var id = document.getElementById("requestId").innerHTML;
        Ext.Ajax.request({
            url: '/brtc/brtc/signPaymentRequest.buet',
            params: {
                id: id,
                signFor: signFor
            },
            success: function (conn, response, options, eOpts) {
                var result = Ext.JSON.decode(conn.responseText, true);
                var counter = "COUNTER";
                var approve = "APPROVE";
                var receive = "RECEIVE";
                //$("#projectTitle").val(result.title);
                if (signFor == counter) {
                    document.getElementById("counteredBy_COUNTER").innerHTML = result.name;
                } else if (signFor == approve) {
                    document.getElementById("acceptedBy_ACCEPT").innerHTML = result.name;
                } else if (signFor == receive) {
                    document.getElementById("receivedBy_RECEIVE").innerHTML = result.name;
                }

            }
        });
    }
</script>


</@layout.my_app_layout>


