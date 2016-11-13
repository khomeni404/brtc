<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user<#if currentUser.authorizeId?string == "1"> faa-bounce animated text-danger</#if>"></i> ${currentUser.token.userDetails.name} <b
            class="caret"></b></a>
    <ul class="dropdown-menu">

        <li>
            <a href="/brtc/security/userProfile.buet?id=${currentUser.authorizeId}"><i class="fa fa-fw fa-user"></i> Profile</a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="../brtc/logout.buet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
        </li>
    </ul>
</li>