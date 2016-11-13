<div class="modal fade" id="alertModal-danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-danger">
            <div class="modal-header panel-heading">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="alert-danger-title">(Dynamic Title Here)</h3>
            </div>
            <div class="modal-body" id="alert-danger-body" style="font-size: 18px">
                (Dynamic Message Here)
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="alert-danger-ok-button" data-dismiss="modal">OK</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal -->




<div class="modal fade" id="alertModal-warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-warning">
            <div class="modal-header panel-heading">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="alert-warning-title">(Dynamic Title Here)</h3>
            </div>
            <div class="modal-body" id="alert-warning-body" style="font-size: 18px">
                (Dynamic Message Here)
            </div>

            <div class="modal-footer">
                <button id="alert-warning-ok-btn" type="button" class="btn btn-success" data-toggle="" data-dismiss="modal">Okey</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="alertModal-success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-success">
            <div class="modal-header panel-heading">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="alert-success-title">(Dynamic Title Here)</h3>
            </div>
            <div class="modal-body" id="alert-success-body" style="font-size: 18px">
                (Dynamic Message Here)
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    function makModalAlert(type, head, body){
        $('#alertModal-'+type).modal('show');
        $('#alert-'+type+'-title').html(head) ;
        $('#alert-'+type+'-body').html(body) ;
    }

    function hideMakModalAlert(type){
        $('#alertModal-'+type).modal('hide');
    }


</script>

