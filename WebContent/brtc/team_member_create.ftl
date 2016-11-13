<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li class="active">
                <i class="fa fa-list"></i><a href="#"> Team</a>
            </li>
            <li class="active">
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
                <hr/>
                <form name="dataForm" id="dataForm" action="saveTeamMember.buet" method="POST">
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" id="" type="text"
                                       value="${team.project.fileNo}"disabled/>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Team Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" type="text"
                                       value="${team.id}"
                                       disabled/>
                                <input type="hidden" id="teamId" name="teamId" value="${team.id}"/>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Member Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="memberId" id="memberId">
                                    <option value="0">--Please select a name--</option>
                                    <#if userList??>
                                        <#list userList as teamMember>
                                            <#if teamMember.userType != "admin" &&  teamMember.token.userDetails??>
                                                <option value="${teamMember.authorizeId}">${teamMember.token.userDetails.name}</option>
                                            </#if>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Member Type:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control" name="memberTypeIndex" id="memberTypeIndex">
                                    <option value="4">--Please select a type--</option>
                                    <option value="0">Team Leader</option>
                                    <option value="1">General Member</option>
                                    <option value="2">Special Member</option>
                                    <option value="3">Peon</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Authorized:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" id="isAuthorized" name="isAuthorized" type="text"
                                       value="Requesting..." disabled/>
                            </div>
                        </div>

                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Note (If any):
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="notes" id="notes" class="form-control"
                                          rows="3">---</textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Is active (?):
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" name="isActive" id="isActive" type="text"
                                       value="Requesting..."
                                       disabled/>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Record Date:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" name="recordDate" id="recordDate" type="text"
                                       value="${today}"
                                       disabled/>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Operator:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" name="operator" id="operator" type="text"
                                       value="${user}"
                                       disabled/>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>


