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
                <i class="fa fa-list"></i><a href="/brtc/brtc/brtcProjectList.buet?findFor=all"> Project List</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating Project
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 text-center"></div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <h3 class="text-left text-success">Create Project</h3>

                <form name="dataForm" id="dataForm" action="saveBrtcProject.buet" method="POST">
                    <div class="col-lg-12 text-center">

                        <div class="col-lg-4 text-left">
                            File Number:
                        </div>
                        <div class="col-lg-8 text-left">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fileNo" id="fileNo" class="form-control has-success" placeholder="">
                                    <label onclick="setFileNo(${SuggestedFileNo})"> Click <a href="#" style="color: blue">here</a> to use  <b style="color: blue">
                                        <a href="#"> ${SuggestedFileNo}</a></b> as new file number. </label>
                                </div>
                            </div>
                        </div>
                        <script>
                            function setFileNo(fileNo){
                                 $('#fileNo').val(fileNo);
                            }
                        </script>

                        <div class="col-lg-4 text-left">
                            Project Title:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="projectTitle" id="projectTitle" class="form-control  has-success"
                                          rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Client:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control  has-success" name="clientId" id="clientId">
                                    <option value="null">--Select a client--</option>
                                    <#if clientList??>
                                        <#list clientList as client>
                                            <option value="${client.id}">${client.name} (${client.id})</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 text-left">
                            Department:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control  has-success" name="departmentId" id="departmentId">
                                    <option value="1">Department of Civil Engineering (CE)</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="saveBRTCProject();" class="btn btn-success">Save</button>
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
    function saveBRTCProject(){
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
        });
    }
</script>




</@layout.my_app_layout>



