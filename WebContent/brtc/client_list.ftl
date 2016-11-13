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
                <i class="fa fa-plus-square"></i><a href="/brtc/brtc/createClient.buet"> Create ${PageTitle}</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List
            </li>
        </ol>
    </div>

   <#-- <div class="col-lg-2 text-right">
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-print"></i><a href="#" onclick="jQuery('#myPrintDiv').print()"> Print</a>
            </li>
            <li class="active">
                <i class="fa fa-file-pdf-o"></i><a href="#" onclick="jQuery('#myPrintDiv').print()"> PDF</a>
            </li>
        </ol>&ndash;&gt;
    </div>-->
</div>
<div class="row" id="firstRow">
    <div class="col-lg-9 text-center">
        <h3 class="text-left text-primary">
            Client List
        </h3>
    </div>
    <div class="col-lg-3 text-center">
        <form name="distSearchForm" role="form" id="distSearchForm" action="clientList.buet" method="GET">
            <input type="hidden" value="${searchText}" id="searchText"/>
            <script>
                $(document).ready(function () {
                    var clientSearchId = $("#clientSearchId");
                    var text = $('#searchText').val();
                    $('#firstRow').highlight(text + "");
                    clientSearchId.attr("placeholder", "Last search [ "+text+" ]");
                    clientSearchId.focus();
                });
            </script>
            <div class="form-group input-group">
                <input type="text" name="findFor" id="clientSearchId" class="form-control" placeholder="">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="$(this).submit();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center" style="min-height: 450px">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped  pagination-table" id="clientTable">
                        <thead>
                        <tr>
                            <th class="text-center" style="width: 100px">Actions</th>
                            <th>Client ID</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Fax & Email</th>
                            <th>Spokes Man</th>
                            <th>S. Man Cell</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list clientList as client>
                            <tr>

                                <td class="text-center col-md-1">
                                    <button type="button" class="fa fa-pencil editClient" clientId="${client.id}"></button>
                                    <button type="button" class="fa fa-times text-danger deleteClient" clientId="${client.id}"></button>
                                </td>
                                <td class="col-md-1">${client.id}</td>
                                <td class="col-md-2"><#if client.name??> ${client.name}</#if></td>
                                <td class="col-md-2"><#if client.address??>${client.address}</#if></td>
                                <td class="col-md-1"><#if client.phone??>${client.phone}</#if></td>
                                <td class="col-md-1"><#if client.fax??>${client.fax}<br/>${client.email}</#if></td>
                                <td class="col-md-1"><#if client.spokesMan??>${client.spokesMan}</#if></td>
                                <td class="col-md-1"><#if client.spokesManCell??>${client.spokesManCell}</#if></td>

                            </tr>
                            </#list>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12" style="background-color: #c7c7c7;">
        <div class="row">
            <div class="col-lg-6 text-left" >
                <div class="displaying-div"></div>
            </div>
            <div class="col-lg-6 text-right paging-div"></div>
        </div>
    </div>
</div>

<!--End First Row -->

<script type="text/javascript">
    $('.editClient').click(function(){
        var id = $(this).attr('clientId');
        window.location.href = '/brtc/brtc/editClient.buet?id='+id;
    });

    $('.deleteClient').click(function(){
        //$(this).parent().parent().remove(); return false;
        var id = $(this).attr('clientId');
        var thisTr = $(this).parent().parent();
        $.ajax({
            url: '/brtc/brtc/deleteClient.buet',
            data: "id="+id,
            dataType: "json",
            success: function(data){
                if(data.success == "no"){
                    makModalAlert('danger','This client can\'t be deleted !',data.msg);
                }else{
                    makModalAlert('success','Yes!',"Client has been deleted successfully.");
                    //$.growl.warning({title: "Yes !", message: "Client has been deleted successfully." });
                    setTimeout(function(){
                        thisTr.remove();
                    }, 1000);
                }
            }
        });
    });
    jQuery(function($) {
        var items = $(".pagination-table tbody tr");
        var pagingDiv = ".paging-div";
        var pagingUl = pagingDiv + " ul";      //instead of $('#departmentPaging ul')

        var numItems = items.length;
        var perPage = 5;
        items.slice(perPage).hide();
        $(pagingDiv).pagination({
            items: numItems,
            itemsOnPage: perPage,
            onPageClick: function(pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
                $(pagingUl).prop('class', 'pagination');   //bootstrap css for pagination
                $('.displaying-div').html("Displaying "+(showFrom+1)+"-"+(showTo<=numItems? showTo : numItems)+" out of "+numItems);
            }
        });
        $(pagingUl).prop('class', 'pagination');    //bootstrap css for pagination
        $('.displaying-div').html("Displaying 1-"+(perPage<=numItems? perPage : numItems)+" out of "+numItems);
    });

</script>


</@layout.my_app_layout>


