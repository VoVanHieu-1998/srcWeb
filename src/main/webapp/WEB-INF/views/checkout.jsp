<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <%-- Import css files --%>
    <c:import url="import/cssImport.jsp"/>

    <link rel="stylesheet" href="<c:url value='/resources/css/cart.css' />">
    <script
            src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
    <script src="/resources/js/numeral.min.js"></script>

    <script src="/resources/js/utils.js"></script>
</head>
<body>

<%-- Import header--%>
<jsp:include page="/header"></jsp:include>
<jsp:useBean id="myUtils" class="com.cdweb.utils.MyUtils"/>
<%--<jsp:useBean id="myUtils" class="com.cdweb."/>--%>
<%--<%--%>
<%--    //    User user = (User) session.getAttribute("user");--%>
<%--//    if (user != null) {--%>
<%--//        Cart c = user.getCart();--%>
<%--//        ArrayList<CartItem> list = null;--%>
<%--//        if (c != null) {--%>
<%--//            list = new ArrayList<>(c.list());--%>
<%--//        }--%>
<%--//        String code = "";--%>
<%--%>--%>
<%--<jsp:useBean id="user" scope="request" type=""/>--%>
<c:set var="items" target="object" scope="session" value="${user.cart.data}"/>

<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Xác nhận giỏ hàng</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<%--<%if (!(list.size() == 0)) {%>--%>
<c:choose>
    <c:when test="${user!=null}">
        <c:choose>
            <c:when test="${items!=null && fn:length(items)>0 }">
                <!--Content cart-->
                <div id="content-cart">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8">
                                <div id="left-content">

                                    <div class="row">
                                        <div class="col-sm-12 p-0">
                                            <div class="module no-item" id="no-item"
                                                 style="text-align: center; margin-top: 50px; display: none;">
                                                <i class="fa fa-frown-o fa-4x"
                                                   style="margin-bottom: 30px; font-size: 9em; display: inline-block; font: normal normal normal 30px FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;"></i>
                                                <p
                                                        style="font-size: 22px; font-weight: 300; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px;">Không
                                                    có sản phẩm nào trong giỏ hàng, vui lòng tải lại trang</p>

                                                <a href="<c:url value="/"/>" class="btn btn-default btn-sm"
                                                   id="backPD"
                                                   style="margin-top: 30px; font-size: 11px; background-image: linear-gradient(to bottom, #fff 0, #e0e0e0 100%); background-repeat: repeat-x; border-color: #ccc;">Quay
                                                    về trang chủ</a>
                                            </div>
                                            <div id="products" style="display: block">



                                                <c:forEach var="item" items="${items}" varStatus="loop" >
                                                    <c:if test="${item.value.status > 0}">
                                                    <div class="one-product">
                                                        <div class="row">
                                                            <div class="col-sm-7 cart-item">

                                                                    <span>${loop.index+1}</span>


                                                                <a href='<c:url value="/DetailProduct/${item.value.productDetail.product.code}" />'>
                                                                    <div class="img-wrap">
                                                                        <img src='<c:url value="/resources/${item.value.productDetail.product.getImageArr()[0]}" /> '
                                                                             alt="">
                                                                    </div>
                                                                    <div class="content">
                                                                        <div class="title">${item.value.productDetail.product.name}
                                                                        </div>
                                                                        <div class="describe">Sang trọng lĩnh lãm</div>
                                                                        <div class="color">
                                                                            Màu: <span
                                                                                style="border: 2px ${item.value.productDetail.color_proDetail.name_eng} solid;:">${item.value.productDetail.color_proDetail.name}</span>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="col-sm-2 cart-item-price">
                                                                <div id="price" data-value="${item.value.productDetail.promotion_price}" class="current-price price">${myUtils.convertToVndCurrency(item.value.productDetail.promotion_price)}
                                                                </div>
                                                                <div class="origin-price">${myUtils.convertToVndCurrency(item.value.productDetail.price)}
                                                                </div>
                                                                <c:if test="${item.value.productDetail.price-item.value.productDetail.promotion_price>0}">
                                                                    <div class="promotion-ration">
                                                                        - ${myUtils.convertToVndCurrency(item.value.productDetail.price-item.value.productDetail.promotion_price)}
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-sm-3 quantity-trash">

                                                                <span >Số lượng : <span id="quantity" data-value="${item.value.itemQuantity}">${item.value.itemQuantity}</span> </span>


                                                                <button class="btn btn-outline-primary trash float-right trash-item"
                                                                        data-toggle="modal"
                                                                        data-product-id="${item.value.itemId.productdetailId}"
                                                                        data-target="#exampleModal">
                                                                    <i class="far fa-trash-alt"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="right-content" class="col-sm-4">

                                <div id="fullname">
                                    <div class="title1">Tên khách hàng</div>
                                    <div class="user-address">
                                        <i class="fas fa-user"></i>
                                        <p>${user.fullName}</p>
                                    </div>
                                </div>
                                <div id="address1">
                                    <div class="title1">Địa chỉ</div>
                                    <div class="user-address">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <p>${user.address}</p>
                                    </div>
                                </div>
                                <div id="phoneNumber">
                                    <div class="title1">Số điện thoại</div>
                                    <div class="user-address">
                                        <i class="fas fa-phone"></i>
                                        <p>${user.phoneNumber}</p>
                                    </div>
                                </div>
                                <div id="emailkhachhang">
                                    <div class="title1">Email</div>
                                    <div class="user-address">
                                        <i class="fas fa-envelope-square"></i>
                                        <p>${user.email}</p>
                                    </div>
                                </div>
                                <div id="sumary-order">
                                    <div class="title1">
                                        Thông tin đơn hàng
                                    </div>
                                    <div class="total-price-products">

                                    </div>


                                    <div class="sum-price">
                                        <div class="checkout-order-total-row">
                                            <div class="checkout-order-total-title">Tổng cộng: <span style="color: red" id="totalprice"></span></div>

                                        </div>
                                        <a id="order" class="btn btn-primary col-sm-12" href="<c:url value="/checkout/add/order"/>">Đặt hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End content cart-->
            </c:when>
            <c:otherwise>
                <div class="container" style="padding: 100px;text-align: center;">
                    <div class="cart-empty-text">Không có sản phẩm nào trong giỏ hàng</div>
                    <br>
                        <%--    <a href="<%=Util.fullPath("")%>" class="btn btn-outline-primary btn-lg">TIẾP TỤC MUA SẮM</a>--%>
                </div>
            </c:otherwise>
            <%--<%}%>--%>
        </c:choose>
    </c:when>
    <%--    <!--End Delete product-->--%>
    <c:otherwise>
        <%--<%} else {%>--%>
        <div class="container">
            <div class="sign">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="sign-in">Đăng nhập</h5>
                            <button data-dismiss="modal" data-toggle="modal" data-target="#sign-up-model"
                                    class="btn btn btn-outline-primary text-right">Đăng ký
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="XuLyDangNhap">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email"
                                           name="username" placeholder="Tên đăng nhập">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="password"
                                           name="password" placeholder="Mật khẩu"> <a
                                        class="float-right p-2" href="#" data-toggle="modal"
                                        data-target="#forgot-pass-model" data-dismiss="modal">Quên
                                    mật khẩu</a>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-primary"
                                            data-dismiss="modal">Trở lại
                                    </button>
                                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<%}%>--%>
    </c:otherwise>
</c:choose>

<!--Modal Delete product-->
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa khỏi giỏ hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>

                    <a class="btn btn-primary"
                       href=<c:url value="/checkout/delete/"/>>ĐỒNG Ý</a>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    ganTongTienGioHang();

    function ganTongTienGioHang(isEventChange) {
        var totalMoney = 0;

        $(".price").each(
            function() {
                var price = $(this).attr("data-value");
                var quan = $("#quantity").attr("data-value");
                var sum = parseInt(quan)
                var money = parseInt(price) * sum;

                totalMoney = totalMoney + money;

                $("#totalprice").html( formatNumber(totalMoney,",","."));
                // $('#totalprice').each(
                //     function() {
                //         $(this).text(
                //            formatNumber(this.text(),",","."));
                //     });

            });

    };
    $("#order").click(function () {
        var noItem = document.getElementById("no-item");
        noItem.style.display = "block";

    })


</script>
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Bạn đã đặt hàng thành công</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">


                    <a class="btn btn-primary"
                       href=<c:url value="/"/>>Tiếp tục mua hàng</a>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Dành riêng cho bạn -->
<section class="products">
    <div class="container">
        <div class="sectionTitle">
            <a href="#"><h2>Dành riêng cho bạn</h2></a>

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
                    <!-- Một sản phẩm -->
                    <div class="product col-sm-3 col-12">
                        <a href="single-product.jsp">
                            <img src="img/products/mobile/iphone/iphoneX/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                </div>
            </div>
        </div>
    </div>
</section> <!-- End dien thoai noi bat -->


<%-- Import footer--%>
<c:import url="layout/client/scroll-top.jsp"/>
<c:import url="layout/client/footer.jsp"/>

<%-- Import js files --%>
<c:import url="import/jsImport.jsp"/>

<!-- Main Script -->
<script src="<c:url value='/resources/js/main.js' />"></script>




<script>



    function allChecked() {
        var check = true;
        var checkboxes = document.getElementsByClassName("checkbox");
        for (var i = 0; i < checkboxes.length; i++) {
            if (!checkboxes[i].checked) {
                check = false;
            }
        }
        console.log(check);
        return check;
    }

    // call proceed2CheckoutServlet
    function proceed2CheckoutServlet(item) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                location.reload();
            }
        };
        xhttp.open("GET", "CartServlet?action=proceed2Checkout&id=" + item, true);

        xhttp.send();
    }

    // get id from modal, send request delete to server
    //triggered when modal is about to be shown
    var href = $('#exampleModal').find('.modal-footer').find('a').attr("href");
    $('#exampleModal').on('show.bs.modal', function (e) {
        $('.modal-body').html("Bạn có đồng ý loại bỏ sản phẩm này khỏi đơn hàng?");
        var hrefFix = href;
        var productId = $(e.relatedTarget).data('product-id');
        if (productId != undefined) {
            // console.log(href);
            $('#exampleModal').find('.modal-footer').find('a').attr("href", hrefFix + productId);
        }

        // process select multi
        var productMulId = $(e.relatedTarget).data('productmul-id');
        if (productMulId != undefined) {
            $('.modal-body').html("Bạn có chắc chắn muốn xóa các mục này không?");
            var st = "";
            var checkboxes = document.getElementsByClassName("checkbox");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    st += checkboxes[i].getAttribute('data-id') + ":";
                }
            }

            // console.log(href);
            $('#exampleModal').find('.modal-footer').find('a').attr("href", hrefFix + st);
        }
    });
</script>

</body>
</html>
