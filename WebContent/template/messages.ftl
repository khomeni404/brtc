<#assign msg = 0> <!-- asign msg here to show by badge-->


<li class="dropdown">

    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope faa-shake animated-hover"></i> <b
            class="caret"></b> <span class="badge badge-warning"><#if msg==0><#else >${msg}</#if></span></a>
    <ul class="dropdown-menu message-dropdown">
        <li class="message-preview">
            <a href="#">
                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>

                    <div class="media-body">
                        <h5 class="media-heading"><strong>Khomeni</strong>
                        </h5>

                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>

                        <p>Initial working team has been formed by Muhammad Ayatullah Khomeni on 27/03/2015</p>
                    </div>
                </div>
            </a>
        </li>
        <li class="message-preview">
            <a href="#">
                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>

                    <div class="media-body">
                        <h5 class="media-heading"><strong>Tajul</strong>
                        </h5>

                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>

                        <p>Change final fee : 200000.0/=</p>
                    </div>
                </div>
            </a>
        </li>
        <li class="message-footer">
            <a href="#">Read All New Messages</a>
        </li>
    </ul>
</li>