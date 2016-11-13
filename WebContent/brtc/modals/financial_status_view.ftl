<#--Financial Status View Modal -->
<div class="modal fade financialStatusModal" id="financialStatusModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="financialModalStatement">
            <div class="modal-header">
                <h4 class=" modal-title" id="myModalLabel"> Financial Status (Project : ${project.fileNo})  </h4>
            </div>
            <div class="modal-body" id="teamModal">
                <div class="row" >
                    <div class="col-lg-12">
                        <div class="panel panel-default" id="main-panel">

                            <table id="teamTable" class=" table table-bordered table-hover table-striped">
                                <thead>
                                <tr>
                                    <th style="width: 200px;">BRTC No</th>
                                    <th style="width: 200px;">Cash Date</th>
                                    <th style="width: 200px;">MR No</th>
                                    <th style="width: 200px;">Amount</th>
                                    <th style="width: 200px;">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#assign total = 0>
                                <#assign status = ['PA Submitted', 'Encashed', 'Encashed & Checked']>
                                <#list financialStatus.paymentList as payment>
                                <tr>
                                    <td>${payment.brtcNo}</td>
                                    <td>
                                    <#if payment.encashDate??> ${payment.encashDate} <#else ><strong
                                            class="faa-ring animated" style="color: red">-_-</strong></#if>
                                    </td>
                                    <td>
                                    <#if payment.mrNo??>${payment.mrNo}<#else><strong class="faa-ring animated"
                                            style="color: red">-_-</strong></#if>
                                    </td>
                                    <td>${payment.amount}</td>
                                    <td>${status[payment.status]}</td>
                                </tr>
                                    <#assign total = total + payment.amount>
                                </#list>


                                <tr>
                                    <td class="text-right" colspan="3">Total</td>
                                    <td>${total}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="jQuery('#financialModalStatement').print()">Print</button>
            </div>
        </div>
    </div>

</div>
