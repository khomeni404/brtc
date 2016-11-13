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
    <div class="col-lg-2 text-center"></div>

    <div class="col-lg-8 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <h3 class="text-left text-success">Edit Project</h3>

                <form name="dataForm" id="dataForm" action="updateBrtcProject.buet" method="GET">
                    <div class="col-lg-12 text-center">
                        <input type="hidden" name="id" id="id" value="${project.id}"/>
                        <div class="col-lg-3 text-left">
                            File Number:
                        </div>
                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text"  value="${project.fileNo}" class="form-control has-success">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 text-left">
                            Project Title:
                        </div>
                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <textarea name="projectTitle" id="projectTitle" class="form-control  has-success"
                                          rows="5">${project.projectTitle}</textarea>
                            </div>
                        </div>

                        <input type="hidden" name="fileNo" id="fileNo" value="${project.fileNo}"/>
                        <input type="hidden" name="departmentId" value="1"/>
                        <input type="hidden" name="departmentIdOld" value="1"/>
                        <input type="hidden" name="clientIdOld" value="${project.client.id}"/>

                        <div class="col-lg-3 text-left">
                            Client:
                        </div>
                        <div class="col-lg-9 text-center">
                            <div class="form-group">
                                <select class="form-control  has-success" name="clientId" id="clientId">
                                    <option value="${project.client.id}">${project.client.name}</option>
                                    <#if clientList??>
                                        <#list clientList as client>
                                            <#if project.client.id != client.id>
                                                <option value="${client.id}">${client.name}</option>
                                            </#if>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-5 text-left">
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type='hidden' value='Unchecked' id="needReset" name='needReset'>
                                        <input type="checkbox" id="needResetCheck"  onclick="toggle(this)"/> Reset all data to initial state.
                                    </label>
                                    <label>
                                        <input type='hidden' value='Unchecked' id="needDelete" name='needDelete'>
                                        <input type="checkbox" id="deleteAllCheck"  onclick="toggle(this)"/> Delete ALL previous data.
                                    </label>
                                </div>
                            </div>
                            <script type="text/javascript">
                                function toggle(obj) {
                                    var $input = $(obj);
                                    var id = obj.getAttribute("id");
                                    if(id == "needResetCheck"){
                                        if ($input.prop('checked')) {
                                            $('#needReset').attr( 'value','Checked');
                                            $.growl.warning({title: "Warning", message: "This will reset all previous data to initial stage" });
                                        } else {
                                            $('#needReset').attr( 'value','Unchecked');
                                        }
                                    }else if(id == "deleteAllCheck"){
                                        if ($input.prop('checked')) {
                                            $('#needDelete').attr( 'value','Checked');
                                            $.growl.warning({title: "Warning", message: "This will DELETE all previous record related with this project" });
                                        } else {
                                            $('#needDelete').attr( 'value','Unchecked');
                                        }
                                    }
                                }
                                function  abc(){
                                    var buffer = new ArrayBuffer(12);
                                    var dataView = new DataView(buffer);
                                    var int8View = new Int8Array(buffer);
                                    dataView.setInt32(0, 0x1234ABCD);
                                    alert(dataView.getInt32(0).toString(16));
                                    alert(dataView.getInt8(0).toString(16));
                                    alert(int8View[0].toString(16));
                                }
                            </script>
                        </div>
                        <div class="col-lg-7 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button><#--
                            <button type="reset" onclick="abc();" class="btn btn-primary">Check</button>-->
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>


                    </div>
                    <!--Form right column-->


                </form>
            </div>
        </div>
    </div>

    <div class="col-lg-2 text-center"></div>
</div>

<!--End First Row -->




</@layout.my_app_layout>


<#--
<div class="col-lg-6 text-center">

    <div class="col-lg-4 text-left">
        Assign By:
    </div>
    <div class="col-lg-8 text-center">
        <div class="form-group">
            <input class="form-control" id="disabledInput" type="text"
                   value="Department Head, Civil"
                   disabled>
        </div>
    </div>


    <div class="col-lg-4 text-left">
        Assign To:
    </div>
    <div class="col-lg-8 text-center">
        <div class="form-group">
            <input class="form-control" id="disabledInput" type="text"
                   value="Not Assigned yet"
                   disabled>
        </div>
    </div>

    <div class="col-lg-4 text-left">
        Team:
    </div>
    <div class="col-lg-8 text-center">
        <div class="form-group">
            <input class="form-control" name="teamId" id="teamId" type="text"
                   value="Not Formed Yet"
                   disabled>
        </div>
    </div>


    <div class="col-lg-4 text-left">
        Record Date:
    </div>
    <div class="col-lg-8 text-center">
        <div class="form-group">
            <input class="form-control" name="recordDate" id="recordDate" type="text"
                   value="${today}"
                   disabled>
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
        <button type="reset" class="btn btn-primary">Reset</button>
        <button type="submit" class="btn btn-success">Save</button>
    </div>

</div>
-->


