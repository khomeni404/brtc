<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >




   <div class="widget">

                <div class="header" style="width: 610px;">
                    <span><span class="ico gray home"></span>${type}</span>
                </div>

		
			<form name="userGroupForm" action="saveUserGroup.buet" method="POST">
				<fieldset class="form">
					
                    <div class="grid_4 alpha">&nbsp;&nbsp;</div>
                    <div class="grid_4 omega" style="padding-left: 196px; padding-top: 15px;">
                    
                       	<label for="groupName">
							Group Name:
							<span class="required-indicator">*</span>
						</label>
						<input type="text" name="userGroup"/>
						
						<label for="description">
							Description:
							<span class="required-indicator">*</span>
						</label>
						<input type="text" name="description"/>
						

                        <a id="userCreate" class="button icon approve" onclick="submitForm()">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.userGroupForm.reset()">Clear</a>
                    </div>
				</fieldset>
				<br class="clear"/>

			</form>
                </div>
                
</@layout.gen_app_layout>        