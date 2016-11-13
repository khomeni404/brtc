<!--Slider-->

<div class="collapse navbar-collapse navbar-ex1-collapse" style="font-weight: bolder">
    <ul class="nav navbar-nav side-nav" style="height: 100%">
        <li>
            <a href="../home.buet"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
        </li>

        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#hrm_dd"><i class="fa fa-fw fa-desktop"></i> Admin <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="hrm_dd" class="collapse">
                <li><a href="/brtc/hrm/userDetailsCreate.buet"><span class="fa fa-plus-square text-success"></span> User</a></li>
                <li><a href="/brtc/hrm/userDetailsList.buet"><span class="fa fa-list"></span> User List</a></li>
                <li><a href="/brtc/hrm/createDepartment.buet">Department</a></li>
                <li><a href="/brtc/hrm/createDesignation.buet">Designation</a></li>
            <#--<li><a href="/brtc/hrm/#.buet">User Type</a></li>-->
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#brtc_dd"><i class="fa  fa-cube"></i> B R
                T C <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="brtc_dd" class="collapse">
                <li><a href="/brtc/brtc/createClient.buet"><b><span class="fa fa-plus-square text-success"></span> New Client</b></a></li>
                <li><a href="/brtc/brtc/createBrtcProject.buet"><b><span class="fa fa-plus-square text-success"></span> New Project</b></a></li>
                <li><a href="/brtc/brtc/clientList.buet?findFor=All" ><b><span class="fa fa-list"></span> Client List</b></a></li>
                <li><a href="/brtc/brtc/brtcProjectList.buet?findFor=all"><b><span class="fa fa-list"></span> Project List</b></a></li>
                <li><a href="/brtc/brtc/projectHistoryList.buet?fileNo=all"><b><span class="fa fa-list"></span> History List</b></a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#finance_dd"><i class="fa fa-fw fa-dollar"></i>
                Finance <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="finance_dd" class="collapse">
                <li><a href="/brtc/brtc/createClientPayment.buet?for=new"><b><span class="fa fa-plus-square text-success"></span> Payment</b></a></li>
                <li><a href="/brtc/brtc/createPaymentRequest.buet"><b><span class="fa fa-plus-square text-success"></span> Adv. Req.</b></a></li>
                <li class="createDistributionMenu"><a href="#"><b><span class="fa fa-plus-square text-success"></span> Distribution</b></a></li>
                <li><a href="/brtc/brtc/clientPaymentList.buet?findFor=all&status=0"><b><span class="fa fa-list"></span> Payment List</b></a></li>
                <li><a href="/brtc/brtc/paymentRequestList.buet?status=0"><b><span class="fa fa-list"></span> Request List</b></a></li>
                <li><a href="/brtc/brtc/distributionList.buet?fileNo=All"><b><span class="fa fa-list"></span> Dist. List</b></a></li>
            </ul>
        </li>

        <li>
            <a href="/brtc/report/reportHome.buet"><i class="fa fa-fw fa-list"></i> Reports</a>
        </li>
        <li>
            <div class="col-lg-12 text-center">
                <form name="searchForm" role="form" id="searchForm2" action="/brtc/brtc/viewBrtcProject.buet"
                      method="GET">
                    <div class="form-group input-group">
                        <input type="text" name="fileNo" id="fileNoForProjectSearch" class="form-control"
                               placeholder="File No.">
                        <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="$(this).submit()"></a></span>
                    </div>
                </form>
            </div>
        </li>
        <li>
            <div class="col-lg-12 text-center">
                <form name="searchForm" role="form" id="searchForm1" action="/brtc/brtc/brtcProjectList.buet"
                      method="GET">
                    <div class="form-group input-group">
                        <input type="text" name="findFor" class="form-control"
                               placeholder="Project">
                        <span class="input-group-addon"><a class="fa fa-search" onclick="$(this).submit()"></a></span>
                    </div>
                </form>
            </div>
        </li>
        <li>
            <div class="col-lg-12 text-center">
                <form name="searchForm" role="form" id="searchForm3" action="/brtc/brtc/clientList.buet"
                      method="GET">
                    <div class="form-group input-group">
                        <input type="text" name="findFor" id="clientSearchByName" class="form-control"
                               placeholder="Client">
                        <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="$(this).submit()"></a></span>
                    </div>
                </form>
            </div>
        </li>
        <li>
        </li>
    </ul>
</div>

<#include "../my_template/menu_modal.ftl"/>
<script>
    /*
    var myVar=setInterval(function(){myTimer()},1000);

    function myTimer() {
        var d = new Date();
        document.getElementById("clock").innerHTML = d.toLocaleTimeString();
    }   */
</script>
<!--/Slider-->