<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->

<div class="row">
    <h2>List Box Example</h2>

    <div class="col-lg-3 text-center">
        <div class="form-group">
            <select class="form-control" id="s" size="10" multiple>
                <#list groupsList as group>
                    <option value="${group.authorizedId}">${group.authorizationName}</option>
                </#list>
            </select>
        </div>
        <a href="#" onclick="mak_listBox_selectAll('s', true)">all</a>,
        <a href="#" onclick="mak_listBox_selectAll('s', false)">none</a>
    </div>

    <div class="col-lg-1 text-center">
        <div class="panel panel-default">
            <div class="panel-body text-center">
                <a href="#" title="Single Right" class="fa fa-caret-right fa-lg text-pad-t-5" onclick="mak_listBox_moveAcross('s', 'd', 'single')"></a>
                <br/>
                <a href="#" title="Single Right" class="fa fa-caret-square-o-right fa-lg text-pad-t-5" onclick="mak_listBox_moveAcross('s', 'd', 'all')"></a>
                <br/>
                <a href="#" title="Single Right" class="fa fa-caret-left fa-lg text-pad-t-5" onclick="mak_listBox_moveAcross('d', 's', 'single')"></a>
                <br/>
                <a href="#" title="Single Right" class="fa fa-caret-square-o-left fa-lg text-pad-t-5" onclick="mak_listBox_moveAcross('d', 's', 'all')"></a>
                <br/>
                <a href="#" title="Single Right" class="fa fa-arrow-up fa-lg text-pad-t-5" onclick="mak_listBox_move('d', 'moveUp')"></a>
                <br/>
                <a href="#" title="Single Right" class="fa fa-arrow-down fa-lg text-pad-t-5" onclick="mak_listBox_move('d', 'moveDown')"></a>
            </div>
        </div>
    </div>

    <div class="col-lg-3 text-center">
        <div class="form-group">
            <select class="form-control" id="d" size="10" multiple>

            </select>
        </div>
        <a href="#" onclick="mak_listBox_selectAll('d', true)">all</a>,
        <a href="#" onclick="mak_listBox_selectAll('d', false)">none</a>,
        <a href="#" onclick="mak_listBox_move('d', 'moveUp')">Move Up</a>,
        <a href="#" onclick="mak_listBox_move('d', 'moveDown')">Move Down</a>
    </div>
</div>
<!--End Second Row -->


</@layout.my_app_layout>