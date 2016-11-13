<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >


<div class="row">
    <br/>
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success text-center">

                    ${licence.msg}<br/>
                    ${range.msg}
                </h3>
            </div>
        </div>
    </div>
</div>
<!--End First Row -->

</@layout.my_app_layout>




