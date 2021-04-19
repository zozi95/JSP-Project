<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/message2.css">

</head>
<body>
<script src="//code.jquery.com/jquery.min.js"></script>
  
<div class="container-fluid chat-container">
    <div class="row h-100">
        <div class="col-3 border-chat-lightgray px-0" id="sidebar">
            <div id="sidebar-content" class="w-100 h-100">
                <div class="input-group p-0 d-xs-none" id="search-group">
                    <input type="text" class="form-control border-0" placeholder="Search..." id="search">
                    <span class="input-group-addon">
                        <button class="btn border-0 bg-white text-primary hover-color-darkblue" type="button">
                            <i class="fa fa-search fa-fw"></i>
                        </button>
                    </span>
                </div>
                <div class="sidebar-scroll" id="list-group">
                    <ul class="list-group w-100" id="friend-list">
                    <li class="list-group-item p-1 active hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">StanIsLove</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Joe</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Deadpool</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Wolverine</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Dave</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Harley</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">John</span>
                    </li>
                    <li class="list-group-item p-1 hover-bg-lightgray">
                        <img src="//placehold.it/50x50" class="rounded-circle">
                        <span class="d-xs-none username">Ben</span>
                        <span class="badge badge-primary">new</span>
                    </li>
                </ul>
                </div>
            </div>
        </div>
        <div class="col d-flex p-0">
            <div class="card">
                <div class="card-header bg-darkblue text-white py-1 px-2" style="flex: 1 1">
                    <div class="d-flex flex-row justify-content-start">
                        <div class="col-1 p-1">
                            <button class="btn text-white bg-darkblue p-0 hover-color-lightgray">
                                <i class="fas fa-bars fa-2x"></i>
                            </button>
                        </div>
                        <div class="col">
                            <div class="my-0">
                                <b>StanIslove</b>
                            </div>
                            <div class="my-0">
                                <small>last seen Feb 18 2017</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body bg-lightgrey d-flex flex-column p-0" style="flex: 9 1">
                    <div class="container-fluid message-scroll" style="flex: 1 1">
                        <div class="row">
                            <div class="card message-card m-1">
                                <div class="card-body p-2">
                                    <span class="mx-2">Hi, Dave</span>
                                    <span class="float-right mx-1"><small>14:13<i class="fas fa-eye fa-fw" style="color:#e64980"></i></small></span>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="card message-card bg-lightblue m-1">
                                <div class="card-body p-2">
                                    <span class="mx-2">Hello, Stan</span>
                                    <span class="float-right mx-1"><small>14:14<i class="fas fa-eye fa-fw" style="color:#e64980"></i></small></span>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="card message-card bg-lightblue m-1">
                                <div class="card-body p-2">
                                    <span class="mx-2">What's up?</span>
                                    <span class="float-right mx-1"><small>14:14<i class="fas fa-check fa-fw" style="color:#66a80f"></i></small></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card message-card m-1">
                                <div class="card-body p-2">
                                    <span>So far so good, but my plumbus doesn't work as well as Meeseeks can't fix it, please, help me or they... They gonna kill Morty...</span>
                                    <span class="float-right"><small>14:16<i class="fas fa-eye fa-fw" style="color:#e64980"></i></small></span>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="card message-card bg-lightblue m-1">
                                <div class="card-body p-2">
                                    <span>I've called Rick, I'm on the way to your house,
                            but probably I lost my portal gun at the party yesterday.
                            Anyway, don't call the other Meeseeks solve this shit.</span>
                                    <span class="float-right mx-1"><small>14:21<i class="fas fa-check fa-fw" style="color:#66a80f"></i></small></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="input-group">
                        <input type="text" class="form-control border-0" placeholder="Input message...">
                        <span class="input-group-addon">
                            <button class="btn border-0 bg-white text-primary hover-color-darkblue" type="button">
                                <i class="fab fa-telegram-plane fa-2x"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- row -->
</div>
<!-- container -->

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>