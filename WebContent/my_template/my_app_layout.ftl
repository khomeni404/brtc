<#macro my_app_layout title="">
<html>
<head>
    <title>${PageTitle}</title>
<#-- <link rel="shortcut icon" type="image/x-icon" href="../resources/images/common/bg_g.png" />-->
    <#include "../my_template/resources.ftl"/>
</head>
<body>
<div id="wrapper">
    <#include "../my_template/navigation.ftl"/>
    <#include "../my_template/alert_modal.ftl"/>
    <div id="page-wrapper">
        <div class="container-fluid">


            <#nested>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
</body>
</html>
</#macro>
