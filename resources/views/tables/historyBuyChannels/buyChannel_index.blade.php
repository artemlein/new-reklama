@extends('layouts.welcome')

@section('content')
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN THEME PANEL -->
            <div class="theme-panel hidden-xs hidden-sm">
                <div class="toggler"> </div>
                <div class="toggler-close"> </div>
                <div class="theme-options">
                    <div class="theme-option theme-colors clearfix">
                        <span> THEME COLOR </span>
                        <ul>
                            <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default"> </li>
                            <li class="color-darkblue tooltips" data-style="darkblue" data-container="body" data-original-title="Dark Blue"> </li>
                            <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue"> </li>
                            <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey"> </li>
                            <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light"> </li>
                            <li class="color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2"> </li>
                        </ul>
                    </div>
                    <div class="theme-option">
                        <span> Theme Style </span>
                        <select class="layout-style-option form-control input-sm">
                            <option value="square" selected="selected">Square corners</option>
                            <option value="rounded">Rounded corners</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Layout </span>
                        <select class="layout-option form-control input-sm">
                            <option value="fluid" selected="selected">Fluid</option>
                            <option value="boxed">Boxed</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Header </span>
                        <select class="page-header-option form-control input-sm">
                            <option value="fixed" selected="selected">Fixed</option>
                            <option value="default">Default</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Top Menu Dropdown</span>
                        <select class="page-header-top-dropdown-style-option form-control input-sm">
                            <option value="light" selected="selected">Light</option>
                            <option value="dark">Dark</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Sidebar Mode</span>
                        <select class="sidebar-option form-control input-sm">
                            <option value="fixed">Fixed</option>
                            <option value="default" selected="selected">Default</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Sidebar Menu </span>
                        <select class="sidebar-menu-option form-control input-sm">
                            <option value="accordion" selected="selected">Accordion</option>
                            <option value="hover">Hover</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Sidebar Style </span>
                        <select class="sidebar-style-option form-control input-sm">
                            <option value="default" selected="selected">Default</option>
                            <option value="light">Light</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Sidebar Position </span>
                        <select class="sidebar-pos-option form-control input-sm">
                            <option value="left" selected="selected">Left</option>
                            <option value="right">Right</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> Footer </span>
                        <select class="page-footer-option form-control input-sm">
                            <option value="fixed">Fixed</option>
                            <option value="default" selected="selected">Default</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- END THEME PANEL -->
            <!-- BEGIN PAGE BAR -->
            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <a href="#">Главная</a>
                        <i class="fa fa-circle"></i>
                    </li>
                    <li>
                        <span>Купленные ролики</span>
                    </li>
                </ul>

            </div>
            <!-- END PAGE BAR -->
            <!-- BEGIN PAGE TITLE-->
            <h3 class="page-title"> Youtube Channels
                <small></small>
            </h3>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 blue" href="#">
                        <div class="visual">
                            <i class="fa fa-comments"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="{{$counts[0]->buy_video}}">0</span>
                            </div>
                            <div class="desc"> Куплено роликов </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

                    <a class="dashboard-stat dashboard-stat-v2 red" href="/refresh/money">
                        <div class="visual">

                            <i class="fa fa-bar-chart-o"></i>
                        </div>
                        <div class="details">

                            <div class="number">

                                <span data-counter="counterup" data-value="{{$counts[0]->money}}">0</span> т.р. </div>
                            <div class="desc"> Ушло на рекламу </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 green" href="#">
                        <div class="visual">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="549">0</span>
                            </div>
                            <div class="desc"> New Orders </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                        <div class="visual">
                            <i class="fa fa-globe"></i>
                        </div>
                        <div class="details">
                            <div class="number"> +
                                <span data-counter="counterup" data-value="89"></span>% </div>
                            <div class="desc"> Brand Popularity </div>
                        </div>
                    </a>
                </div>
            </div>
            <!-- END PAGE TITLE-->
            <!-- END PAGE HEADER-->
            <div class="row">

                <div class="col-md-12">

                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <a href="{{ route('table.buy-channels.create') }}" class="btn btn-circle btn-default btn-sm w-100 ml-98">
                        <i class="fa fa-plus "></i> Add
                    </a>
                        <div class="portlet-body">

                            <div class="table-scrollable">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th> Название канала </th>
                                        <th> Цена</th>
                                        <th> Дата публикации</th>
                                        <th> Ссылка на видео </th>
                                        <th> кошелёк </th>
                                        <th> Status </th>
                                        <th>  </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($channels as $item)
                                    <tr>
                                        <td>{{$item->name_channel}}</a> </td>
                                        <td> {{$item->price}}</td>
                                        <td> {{$item->date_publication}}</td>
                                        <td> <a href="{{$item->url_video}}">{{$item->url_video}}</a></td>
                                        <td> {{$item->wallet}}</td>
                                        <td>
                                            @if($item->status == 1)
                                                <span class="label label-sm label-success"> Выпущен </span>
                                            @elseif($item->status == 0)
                                                <span class="label label-sm label-warning"> Ожидание </span>
                                            @endif
                                        </td>
                                        <td><div class="page-toolbar">
                                                <div class="btn-group pull-right">
                                                    <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"><i class="icon-wrench"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                        <li>
                                                            <a href="#">
                                                                <i class="icon-bell"></i> Action</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                <i class="icon-shield"></i> Another action</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                <i class="icon-user"></i> Something else here</a>
                                                        </li>
                                                        <li class="divider"> </li>
                                                        <li>
                                                            <a href="#">
                                                                <i class="icon-bag"></i> Separated link</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                    </tbody>
                                </table>

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