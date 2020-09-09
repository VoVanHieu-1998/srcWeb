<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <%-- Import css files --%>
    <c:import url="import/cssImport.jsp"/>

    <link rel="stylesheet" href="<c:url value='/resources/css/slider.css' />">

</head>
<body>

<%-- Import header--%>
<%--<c:import url="layout/client/header.jsp"/>--%>

<jsp:useBean id="myUtils" class="com.cdweb.utils.MyUtils"/>
<c:import url="/header"/>

<section class="main-content">

    <div class="slider-area container">
        <!-- Slider -->
        <div class="homebanner">
            <div id="sync1" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                <div class="owl-wrapper-outer">
                    <div class="owl-wrapper"
                         style="width: 12640px; left: 0; display: block; transition: all 800ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img style="cursor:pointer"
                                         src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-1.gif"
                                         alt="Big" width="800" height="300">
                                </a>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-13.png"
                                            alt="Samsung Tet" width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-12.png"
                                            alt="Big OPPO" width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-9.png"
                                            alt="A51" width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/big-iphone-800-300-800x300-3.png"
                                            alt="iphone"
                                            width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/dong-ho-thoi-trang-800-300-800x300-1.png"
                                            alt="dong ho thoi trang" width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2020/01/banner/Apple-watch-tao-800-300-800x300.png"
                                            alt="Sắm Apple Watch" width="800" height="300"></a></div>
                        </div>
                        <div class="owl-item" style="width: 790px;">
                            <div class="item">
                                <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                    <img
                                            style="cursor:pointer"
                                            src="https://cdn.tgdd.vn/2019/12/banner/800-300-800x300-30.png"
                                            alt="phu kien" width="800" height="300"></a></div>
                        </div>
                    </div>
                </div>


                <div class="owl-controls clickable">
                    <div class="owl-buttons">
                        <div class="owl-prev">‹</div>
                        <div class="owl-next">›</div>
                    </div>
                </div>
            </div>
            <div id="sync2" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                <div class="owl-wrapper-outer">
                    <div class="owl-wrapper"
                         style="width: 2528px; left: 0; display: block; transition: all 200ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                        <div class="owl-item synced" style="width: 158px;">
                            <div class="item">
                                <h3>Tết Sắm Smartphone<br>Trúng 2020 Chuột Vàng</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Tết Sắm Samsung<br>Trúng 2020 Chuột Vàng</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Tết Sắm OPPO<br>Lì Xì 1 Triệu</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Tết Sắm Galaxy A51<br>Giảm Ngay 500 Ngàn</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Tết Sắm iPhone Online<br>Lì Xì Đến 3 Triệu</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Đồng Hồ Thời Trang<br>Giảm Đến 30%</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Tết Sắm Apple Watch<br>Giảm Đến 2 Triệu</h3>
                                <i class="arrowbar"></i>
                            </div>
                        </div>
                        <div class="owl-item" style="width: 158px;">
                            <div class="item">
                                <i class="arrowbarleft"></i>
                                <h3>Phụ Kiện Online<br>Giảm Đến 49%</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ./Slider -->
        <div class="homenews">
            <figure>
                <h2><a href="#">Tin công nghệ</a></h2>
                <b></b>
            </figure>
            <ul>
                <li>
                    <a href="#">
                        <img width="100" height="70"
                             src="https://cdn.tgdd.vn/Files/2020/01/20/1232330/thumb_800x450-100x100.jpg"
                             alt="Các bạn đã hay tin 'Thế Giới Di Động chuẩn bị mở bán Galaxy S10 Lite' chưa? Mau mau gom lúa chứ còn đợi gì nữa!">
                        <h3>Các bạn đã hay tin 'Thế Giới Di Động chuẩn bị mở bán Galaxy S10 Lite' chưa? Mau mau gom lúa
                            chứ
                            còn đợi gì nữa!</h3>
                        <span>13 phút trước</span>
                    </a>
                </li>
            </ul>
            <div class="twobanner">
                <a aria-label="slide" data-cate="0" data-place="1158"
                   href="https://www.thegioididong.com/dtdd/samsung-galaxy-a20s"
                ><img
                        style="cursor:pointer" src="https://cdn.tgdd.vn/2020/01/banner/398-110-398x110-3.png" alt="A20s"
                        width="398" height="110"></a>
                <a aria-label="slide" data-cate="0" data-place="1158" href="/khuyen-mai-tet#apple"
                ><img
                        style="cursor:pointer"
                        src="https://cdn.tgdd.vn/2020/01/banner/iphone-11-pro-398-110-398x110-1.png"
                        alt="iphone" width="398" height="110"></a></div>

        </div>
    </div> <!-- End slider area -->

    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <a href="#" target="_blank">
                    <img src='<c:url value="/resources/img/promotion2.jpg" /> '
                         alt="">
                </a>
            </div>
        </div>
    </div> <!-- End promo area -->

    <!-- Dien thoai noi bat -->
    <section id="section_1" class="products">
        <div class="container">
            <div class="sectionTitle">
                <a href="#"><h2>Điện thoại nổi bật nhất</h2></a>

                <div class="section-menu">
                    <ol class="breadcrumb">
                        <li><a href="#"><h2>Apple</h2></a></li>
                        <li><a href="#"><h2>Samsung</h2></a></li>
                        <li><a href="#"><h2>Nokia</h2></a></li>
                        <li><a href="#"><h2>OPPO</h2></a></li>
                    </ol>
                </div>
            </div>
            <div class="list-product">
                <div class="product-item">
                    <div id="product-item" class="row">
                        <!-- Một sản phẩm -->
                        <c:forEach var="item" items="${listmobile}">
                            <div class="product col-sm-3 col-12">
                                <a href='<c:url value="/DetailProduct/${item.productCode }" />'>
                                    <img src='<c:url value="/resources/${item.getImageArr()[0]}" /> '>
                                    <div class="content">
                                        <h3>${item.getName()}</h3>
                                        <div class="price">
                                            <strong > ${myUtils.convertToVndCurrency(item.promotionPrice)}</strong>
                                            <span >${myUtils.convertToVndCurrency(item.price)}</span>
                                        </div>
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                            <span>50 Đánh giá</span>
                                        </div>
                                       <%-- <c:if test="${item.price-item.promotionPrice>0}">
                                            <lablel class="discount">
                                                GIẢM ${myUtils.convertToVndCurrency(item.getPrice()-item.getPromotionPrice())}
                                            </lablel>
                                        </c:if>--%>
                                        <div class="promo">
                                            <p> Phiếu mua hàng trị giá 1 triệu</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- Kết thúc một sản phẩm -->

                        </c:forEach>
                    </div>
                </div>







            </div>
            <nav style="margin-left: 80%;" aria-label="Page navigation example">
                <ul class="pagination">


                    <c:forEach var = "i" begin = "1" end = "${tongsopage }">
                        <c:choose>
                            <c:when test="${i==1 }">
                                <li class="page-item active"><a class="page-link " href="#">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="#">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>


                </ul>
            </nav>
        </div>
    </section> <!-- End dien thoai noi bat -->

    <!-- Tablet noi bat -->
    <section id="section_2" class="products">
        <div class="container">
            <div class="sectionTitle">
                <a href="#"><h2>Tablet nổi bật nhất</h2></a>

                <div class="section-menu">
                    <ol class="breadcrumb">
                        <li><a href="#"><h2>Apple</h2></a></li>
                        <li><a href="#"><h2>Samsung</h2></a></li>
                        <li><a href="#"><h2>Nokia</h2></a></li>
                        <li><a href="#"><h2>OPPO</h2></a></li>
                    </ol>
                </div>
            </div>
            <div class="list-product">
                <div class="product-item">
                    <div class="row">
                        <c:forEach var="item" items="${listtablet}">
                            <div class="product col-sm-3 col-12">
                                <a href='<c:url value="/DetailProduct/${item.productCode }" />'>
                                    <img src='<c:url value="/resources/${item.getImageArr()[0]}" /> '
                                         alt="">
                                    <div class="content">
                                        <h3>
                                                ${item.getName()}
                                        </h3>
                                        <div class="price">
                                            <strong>
                                                    ${myUtils.convertToVndCurrency(item.getPromotionPrice())}
                                            </strong>
                                            <span>
                                                    ${myUtils.convertToVndCurrency(item.getPrice())}
                                            </span>
                                        </div>
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                            <span>50 Đánh giá</span>
                                        </div>
                                        <c:if test="${item.getPrice()-item.getPromotionPrice()>0}">
                                            <lablel class="discount">
                                                GIẢM ${myUtils.convertToVndCurrency(item.getPrice()-item.getPromotionPrice())}
                                            </lablel>
                                        </c:if>
                                        <div class="promo">
                                            <p> Phiếu mua hàng trị giá 1 triệu</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- Kết thúc một sản phẩm -->

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- End Tablet noi bat -->

    <!-- Laptop noi bat -->
    <section id="section_3" class="products">
        <div class="container">
            <div class="sectionTitle">
                <a href="#"><h2>Laptop nổi bật nhất</h2></a>

                <div class="section-menu">
                    <ol class="breadcrumb">
                        <li><a href="#"><h2>Apple</h2></a></li>
                        <li><a href="#"><h2>Samsung</h2></a></li>
                        <li><a href="#"><h2>Nokia</h2></a></li>
                        <li><a href="#"><h2>OPPO</h2></a></li>
                    </ol>
                </div>
            </div>
            <div class="list-product">
                <div class="product-item">
                    <div class="row">
                        <c:forEach var="item" items="${listlaptop}">
                            <div class="product col-sm-3 col-12">
                                <a href='<c:url value="/DetailProduct/${item.productCode }" />'>
                                    <img src='<c:url value="/resources/${item.getImageArr()[0]}" /> '
                                         alt="">
                                    <div class="content">
                                        <h3>
                                                ${item.getName()}
                                        </h3>
                                        <div class="price">
                                            <strong>
                                                    ${myUtils.convertToVndCurrency(item.getPromotionPrice())}
                                            </strong>
                                            <span>
                                                    ${myUtils.convertToVndCurrency(item.getPrice())}
                                            </span>
                                        </div>
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                            <span>50 Đánh giá</span>
                                        </div>
                                        <c:if test="${item.getPrice()-item.getPromotionPrice()>0}">
                                            <lablel class="discount">
                                                GIẢM ${myUtils.convertToVndCurrency(item.getPrice()-item.getPromotionPrice())}
                                            </lablel>
                                        </c:if>
                                        <div class="promo">
                                            <p> Phiếu mua hàng trị giá 1 triệu</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- Kết thúc một sản phẩm -->

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- End Laptop noi bat -->

    <!-- Phu kien noi bat -->
    <section id="section_4" class="products">
        <div class="container">
            <div class="sectionTitle">
                <a href="#"><h2>Phụ kiện nổi bật nhất</h2></a>

                <div class="section-menu">
                    <ol class="breadcrumb">
                        <li><a href="#"><h2>Apple</h2></a></li>
                        <li><a href="#"><h2>Samsung</h2></a></li>
                        <li><a href="#"><h2>Nokia</h2></a></li>
                        <li><a href="#"><h2>OPPO</h2></a></li>
                    </ol>
                </div>
            </div>
            <div class="list-product">
                <div class="product-item">
                    <div class="row">
                        <c:forEach var="item" items="${listphukien}">
                            <div class="product col-sm-3 col-12">
                                <a href='<c:url value="/DetailProduct/${item.productCode }" />'>
                                    <img src='<c:url value="/resources/${item.getImageArr()[0]}" /> '
                                         alt="">
                                    <div class="content">
                                        <h3>
                                                ${item.getName()}
                                        </h3>
                                        <div class="price">
                                            <strong>
                                                    ${myUtils.convertToVndCurrency(item.getPromotionPrice())}
                                            </strong>
                                            <span>
                                                    ${myUtils.convertToVndCurrency(item.getPrice())}
                                            </span>
                                        </div>
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                            <span>50 Đánh giá</span>
                                        </div>
                                        <c:if test="${item.getPrice()-item.getPromotionPrice()>0}">
                                            <lablel class="discount">
                                                GIẢM ${myUtils.convertToVndCurrency(item.getPrice()-item.getPromotionPrice())}
                                            </lablel>
                                        </c:if>
                                        <div class="promo">
                                            <p> Phiếu mua hàng trị giá 1 triệu</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- Kết thúc một sản phẩm -->

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- End phu kien -->
</section>


<%-- Import footer--%>
<c:import url="layout/client/scroll-top.jsp"/>
<c:import url="layout/client/footer.jsp"/>

<%-- Import js files --%>
<c:import url="import/jsImport.jsp"/>

<!-- Main Script -->
<script src="<c:url value='/resources/js/main.js' />"></script>
<script src="<c:url value='/resources/js/utils.js' />"></script>
<script src="<c:url value='/resources/js/numeral.min.js' />"></script>

<!-- Slider -->
<script src="<c:url value='/resources/js/bxslider.min.js' />"></script>
<script src="<c:url value='/resources/js/slider.js' />"></script>

<%--Scroll to catalog--%>
<div id="category_icon_floor" style="display: none">
    <ul>
        <li class="color-scroll1 scroll-section active ">
            <a data-spy="scroll" href="#section_1">
                <i class="fas fa-mobile-alt"></i>
                <span class="scroll_tooltip_1">Điện thoại</span>
            </a>
        </li>


        <li class="color-scroll2 scroll-section">
            <a data-spy="scroll" href="#section_2">
                <i class="fas fa-tablet-alt"></i>
                <span class="scroll_tooltip_2">Tablet</span>
            </a>
        </li>


        <li class="color-scroll3 scroll-section">
            <a data-spy="scroll" href="#section_3">
                <i class="fas fa-laptop"></i>
                <span class="scroll_tooltip_3">Laptop</span>
            </a>
        </li>
        <li class="color-scroll4 scroll-section">
            <a data-spy="scroll" href="#section_4">
                <i class="fas fa-headphones-alt"></i>
                <span class="scroll_tooltip_4">Phụ kiện</span>
            </a>
        </li>
    </ul>
</div>
<script>
    $(document).ready(function () {
        // Lấy danh sách các nút
        var idElements = $(".scroll-section");
        $(window).scroll(function () {
            if ($(window).scrollTop() > 650) {
                $('#category_icon_floor').fadeIn();
                for (var i = 0; i < idElements.length; i++) {
                    if ($(window).scrollTop() >= ($($(idElements[i]).children().attr("href")).offset().top - ($($(idElements[i]).children().attr("href")).offset().top / 4))) {
                        // Xóa hết class active
                        for (var j = 0; j < idElements.length; j++) {
                            $(idElements[j]).removeClass('active');
                        }
                        $(idElements[i]).addClass('active');
                    }
                }
            } else {
                $('#category_icon_floor').fadeOut();
            }
        });
        // scroll body to 0px on click
        $(".scroll-section").click(function () {
            $('body,html').animate({
                scrollTop: $($(this).children().attr("href")).offset().top
            }, 400);
            return false;
        });
    });
    /*$(".price-price").each(function () {
        $(this).text(numeral($(this).text()).format('0,0') + " VND");
    });*/
    $("body").on("click",".page-item",function(){
        $(".page-item").removeClass("active");
        $(this).addClass("active");
        var sotrang= $(this).text();
        var begin = (sotrang-1) * 5;

        $.ajax({
            url:"/CDWEB2020/api/listPd",
            type :"GET",
            data:{
                begin:begin,
            },
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (value) {
                console.log(value);
                var tbodysanpham= $("#product-item");
                tbodysanpham.empty();
                for (var i = 0; i < value.length; i++) {

                    tbodysanpham.append("<div class=\"product col-sm-3 col-12\">" +
                    "           <a href=\"<c:url value="/DetailProduct/" />" + value[i].productCode + "\" >" +
                    "           <img src=\"<c:url value="/resources/" />/" + value[i].imageArr[0] + " \">"  +
                    "           <div class=\"content\">"    +
                    "           <h3>"+value[i].name+"</h3>      " +
                    "           <div class=\"price\">"+
                    "           <strong >"+ formatNumber(value[i].promotionPrice, ',', '.') +"</strong>"+
                    "           <span >"+ formatNumber(value[i].price, ',', '.') +"</span>" +
                    "           </div>"+
                    "           <div class=\"rating\">"+
                    "           <i class=\"fas fa-star\"></i>"+
                    "           <i class=\"fas fa-star\"></i>"+
                    "           <i class=\"fas fa-star\"></i>"+
                    "           <i class=\"fas fa-star-half-alt\"></i>"+
                    "           <i class=\"far fa-star\"></i>"+
                    "           <span>50 Đánh giá</span>"+
                    "           </div>"+
                    "           <div class=\"promo\">" +
                    "           <p> Phiếu mua hàng trị giá 1 triệu</p>"+
                    "           </div>"+
                    "           </div>"+
                    "           </a>"+
                    "           </div>");
                }
            }
        })

    })
</script>
<%--End Scroll to catalog--%>
</body>
</html>
