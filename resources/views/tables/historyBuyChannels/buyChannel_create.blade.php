@extends('layouts.welcome')

@section('content')
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN THEME PANEL -->

            <!-- END THEME PANEL -->
            <!-- BEGIN PAGE BAR -->
            <div class="page-bar">


            </div>
            <!-- END PAGE BAR -->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title"> Add video
                <small></small>
            </h3>

            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            <div class="row">

                <div class="col-md-12">

                    <!-- BEGIN SAMPLE TABLE PORTLET-->

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_0">
                            <div class="portlet box green">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="fa fa-gift"></i>Form Actions On Bottom </div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse"> </a>
                                        <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                        <a href="javascript:;" class="reload"> </a>
                                        <a href="javascript:;" class="remove"> </a>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form method="POST" action="{{ route('table.buy-channels.store') }}" class="form-horizontal">
                                        @csrf
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Name Channel</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="name_channel" id="name_channel" class="form-control input-circle-left" placeholder="Name">
                                                        <span class="input-group-addon input-circle-right">
                                                              <i class="fa fa-youtube-play"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Price</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="price" id="price" class="form-control input-circle-left" placeholder="Price">
                                                        <span class="input-group-addon input-circle-right">
                                                                        <i class="fa fa-usd"></i>
                                                                    </span>
                                                    </div>
                                                 </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Date Publication</label>
                                                <div class="col-md-4">
                                                    <div class="input-icon">
                                                        <i class="fa fa-bell-o"></i>
                                                        <input class="form-control input-circle" type="date" id="date_publication" name="date_publication" value=""
                                                               min="2019-09-01" max="2019-12-31"> </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Url video</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="url_video" id="url_video" class="form-control input-circle-left" placeholder="https://example.com">
                                                        <span class="input-group-addon input-circle-right">
                                                                        <i class="fa fa-code"></i>
                                                                    </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Wallet</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="wallet" id="wallet" class="form-control input-circle-left" placeholder="+7">
                                                        <span class="input-group-addon input-circle-right">
                                                            <i class="fa fa-credit-card"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group last">
                                                <label class="col-md-3 control-label">Status</label>
                                                <div class="col-md-6" style="margin-left:25px;">


                                                        <div class="radio-list">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="status" id="status" value="0" checked> Ожидание </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="status" id="status" value="1"> Выпущен </label>
                                                        </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn btn-circle green">Submit</button>
                                                    <button type="button" class="btn btn-circle grey-salsa btn-outline">Cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- END SAMPLE TABLE PORTLET-->
                </div>
                <!-- END CONTAINER -->
                <!-- BEGIN FOOTER -->
                <div class="page-footer">
                    <div class="page-footer-inner"> 2014 &copy; Metronic by keenthemes.
                        <a href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">Purchase Metronic!</a>
                    </div>
                    <div class="scroll-to-top">
                        <i class="icon-arrow-up"></i>
                    </div>
                </div>
@endsection