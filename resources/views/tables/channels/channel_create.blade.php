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
                                    <form method="POST" action="{{ route('table.channels.store') }}" class="form-horizontal">
                                        @csrf
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Channel URL</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="url_channel" id="url_channel" class="form-control input-circle-left" placeholder="https://youtube.com/channel/...">
                                                        <span class="input-group-addon input-circle-right">
                                                              <i class="fa fa-youtube-play"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Url VK</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="url_vk" id="url_vk" class="form-control input-circle-left" placeholder="https://vk.com/id1234567">
                                                        <span class="input-group-addon input-circle-right">
                                                                        <i class="fa fa-usd"></i>
                                                                    </span>
                                                    </div>
                                                 </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Description</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="text" name="description" id="description" class="form-control input-circle-left" placeholder="Description">
                                                        <span class="input-group-addon input-circle-right">
                                                                        <i class="fa fa-usd"></i>
                                                                    </span>
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