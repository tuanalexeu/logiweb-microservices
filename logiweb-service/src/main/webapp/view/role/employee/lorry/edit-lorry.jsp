<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Edit truck - Logiweb</title>
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
        <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/homePage">
            <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
            <div class="sidebar-brand-text mx-3"><span>Logiweb</span></div>
        </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/employee/orders"><i class="fas fa-table"></i><span>Orders</span></a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/employee/drivers"><i class="fas fa-table"></i><span>Drivers</span></a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/employee/lorries"><i class="fas fa-table"></i><span>Lorries</span></a></li>
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
                <h3 class="text-dark mb-4">Edit truck</h3>
                <form:form action="/employee/edit-lorry" method="post" modelAttribute="editLorry" id="editLorryForm">
                    <form:hidden path="regNum" value="${editLorry.regNum}"/>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 style="margin: 10px;">Shift time</h3>
                                </div>
                                <div class="col-md-6">
                                    <form:input type="number" min="0" max="10000" id="shiftTime" required="required" path="shiftTime" cssErrorClass="errorBox" cssStyle="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px"/>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 style="margin: 10px;">Capacity</h3>
                                </div>
                                <div class="col-md-6">
                                    <form:input type="number" min="1000" max="50000" id="capacity" required="required" path="capacity" cssErrorClass="errorBox" cssStyle="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px"/>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 style="margin: 10px;">Status</h3>
                                </div>
                                <div class="col-md-6">
                                    <div class="dropdown">
                                        <form:select  path="broken"  cssStyle="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">
                                            <form:option value="true">Broken</form:option>
                                            <form:option value="false">Serviceable</form:option>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 style="margin: 10px;">City</h3>
                                </div>
                                <div class="col-md-6">
                                    <div class="dropdown">
                                        <form:select path="city.name"  cssStyle="background: #ffffff; color: #e20074; border-color: #e20074; border-radius: 5px; margin: 8px">
                                            <c:forEach items="${cities}" var="city">
                                                <form:option value="${city}">${city}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>

                <div class="modal-footer">
                    <form action="${pageContext.request.contextPath}/employee/lorries">
                        <button class="btn btn-light" href="/employee/drivers" style="color: rgb(226,0,116);background: rgb(255,255,255);border-color: rgb(226,0,116);">Back</button>
                    </form>
                    <form action="/employee/delete-lorry/${editLorry.regNum}">
                        <button class="btn btn-light" type="submit" style="color: rgb(226,0,116);background: rgb(255,255,255);border-color: rgb(226,0,116);">Delete</button>
                    </form>
                    <button form="editLorryForm" class="btn btn-primary" type="submit" style="background: rgb(255,255,255);border-color: rgb(226,0,116);color: rgb(226,0,116);">Save</button>
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