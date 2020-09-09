<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<c:import url="layout/client/header.jsp"/>
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
<div class="container ">
    <div class="detail-product ">
        <div class="row mb-2">
            <div class="col-md-6">
                <div class="content_pictures">
                    <c:if test="${fn:length(product.imageArr)>0}">
                        <a class="elem" id="present-picture"
                           href="<c:url value='/resources/${product.getImageArr()[1]}'/>"
                           data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[1]}'/>">
                            <img src="<c:url value='/resources/${product.getImageArr()[1]}'/>" alt="">
                        </a>
                        <a class="elem active"
                           href="<c:url value='/resources/${product.getImageArr()[1]}'/>"
                           data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[1]}'/>">
                            <img src="<c:url value='/resources/${product.getImageArr()[1]}'/>" alt="">
                            <span class="rect"></span>
                        </a>
                        <c:forEach items="${product.imageArr}" varStatus="loop" begin="2">
                            <a class="elem "
                               href="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>"
                               data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>">
                                <img src="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>" alt="">
                            </a>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="col-md-6">
                <div class="info-price">
                    <div class="card flex-md-row mb-4 h-md-250 title">
                        <div class="card-body d-flex flex-column align-items-start" id="code" data-code="${product.productCode}">
                            <strong id="nameProduct" value-productId="${product.productId}"
                                    class="d-inline-block mb-2 text-primary">${product.name}
                            </strong>
                        </div>
                    </div>
                    <div class="card flex-md-row mb-4 h-md-250 price">
                        <div class="card-body d-flex flex-column align-items-start">
                            <div><strong id="price" value-price="${product.price}"
                                         class="d-inline-block mb-2 "
                                         style="font-size: 20px; color: #5A88C9">${myUtils.convertToVndCurrency(product.price)}</strong>
                                <p id="promotionPrice"
                                   value-PromotionPrice="${product.getPromotionPrice()}"> ${myUtils.convertToVndCurrency(product.getPromotionPrice())}</p>
                            </div>
                            <div class="mb-1 text-muted" style="color: #2A91D8">Chọn màu</div>
                            <div class="linked-products f-left">
                                <div class="linked">
                                    <a class="item i-17613 "
                                       href="https://cellphones.com.vn/samsung-galaxy-note-10-plus.html"
                                       title="Samsung Galaxy Note 10+ (Plus)" style=" ">
                                        <span><i class="iconmobile-opt"></i>Note 10 Plus</span>
                                        <strong class="itemprice">17.000.000&nbsp;₫</strong>
                                    </a>
                                    <a class="item i-12825 active"
                                       href="https://cellphones.com.vn/samsung-galaxy-note-10-chinh-hang.html"
                                       title="Samsung Galaxy Note 10" style=" ">
                                        <span><i class="iconmobile-opt"></i>Note 10</span>
                                        <strong class="itemprice">16.200.000&nbsp;₫</strong>
                                    </a>
                                </div>
                            </div>
                            <div>
                                <c:forEach var="itemmau" items="${product.productDetails}">
                                    <label id="productdetailId" data-value="${itemmau.productdetailId}" style="color: #000; background-color: #667E99;position: relative; cursor: pointer; opacity: 1; max-width: 100%;">
												<span id="pd_detail_title"
                                                      style="color: #000; float: left; width: 100%;">${itemmau.color_proDetail.name }</span>
                                        <span id="pd_detail_price"
                                              value-color="${itemmau.price}"
                                              class="priceByColor"
                                              style="color: #d70018;">${myUtils.convertToVndCurrency(itemmau.price)}</span>
                                    </label>


                                    <%--<button type="button" giatien_theomau="${myUtils.convertToVndCurrency(itemmau.price)}" class="btn btn-primary">${itemmau.color_proDetail.name}</button>--%>
                                </c:forEach>
                            </div>
                            <div class="quantity-row">
                                <div class="mb-1 text-muted">Số lượng</div>
                                <div class="quantity">
                                    <a class="btn btn-outline-primary trash minus"
                                       href="http://localhost:8080/ProjectWeb02/CartServlet?action=quantity_Down&amp;id=IP1164">
                                        <i class="fas fa-minus"></i>
                                    </a>
                                    <input type="number" class="quantity enter_Quantity"
                                           onkeyup="inputQuantity('IP1164', this)" value="1">
                                    <a class="btn btn-outline-primary trash plus"
                                       href="http://localhost:8080/ProjectWeb02/CartServlet?action=quantity_Up&amp;id=IP1164">
                                        <i class="fas fa-plus"></i>
                                    </a></div>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <a href="proceed-to-checkout.jsp"
                                       class="btn btn-outline-primary btn-lg text-center col-sm-6">Mua ngay
                                    </a>
                                    <%-- <%
                                         User user = (User) session.getAttribute("user");
                                         if (user != null) {
                                     %>--%>
                                    <a
                                            class="btn btn-primary btn-lg text-center col-sm-6 btn-addcart">Thêm vào giỏ hàng
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {


        $(".btn-addcart").click(function(){

            var productId= $("#nameProduct").attr("value-productId");


            var productdetailId=$("#productdetailId").attr("data-value");

            console.log('alo?????????????????')
            $.ajax({
                url:"/CDWEB2020/api/product/"+productdetailId,
                type :"GET",
                data:{
                    productId:productId

                },
                success: function (value) {

                }
            }).done(function () {
                $.ajax({
                    url:"/CDWEB2020/api/getquantitycart",
                    type :"GET",

                    success: function (value) {
                        $("#quantitycartheader").html("<span>" + value + "</span>");
                    }
                })
            })


        });

    });
</script>
<%--Spec--%>
<div class="container">
    <div class="row mb-1">
        <div class="col-md-12">
            <div class="card flex-md-row mb-4 box-shadow h-md-250">
                <div class="card-body d-flex flex-column align-items-start">
                    <div id="accordion" class="col-md-12">
                        <div class="card col-md-12">
                            <div class="card-header col-md-12" id="headingOne">
                                <h5 class="mb-0 col-md-12">
                                    <button class="btn btn-link col-md-12" data-toggle="collapse"
                                            data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Cấu hình sản phẩm
                                    </button>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                 data-parent="#accordion">
                                <table class="table table-borderless">
                                    <c:forEach var="specdetail" items="${spec.specDetails}">

                                        <tr>
                                            <td>${specdetail.name} :</td>
                                            <td>${specdetail.value}</td>
                                        </tr>

                                    </c:forEach>

                                </table>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed col-md-12" data-toggle="collapse"
                                            data-target="#collapseTwo" aria-expanded="false"
                                            aria-controls="collapseTwo">
                                        Đánh giá chi tiết sản phẩm
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <div><h2>Đánh giá chi tiết Samsumg Note 10</h2></div>
                                    <div><strong>Tuyệt tác của thiết kế với màn hình Infinity-O độc đáo lần đầu tiên đã
                                        xuất hiện. Không đơn thuần là một chiếc điện thoại, Samsung Note 10 còn là đỉnh
                                        cao của công nghệ.</strong></div>

                                    <div><img src="img/h4-slide.png" height="365" width="1163"/></div>
                                    <div><strong>Màn hình vô cực Infinity-O, xóa bỏ mọi giới hạn</strong></div>
                                    <div><p>Gần như toàn bộ phần viền màn hình đã được loại bỏ trên Samsung Galaxy S10,
                                        không có tai thỏ, không bị hạn chế tầm nhìn, trước mắt bạn là màn hình cực lớn
                                        6,1 inch hiển thị vô cùng sống động. Viền cong siêu mỏng tràn cả 4 cạnh kết hợp
                                        cùng các đường cắt laser chuẩn xác khéo léo giấu kín camera nằm ngay trên màn
                                        hình. Galaxy S10 xứng đáng được gọi là một kiệt tác ngay trên tay bạn.</p></div>

                                    <div><img src="img/h4-slide2.png" height="362" width="1161"/></div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed col-md-12" data-toggle="collapse"
                                            data-target="#collapseThree" aria-expanded="false"
                                            aria-controls="collapseThree">
                                        Đánh giá & Nhận xét sản phẩm
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    Bởi: Lục Văn Tố &ensp; vào ngày &ensp;03/10/2019<br>
                                    Mua về ko sử dụng đc vân tay ko biết là tại may hay miến dan màn hinh Tất cả dùng ổn
                                    <hr>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    Bởi: Thành &ensp; vào ngày &ensp;31/08/2019<br>
                                    Máy này dùng k có gì để chê cả. Chơi game bao mượt luôn.nhưng mới mua trả góp cho
                                    người yêu được 2 ngày thì nó chia tay giờ phải cắm đầu để trả nợ.vì vậy chỉ cho 1
                                    sao
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--suggestions product-->
<div class="suggestions">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                           role="tab" aria-controls="nav-home" aria-selected="true">Điện thoại đồng giá</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                           role="tab" aria-controls="nav-profile" aria-selected="false">Điện thoại cùng hàng</a>
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
                                    <div class="row">
                                        <c:forEach var="list" items="${list}">
                                            <div class="product col-sm-3 col-12">
                                                <a href="<c:url value="/DetailProduct/${list.productId }" />">
                                                    <img src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <!-- Dien thoai noi bat -->
                        <!-- Laptop noi bat -->
                        <section class="products">
                            <!--                            <div class="container">-->
                            <!--                                <div class="sectionTitle">-->
                            <!--&lt;!&ndash;                                    <a href="#"><h2>Laptop nổi bật nhất</h2></a>&ndash;&gt;-->

                            <!--                                    <div class="section-menu">-->
                            <!--                                        <ol class="breadcrumb">-->
                            <!--                                            <li><a href="#"><h2>Apple</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>Samsung</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>Nokia</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>OPPO</h2></a></li>-->
                            <!--                                        </ol>-->
                            <!--                                    </div>-->
                            <!--                                </div>-->
                            <div class="list-product">
                                <div class="product-item">
                                    <div class="row">
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
                                                     alt="">
                                                <div class="content">
                                                    <h3>iPhone 11 Pro Max 256GB</h3>
                                                    <div class="price">
                                                        <strong>37.999.000₫</strong>
                                                        <span>32.999.000₫</span>
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
                                        </div><!-- Kết thúc một sản phẩm -->
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
                                                     alt="">
                                                <div class="content">
                                                    <h3>iPhone 11 Pro Max 256GB</h3>
                                                    <div class="price">
                                                        <strong>37.999.000₫</strong>
                                                        <span>32.999.000₫</span>
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
                                        </div><!-- Kết thúc một sản phẩm -->
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
                                                     alt="">
                                                <div class="content">
                                                    <h3>iPhone 11 Pro Max 256GB</h3>
                                                    <div class="price">
                                                        <strong>37.999.000₫</strong>
                                                        <span>32.999.000₫</span>
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
                                        </div><!-- Kết thúc một sản phẩm --><!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
                                                     alt="">
                                                <div class="content">
                                                    <h3>iPhone 11 Pro Max 256GB</h3>
                                                    <div class="price">
                                                        <strong>37.999.000₫</strong>
                                                        <span>32.999.000₫</span>
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
                                        </div><!-- Kết thúc một sản phẩm --><!-- Một sản phẩm -->
                                    </div>
                                </div>
                            </div>
                            <!--                            </div>-->
                        </section> <!-- End Laptop noi bat -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end suggestions product-->


<%@include file="import/jsImport.jsp"%>

<%@include file="layout/client/footer.jsp"%>

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
</script>
<!-- Viewer -->
<%@include file="layout/client/scroll-top.jsp" %>

</body>
</html>
