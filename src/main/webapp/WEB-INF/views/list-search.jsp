<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <%-- Import css files --%>
    <c:import url="import/cssImport.jsp"/>

    <!-- Viewer -->
    <link rel="stylesheet" href="<c:url value='/resources/viewer/css/lc_lightbox.css' />">
    <!-- SKINS -->
    <link rel="stylesheet" href="<c:url value='/resources/viewer/skins/minimal.css' />">
    <!-- ASSETS -->
    <script src="<c:url value='/resources/viewer/lib/AlloyFinger/alloy_finger.min.js' />"
            type="text/javascript"></script>
    <!-- Viewer -->
    <link rel="stylesheet" href="<c:url value='/resources/css/single-product.css' />">


</head>
<body>

<%-- Import header--%>

<jsp:include page="/header"></jsp:include>
<jsp:useBean id="myUtils" class="com.cdweb.utils.MyUtils"/>


<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Điện thoại</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<div class="suggestions">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                           role="tab" aria-controls="nav-home" aria-selected="true">Các sản phẩm liên quan nội dung tìm kiếm:</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                           role="tab" aria-controls="nav-profile" aria-selected="false">${keys}</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <!-- Dien thoai noi bat -->
                        <section class="products">
                            <!--                            <div class="container">-->
                            <div class="sectionTitle">
                            </div>
                            <div class="list-product">
                                <div class="product-item">
                                    <div id="product-item" class="row">
                                        <c:forEach var="list" items="${listSearch}">
                                            <div class="product col-sm-3 col-12">
                                                <a href="<c:url value="/DetailProduct/${list.productCode }" />">
                                                    <img src="<c:url value="/resources/${list.getImageArr()[0]}" />"
                                                         alt="">
                                                    <div class="content">
                                                        <h3>${list.name}</h3>
                                                        <div class="price">
                                                            <strong>${myUtils.convertToVndCurrency(list.price)}</strong>
                                                            <span>${myUtils.convertToVndCurrency(list.promotionPrice)}</span>
                                                        </div>
                                                        <div class="rating">
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star-half-alt"></i>
                                                            <i class="far fa-star"></i>
                                                            <span>50 Đánh giá</span>
                                                        </div>
                                                        <lablel class="discount">GIẢM 2.000.000₫</lablel>
                                                        <div class="promo">
                                                            <p> Phiếu mua hàng trị giá 1 triệu</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach> <!-- Kết thúc một sản phẩm -->


                                    </div>
                                </div>
                            </div>
                            <!--                            </div>-->
                        </section> <!-- End dien thoai noi bat --></div>

                </div>
            </div>
        </div>

    </div>

</div>
<!--end suggestions product-->


<script src="<c:url value='/resources/js/numeral.min.js' />"
        type="text/javascript"></script>
<script src="<c:url value='/resources/js/utils.js' />"></script>
<%@include file="layout/client/scroll-top.jsp" %>

<%@include file="import/jsImport.jsp" %>

<%@include file="layout/client/footer.jsp" %>



<!-- Viewer -->
<script src="<c:url value='/resources/viewer/lib/jquery.js' />"
        type="text/javascript"></script>
<script src="<c:url value='/resources/viewer/js/lc_lightbox.lite.js' />"
        type="text/javascript"></script>
<!-- LIGHTBOX INITIALIZATION -->
<script type="text/javascript">
    $(document).ready(function (e) {
        // live handler
        lc_lightbox('.elem', {
            wrap_class: 'lcl_fade_oc',
            gallery: true,
            thumb_attr: 'data-lcl-thumb',

            skin: 'minimal',
            radius: 0,
            padding: 0,
            border_w: 0,
        });
    });

    <!-- HOVER PICTURE -->
    $('.elem').hover(function () {
        $('.elem').removeClass("active");
        $(this).addClass("active");
        $('#present-picture').removeClass("active");
        $('#present-picture').children("img").attr("src", $(this).children("img").attr("src"));
        $('#present-picture').attr("href", $(this).attr("href"));
        $('#present-picture').attr("data-lcl-thumb", $(this).attr("data-lcl-thumb"));
    });

    //comment ------------------------------------------------------------------




</script>
<!-- Viewer -->

</body>
</html>
