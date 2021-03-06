<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Welcome - Logiweb</title>
    <link rel="icon" href="<c:url value="/assets/img/icons/route.png"/>">
    <link rel="stylesheet" href="<c:url value="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"/>">

<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">--%>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome5-overrides.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/untitled-1-pt.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/untitled-2-pt.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/untitled-3-pt.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/untitled-pt.css"/>">
</head>

<body id="page-top">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand shadow mb-4 topbar static-top" id="top-navbar" style="background: #e20074;">
                    <div class="container">
                        <ul class="navbar-nav ml-auto flex-nowrap">
                            <li class="nav-item" style="padding: 5px">
                                <form action="${pageContext.request.contextPath}/login">
                                    <button class="btn btn-primary" type="submit" style="background: #e20074;border-color: #ced8e6;">Sign in</button>
                                </form>
                            </li>
                            <li class="nav-item" style="padding: 5px">
                                <form action="${pageContext.request.contextPath}/register">
                                    <button class="btn btn-primary" type="submit" style="background: #e20074;border-color: #ced8e6;">Sign up</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container" style="height: 800px;">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>Welcome to Logiweb Microservices.</h1>
                            <p>Logiweb Microservices is a big project with microservice architecture.
                                This is a REST-ful application deployed to Google Cloud Platform.
                                It consists of 7 services: Logiweb, Dashboard, Client Service, Chat, Telegram Bot & Spring Cloud Config Service</p>
                            <button onclick="location.href='http://dashboard.logiweb.site'" class="btn btn-primary" type="submit" style="color: #e20074; background: #ffffff;border-color: #e20074; margin-bottom: 5px; width: 200px">Dashboard</button>
                            <br>
                            <button onclick="location.href='http://client.logiweb.site'" class="btn btn-primary" type="submit" style="color: #e20074; background: #ffffff;border-color: #e20074; margin-bottom: 5px; width: 200px">Client Service</button>
                            <br>
                            <button onclick="location.href='http://chat.logiweb.site'" class="btn btn-primary" type="submit" style="color: #e20074; background: #ffffff;border-color: #e20074; margin-bottom: 5px; width: 200px">Chat</button>
                            <br>
                            <button onclick="location.href='https://telegram.me/LogiwebBot'" class="btn btn-primary" type="submit" style="color: #e20074; background: #ffffff;border-color: #e20074; margin-bottom: 5px; width: 200px">Telegram bot</button>
                            <br>
                            <button onclick="location.href='http://tsd.logiweb.site'" class="btn btn-primary" type="submit" style="color: #e20074; background: #ffffff;border-color: #e20074; margin-bottom: 5px; width: 200px">Technical Solution Description</button>
                        </div>
                        <div class="col-md-6"><img src="<c:url value="/assets/img/dogs/image1.jpeg"/>" style="width: 300px; border-radius: 30px"></div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer" style="background: #043880;">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Logiweb 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="<c:out value="/assets/js/jquery.min.js"/>"></script>
    <script src="<c:out value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="/assets/js/theme.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
</body>

</html>