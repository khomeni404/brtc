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
                <i class="fa fa-list"></i><a href="/brtc/brtc/clientList.buet?findFor=All"> ${PageTitle} List</a>
            </li>
            <li>
                <i class="fa fa-cog fa-spin"></i> Creating ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">Create ${PageTitle}</h3>

                <form name="dataForm" id="dataForm" action="saveClient.buet" method="POST">
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Client Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="name" id="name" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Address:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="address" id="address" class="form-control"
                                          rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="phone" id="phone" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="email" id="email" class="form-control">
                                </div>
                            </div>
                        </div>


                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Fax:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fax" id="fax" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 text-left">
                            Description:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="description" id="description" class="form-control"
                                          rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesMan" id="spokesMan" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Cell:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesManCell" id="spokesManCell" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" id="checkClient" class="btn btn-info">Check</button>
                            <button type="button" id="saveClient" class="btn btn-success">Save</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->
<script type="text/javascript">
    $('#saveClient').on('click', function(){
        var name = $('#name').val();
        if(name == ""){
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !") ;
            $('#alert-warning-body').html("Please Insert CLIENT NAME at least.");
            return false;
        }
        //alert("Start")
        document.dataForm.submit()
    });
    $('#checkClient').click(function(){
        var name = $('#name').val();
        $.ajax({
            url: '/brtc/brtc/checkDuplicateClient.buet',
            data: "findFor="+name,
            dataType: "json",
            success: function(data){
                if(data.success == "got"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("These Clients contains \""+name+"\"") ;
                    $('#alert-danger-body').html(data.msg) ;
                    //return false;
                }else{
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Information") ;
                    $('#alert-danger-body').html("No such Client found !") ;
                }
            }
        });
    });
    $(document).ready(function(){
        $('#name').focus();
    });
</script>



</@layout.my_app_layout>


