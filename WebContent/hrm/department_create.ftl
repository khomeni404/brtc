<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 500px">
    <ul id="crumbs_ui_custom">
        <li><a href="${DashboardLink}">Dashboard</a></li>

        <li><a href="userList.buet">User List</a></li>
        <li>Create User</li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>

    <div id="user_crate" class="content" role="main" style="width: 450px;">

        <form name="dataForm" id="dataForm" action="saveDepartment.buet" method="POST">

            <fieldset class="form">


                <div class="container_16">
                    <div class="grid_3 alpha">
                        <label for="name">
                            Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="name" id="name"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="description">
                            Description:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="description" id="description"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="phoneNo">
                            Phone:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="phoneNo" id="phoneNo"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="email">
                            Email:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="email" id="email"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="address">
                            Address:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="address" id="address"/>
                    </div>
                    <br class="clear" /><br class="clear" />


                    <div class="grid_4 omega reset-input reset-button-left">
                        <a id="userCreate" class="button icon approve" onclick="submitForm()">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.dataForm.reset()">Clear</a>
                    </div>

                </div>

            </fieldset>


        </form>
    </div>
    <!--end user create div-->

    <script type="text/javascript">
        function submitForm(){
            document.dataForm.submit();
        }
    </script>
</div>
<#--End widget div-->

</@layout.gen_app_layout>