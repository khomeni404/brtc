<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 text-center"></div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <h3 class="text-left text-success">Create ${PageTitle}</h3>
                <hr/>
                <form name="dataForm" id="dataForm" action="saveAdvance.buet" method="POST">
                    <div class="col-lg-12 text-center">

                        <div class="col-lg-4 text-left">
                            File Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fileNumber" class="form-control has-success">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Amount :
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group input-group">
                                <span class="input-group-addon">BDT.</span>
                                <input class="form-control  has-success" name="amount" type="text">
                                <span class="input-group-addon">.00</span>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Purposes :
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="purposes" class="form-control  has-success"
                                          rows="3"></textarea>
                            </div>
                        </div>



                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="submit" class="btn btn-success">Sent</button>
                        </div>


                    </div>
                    <!--Form right column-->
                </form>
            </div>
        </div>
    </div>

    <div class="col-lg-3 text-center"></div>
</div>

<!--End First Row -->



