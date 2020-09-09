
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/fontawesome/all.min.css' />">
    <!-- Custom CSS -->

    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/responsive.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/index.css' />">
</head>
<body>
<%@include file="parts/header.jsp"%>
<form:form method="POST" action="bill/addbill" modelAttribute="bill">
    <table>
        <tr>
            <td><form:label path="namecustomer">Tên khách hàng</form:label></td>
            <td><form:input path="namecustomer" /></td>
        </tr>
        <tr>
            <td><form:label path="phone">Số điện thoại</form:label></td>
            <td><form:input path="phone" /></td>
        </tr>
        <tr>
            <td><form:label path="addressdelivery">Địa chỉ</form:label></td>
            <td><form:textarea path="addressdelivery" /></td>
        </tr>
        <tr>
            <td><form:label path="note">Ghi chú</form:label></td>
            <td><form:input path="note" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit" /></td>
        </tr>

    </table>
</form:form>

<%@include file="parts/footer.jsp"%>
<script src="<c:url value='/resources/js/jquery.js' />"></script>


<!-- Bootstrap-->

<script src="<c:url value='/resources/js/bootstrap4/popper.min.js' />"></script>
<!--<script src="js/bootstrap4/jquery-3.3.1.slim.min.js"></script>-->


<script src="<c:url value='/resources/js/bootstrap4/bootstrap.min.js' />"></script>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
<script src="js/jquery.sticky.js"></script>
<script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>

<!-- jQuery easing -->

<script src="<c:url value='/resources/js/jquery.easing.1.3.min.js' />"></script>
<!-- Main Script -->

<script src="<c:url value='/resources/js/main.js' />"></script>
<!-- Slider -->

<script src="<c:url value='/resources/js/bxslider.min.js' />"></script>
<script type="text/javascript" src="js/script.slider.js"></script>
<script src="<c:url value='/resources/js/script.slider.js' />"></script>
</body>
</html>
