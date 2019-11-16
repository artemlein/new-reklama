<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/anim-img.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <!-- Styles -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <!-- Styles -->
    <style>

        html, body {
            background-color: #fff;
            color: #636b6f;
            font-family: 'Nunito', sans-serif;
            font-weight: 200;
            height: 100vh;
            margin: 0;
        }

        .full-height {
            height: 100vh;
        }

        .flex-center {
            align-items: center;
            display: flex;
            justify-content: center;
        }

        .position-ref {
            position: relative;
        }

        .top-right {
            position: absolute;
            right: 10px;
            top: 18px;
        }

        .content {
            text-align: center;
            margin-left: 100px;
        }

        .title {
            font-size: 84px;
        }

        .links > a {
            color: #636b6f;
            padding: 0 25px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .1rem;
            text-decoration: none;
            text-transform: uppercase;
        }

        .links2{margin-top:15px;}

        .nav-item{
            float: right;
            list-style: none;
        }
        .m-b-md {
            margin-bottom: 30px;
        }
        .content{
            margin-left: 0px;
        }
        @media screen and (max-width: 600px){
            .title{
                font-size:50px;
            }

        }
    </style>
</head>
<body>


<div class="flex-center position-ref full-height">



    <div class="content flex-column align-items-center ">
        <div class="title m-b-md col-lg-12">
            MeowSkins
        </div>

        @if(Auth::user())
            @if(Auth::user()->access_moderation === 1)
                <div class="links">
                    <a href="{{ route('report.index') }}">Модерация</a>
                </div>
            @endif
            @if(Auth::user()->access_mems === 1)
                <div class="links">
                    <a href="{{ route('mems.indexNow') }}">Мемоделы</a>
                </div>
            @endif
        @else
            <div class="links">
                <a href="login/vk">{{  __('Login to VK') }}</a>
            </div>
        @endif
    </div>
</div>
</body>
</html>
