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
                <i class="fa fa-cog fa-spin"></i> Edit ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">Edit ${PageTitle}</h3>

                <form name="dataForm" id="dataForm" action="updateClient.buet" method="POST">
                    <div class="col-lg-6 text-center">
                        <input type="hidden" name="id" id="id" value="${client.id}"/>
                        <div class="col-lg-4 text-left">
                            Client Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="name" id="name" value="<#if client.name??>${client.name}</#if> " class="form-control" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Address:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="address" id="address" class="form-control"
                                          rows="3"><#if client.address??>${client.address}</#if> </textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="phone" id="phone" value="<#if client.phone??>${client.phone}</#if> " class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="email" id="email" value="<#if client.email??>${client.email}</#if> " class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Fax:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fax" id="fax" value="<#if client.fax??>${client.fax}</#if> " class="form-control">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Description:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="description" id="description"  class="form-control"
                                          rows="3"><#if client.description??>${client.description}</#if> </textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesMan" value="<#if client.spokesMan??>${client.spokesMan}</#if> " id="spokesMan" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Cell:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesManCell"  id="spokesManCell" value="<#if client.spokesManCell??>${client.spokesManCell}</#if> " class="form-control">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Operator:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" name="operator" id="operator" type="text"
                                       value="${user}"
                                       disabled>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="button" class="btn btn-success" id="updateButton">Update</button>
                            <button type="button" class="btn btn-info" onclick="window.location='/brtc/brtc/clientList.buet?findFor=All'">Close</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('#updateButton').click(function(){
        makModalAlert('success','Yes!',"Client has been updated successfully.");
        setTimeout(function(){
            document.dataForm.submit()
        }, 700);

    });
</script>
<!--End First Row -->




</@layout.my_app_layout>


