<div class="col-lg-4 col-md-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-2">
                    <i class="fa fa-dollar fa-4x"></i>
                </div>
                <div class="col-xs-10 text-justify mak-min-height-5">
                    <div>Financial Status</div>
                <#if financialStatus??>
                    <div class="text-success fa-lg"><strong> ${financialStatus.statusHead}</strong></div>

                    <div class="progress-wrap progress" data-progress-percent="${(financialStatus.percent)}">
                        <div class="progress-bar progress" style="color: #000000">
                            Paid ${(financialStatus.percent)?string("#,##0")}%
                        </div>
                    </div>
                    <br/>
                    <table class="finSt">
                        <tr>
                            <td>Project Fee</td>
                            <td>:</td>
                            <td class="amount">${project.finalFee}/=</td>
                        </tr>
                        <tr>
                            <td>PA Submitted</td>
                            <td>:</td>
                            <td class="amount">${financialStatus.submitted}/=</td>
                        </tr>
                        <tr>
                            <td>Encashed</td>
                            <td>:</td>  <#--(checked: ${financialStatus.checked})-->
                            <td class="amount">${financialStatus.encashed}/=</td>
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
        <a href="#">
            <div class="panel-footer">
                <span class="text-centre">
                    <a href="#" data-toggle="modal" data-target="#addFinalFeeModal">
                        <i class="fa fa-plus-square"></i> Final Fee
                    </a>
                </span> &nbsp;&nbsp;
                <span class="text-centre">
                    <a href="/brtc/brtc/createClientPayment.buet?for=${project.fileNo}">
                        <i class="fa fa-plus-square"></i> Add Payment
                    </a>
                </span>
                <span class="pull-right">
                    <a href="#" data-toggle="modal" data-target="#financialStatusModal">
                        All Deposits&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-circle-right"></i>
                    </a>
                </span>

                <div class="clearfix"></div>
            </div>
        </a>
    </div>
</div>

<script type="text/javascript">
    Ext.onReady(function () {
        // on page load...
        moveProgressBar();
// on browser resize...
        $(window).resize(function () {
            moveProgressBar();
        });
// SIGNATURE PROGRESS
        function moveProgressBar() {
            var getPercent = ($('.progress-wrap').data('progress-percent') / 100);
            var getProgressWrapWidth = $('.progress-wrap').width();
            var progressTotal = getPercent * getProgressWrapWidth;
            var animationLength = 1000;
// on page load, animate percentage bar to data percentage length
            $('.progress-bar').animate({
                left: progressTotal
            }, animationLength);
        }
    });
</script>

<style type="text/css">
    .progress {
        width: 100%;
        height: 20px;
    }

    .progress-wrap {
        background: #cd9f4c;
        margin: 5px 0;
        overflow: hidden;
        position: relative;
    }

    .progress-bar {
        background: #ddd;
        left: 0;
        position: absolute;
        top: 0;
    }
</style>