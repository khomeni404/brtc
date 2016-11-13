<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/brtc/brtc/clientList.buet?findFor=All"> ${PageTitle} List</a>
            </li>
            <li>
                <i class="fa fa-cog fa-spin"></i> Creating ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">

            <br/>
            <br/>
            <div align="center">
                <br> <br> <span onclick="crunchifyAjax()"> ${message}</span> <br> <br>
                <div id="result"></div>
                <br>
                <p>
                    by <a href="http://crunchify.com">Crunchify.com</a>
                </p>
            </div>
            <div>
                <input type="button" value="Show Alert" onclick="showBootBoxAlert('34')"/>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->





<script type="text/javascript">
    function crunchifyAjax() {
        $.ajax({
            url : '/brtc/brtc/ajaxTest.buet',
            success : function(data) {
                if(data>50)
                $('#result').html(data+" Big");
                else   {
                    $('#result').html(data);
                    $("#alertModal-danger").modal('show');
                    $('#alert-danger-title').html("Sorry")
                    $('#alert-danger-body').html("This is a small number "+data)
                }
            }
        });
    }

    function showBootBoxAlert(data){
        $("#alertModal-danger").modal('show');
        $('#alert-danger-title').html("Sorry")
        $('#alert-danger-body').html("This is a small number "+data)
        /*
         $("#myModal").modal({                    // wire up the actual modal functionality and show the dialog
             "backdrop"  : "static",
             "keyboard"  : true,
             "show"      : true                     // ensure the modal is shown immediately
         });*/
    }


    /*
     $("#myModal").on("show", function() {    // wire up the OK button to dismiss the modal when shown
            $("#myModal a.btn").on("click", function(e) {
                console.log("button pressed");   // just as an example...
                $("#myModal").modal('hide');     // dismiss the dialog
            });
        });

        $("#myModal").on("hide", function() {    // remove the event listeners when the dialog is dismissed
            $("#myModal a.btn").off("click");
        });

        $("#myModal").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
            $("#myModal").remove();
        });

    * */
</script>

<script type="text/javascript">
    var intervalId = 0;
    //intervalId = setInterval(crunchifyAjax, 10);
</script>


<!-- set up the modal to start hidden and fade in and out -->



</@layout.my_app_layout>


