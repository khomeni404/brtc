<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="#<#--/brtc/brtc/brtcProjectList.buet?findFor=all-->"> Project List</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating Message
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 text-center"></div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <h3 class="text-left text-success">Create Message</h3>

                <form name="dataForm" id="dataForm" action="saveBrtcMsg.buet" method="POST">
                    <div class="col-lg-12 text-center">

                        <div class="col-lg-4 text-left">
                            From:
                        </div>
                        <div class="col-lg-8 text-left">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="senderId" id="senderId" class="form-control has-success"
                                           placeholder="${sender.token.userDetails.name}" disabled>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            To:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control  has-success" name="receiverId" id="receiverId">
                                    <option value="null">--Select a Receiver--</option>
                                    <#list userList as user>
                                        <option value="${user.authorizeId}">${user.token.userDetails.name}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Message:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="content" id="content" class="form-control  has-success"
                                          rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <#assign x =0>
                            <#list userList as user>
                                <#assign x = x+1>

                            </#list>
                                ${x}
                        </div>

                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="saveMessage();" class="btn btn-success">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-3 text-center"></div>
</div>

<!--End First Row -->
<script type="text/javascript">
    function saveMessage() {
        document.dataForm.submit();

        /*
            var fileNo = document.getElementById("fileNo").value;
            var projectTitle = document.getElementById("projectTitle").value;
            var clientId = document.getElementById("clientId").value;
            if(fileNo== "" || projectTitle == "" || clientId == "null"){
                makModalAlert('warning',"Attention !","Please fill all field up of the form.");
                return false;
            }
            $.ajax({
                url: '/brtc/brtc/checkDuplicateProject.buet',
                data: "fileNo="+fileNo,
                dataType: "json",
                success: function(data){
                    if(data.msg == "Yes"){
                        makModalAlert('danger',"File number <b>"+fileNo+"</b> already exists !","Title: "+data.projectTitle);
                    }else{
                        document.dataForm.submit();
                    }
                }
            });*/
    }
</script>




</@layout.my_app_layout>



