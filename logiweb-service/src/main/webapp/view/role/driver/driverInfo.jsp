<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Driver info - Logiweb</title>
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
        <div class="container-fluid d-flex flex-column p-0">
            <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/homePage">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                <div class="sidebar-brand-text mx-3"><span>Logiweb</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/driver/info"><i class="fas fa-table"></i><span>My info</span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand shadow mb-4 topbar static-top" style="background: #ffffff;">
                <ul class="navbar-nav ml-auto flex-nowrap">
                    <li class="nav-item" style="padding: 5px">
                        <form action="${pageContext.request.contextPath}/profile">
                            <button class="btn btn-primary" type="submit" style="background: #ffffff; color: #e20074; border-color: #e20074;">Profile</button>
                        </form>
                    </li>
                    <li class="nav-item" style="padding: 5px">
                        <form action="${pageContext.request.contextPath}/logout">
                            <button class="btn btn-primary" type="submit" style="background: #ffffff; color: #e20074; border-color: #e20074;">Log out</button>
                        </form>
                    </li>
                </ul>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-1" style="padding: 5px;">My driver info</h3>
                <c:if test="${not empty message}">
                    <p class="text-dark mb-1" style="color:#ca2819; adding: 5px;">${message}</p>
                </c:if>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>${driver.firstName} ${driver.lastName}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>ID</td>
                            <td>${driver.id}</td>
                        </tr>
                        <tr>
                            <td>Lorry number</td>
                            <td>${driver.lorry.regNum}</td>
                        </tr>
                        <tr>
                            <td>My status</td>
                            <td>
                                <div class="dropdown" style="border-color: rgb(226,0,116);color: rgb(226,0,116);">
                                    <button class="btn btn-primary dropdown-toggle" aria-expanded="false" data-toggle="dropdown" type="button" style="color: rgb(226,0,116);background: rgb(255,255,255);border-color: rgb(226,0,116);">${driver.state} </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                            <form action="${pageContext.request.contextPath}/driver/save" method="post">
                                                <button type="submit" value="RESTING" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Resting</button>
                                            </form>
                                        </a>
                                        <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                            <form action="${pageContext.request.contextPath}/driver/save" method="post">
                                                <button type="submit" value="DUTY" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Duty</button>
                                            </form>
                                        </a>
                                        <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                            <form action="${pageContext.request.contextPath}/driver/save" method="post">
                                                <button type="submit" value="DRIVING" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Driving</button>
                                            </form>
                                        </a>
                                        <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                            <form action="${pageContext.request.contextPath}/driver/save" method="post">
                                                <button type="submit" value="UNLOADING" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Unloading</button>
                                            </form>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>${driver.order.id}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Co-drivers ID list</td>
                            <td>
                                <c:if test="${empty driver.order}">
                                    <p>No order assigned</p>
                                </c:if>
                                <c:if test="${not empty driver.order}">
                                    <a href="#codrivers-modal" data-toggle="modal" data-target="#codrivers-modal" style="color: #e20074">View</a>
                                </c:if>
                                <div class="modal fade" role="dialog" tabindex="-1" id="codrivers-modal">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" style="color: rgb(133, 135, 150);">Drivers</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                                            </div>
                                            <div class="modal-body" style="color: #858796;border-color: #e20074;">
                                                <ul>
                                                    <c:forEach items="${coDrivers}" var="user">
                                                        <li>${user.id} ${user.firstName} ${user.lastName}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal" style="border-color: #e20074;color: #e20074;">Ok</button></div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Route points</td>
                            <td>
                                <c:if test="${empty driver.order}">
                                    <p>No order assigned</p>
                                </c:if>
                                <c:if test="${not empty driver.order}">
                                    <a href="#routepoints-modal" data-toggle="modal" data-target="#routepoints-modal" style="color: #e20074">View</a>
                                </c:if>
                                <div class="modal fade" role="dialog" tabindex="-1" id="routepoints-modal">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" style="color: rgb(133, 135, 150);">Route points</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                                            </div>
                                            <div class="modal-body" style="color: #858796;border-color: #e20074;">
                                                <ul>
                                                    <c:forEach items="${route.cityList}" var="city" varStatus="loop">
                                                        <li>[${loop.index}] ${city.name}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-light" type="button" data-dismiss="modal" style="border-color: #e20074;color: #e20074;">Ok</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="card shadow" style="margin-bottom: 10px">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 font-weight-bold">Loads</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label>Show&nbsp;<select class="form-control form-control-sm custom-select custom-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">

                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
<%--                                    <th>Load id</th>--%>
                                    <th>Description</th>
                                    <th>City (Loading)</th>
                                    <th>City (Unloading)</th>
                                    <th>Weight</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${loads}" var="load">
                                    <tr>
<%--                                        <td>${load.id}</td>--%>
                                        <td>${load.name}</td>
                                        <td>${load.cityLoad.name}</td>
                                        <td>${load.cityUnload.name}</td>
                                        <td>${load.weight}</td>
                                        <td>
                                            <button class="btn btn-primary dropdown-toggle" aria-expanded="false" data-toggle="dropdown" type="button" style="color: rgb(226,0,116);background: rgb(255,255,255);border-color: rgb(226,0,116);">${load.status} </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                                    <form action="${pageContext.request.contextPath}/driver/save-load">
                                                        <input type="hidden" name="loadId" value="${load.id}">
                                                        <button type="submit" value="PREPARED" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Prepared</button>
                                                    </form>
                                                </a>
                                                <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                                    <form action="${pageContext.request.contextPath}/driver/save-load">
                                                        <input type="hidden" name="loadId" value="${load.id}">
                                                        <button type="submit" value="SENT" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Sent</button>
                                                    </form>
                                                </a>
                                                <a class="dropdown-item" style="background: #ffffff; color: #e20074; border-color: #e20074;">
                                                    <form action="${pageContext.request.contextPath}/driver/save-load">
                                                        <input type="hidden" name="loadId" value="${load.id}">
                                                        <button type="submit" value="DELIVERED" name="status" style="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">Delivered</button>
                                                    </form>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
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
<script src="<c:out value="/assets/js/chart.min.js"/>"></script>
<script src="<c:out value="/assets/js/bs-init.js"/>"></script>
</body>

</html>