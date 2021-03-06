<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home</title>
    <link rel="icon" href="<c:url value="/assets/img/icons/route.png"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/fontawesome-all.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/fonts/fontawesome5-overrides.min.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-1-acc.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-2-acc.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-3-acc.css"/>">
    <link rel="stylesheet" href="<c:url value ="/assets/css/untitled-acc.css"/>">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
</head>

<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(226,0,116);">
        <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/">
            <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
            <div class="sidebar-brand-text mx-3"><span>Logiweb</span></div>
        </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/profile"><i class="fas fa-window-maximize"></i><span>Main</span></a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/my-orders"><i class="fas fa-window-maximize"></i><span>My orders</span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand shadow mb-4 topbar static-top" style="background: #ffffff;">
                <ul class="navbar-nav ml-auto flex-nowrap">
                    <li class="nav-item" style="padding: 5px">
                        <div class="container authenticated" style="display:none; color: #e20074">
                            <span id="user" style="margin-top: 8px"></span>
                        </div>
                    </li>
                    <li class="nav-item" style="padding: 5px">
                        <form action="${pageContext.request.contextPath}/logout">
                            <button class="btn btn-primary" type="submit" style="background: #ffffff; color: #e20074; border-color: #e20074;">Log out</button>
                        </form>
                    </li>
                </ul>
            </nav>
            <div class="container" style="alignment: center; height: 800px">


                <c:if test="${success ne null}">
                    <c:choose>
                        <c:when test="${success eq true}">
                            <div style="border-color: #e20074">
                                <h4 align="center">Your order was successfully created!</h4>
                                <h4 align="center" style="size: 20px">Here's your token: </h4>
                                <h4 class="text-primary m-0 font-weight-bold" align="center" style="size: 20px">${token}</h4>
                                <h4 align="center">Please, copy & save it</h4>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="border-color: #e20074">
                                <h4 align="center">Something went wrong with your order</h4>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <h1 align="center">Check order status:</h1>

                <div class="container" align="center">
                    <form action="${pageContext.request.contextPath}/find-order">
                        <input required="required" type="text" name="orderToken" style="width: 400px;height: 40px;border-radius: 10px; border-color: #e20074" />
                        <button class="btn btn-primary" type="submit" style="margin-left: 10px; color: #e20074; background: #ffffff;border-color: #e20074;">Find</button>
                    </form>
                </div>

                <c:choose>
                    <c:when test="${order ne null}">
                        <div class="container-fluid" style="margin-top: 30px">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Client ID</th>
                                        <th>${order.clientId}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>City load</td>
                                        <td>${order.cityLoad}</td>
                                    </tr>
                                    <tr>
                                        <td>City unload</td>
                                        <td>${order.cityUnload}</td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td>${order.name}</td>
                                    </tr>
                                    <tr>
                                        <td>Weight</td>
                                        <td>${order.weight}</td>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <td>${order.status}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${not empty error}">
                                <div align="center">
                                    <h1 style="margin-top: 20px;">${error}</h1>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div align="center">
                                    <h1 style="margin-top: 20px;">No order selected</h1>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
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
<script src="<c:out value="/assets/js/chart.min.js"/>"></script>
<script src="<c:out value="/assets/js/bs-init.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script type="text/javascript" src="/webjars/js-cookie/js.cookie.js"></script>
<script type="text/javascript">

    $.ajaxSetup({
        beforeSend : function(xhr, settings) {
            if (settings.type == 'POST' || settings.type == 'PUT'
                || settings.type == 'DELETE') {
                if (!(/^http:.*/.test(settings.url) || /^https:.*/
                    .test(settings.url))) {
                    // Only send the token to relative URLs i.e. locally.
                    xhr.setRequestHeader("X-XSRF-TOKEN", Cookies
                        .get('XSRF-TOKEN'));
                }
            }
        }
    });

    $.get("/user", function(data) {
        $("#user").html(data.name);
        $(".authenticated").show();
    });

    $.get("/error", function(data) {
        if (data) {
            $(".error").html(data);
        } else {
            $(".error").html('');
        }
    });
</script>
</body>

</html>