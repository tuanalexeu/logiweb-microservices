<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="background: #ffffff;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Logout - Logiweb</title>

    <link rel="icon" href="<c:url value="/assets/img/icons/route.png"/>">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="<c:url value ="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/fontawesome5-overrides.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-1-logout.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-2-logout.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-3-logout.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-logout.css"/>">
</head>

<body class="bg-gradient-primary" style="background: #ffffff;">
    <div class="container" id="logincontainer">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="p-5" style="background: rgb(226,0,116);border-radius: 20px;">
                <div class="text-center">
                    <h4 class="text-white mb-2" style="color: rgb(255,255,255);"><strong>Are you sure you want to log out?</strong></h4>
                    <p class="text-white mb-4" style="color: rgb(0,0,0);">Please, confirm your action</p>
                </div>

                <div class="container" style="margin: 15px;">
                    <div class="row" id="my-row">
                        <form action="${pageContext.request.contextPath}/performLogOut">
                            <div class="col"><button class="btn btn-primary btn-block text-white btn-user" id="yes-button" type="submit" style="background: rgb(226,0,116);border-color: #ffffff; width: 75px">Yes</button></div>
                        </form>

                        <form action="${pageContext.request.contextPath}/homePage">
                            <div class="col"><button class="btn btn-primary btn-block text-white btn-user" id="no-button" type="submit" style="background: rgb(226,0,116);border-color: #ffffff; width: 75px">No</button></div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="<c:out value="/assets/js/jquery.min.js"/>"></script>
    <script src="<c:out value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="/assets/js/theme.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="<c:out value="/assets/js/chart.min.js"/>"></script>
    <script src="<c:out value="/assets/js/bs-init.js"/>"></script>
</body>

</html>