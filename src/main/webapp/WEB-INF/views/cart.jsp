<%@ page import="com.cdweb.entity.Users" %>
<%@ page import="com.cdweb.entity.CartItem" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
<c:set var="items" target="object" value="${user.cart.data}"/>

<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
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
                                    <div id="header-list">
                                        <div class="checkbox-wrap">
                                            <label class="label-wrap">
                                                <input type="checkbox" class="check-all check-box"
                                                       onclick="proceed2CheckoutServlet(-1)">
                                                <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <%--                                                <%int count = c == null ? 0 : c.totalItems();%>--%>
                                                    <%--                                                <span class="total">CHỌN TẤT CẢ (<%=count%> SẢN PHẨM)</span>--%>
                                            </label>
                                        </div>
                                        <div class="list-header-operations">
                                            <button class="btn btn-outline-primary trash float-right"
                                                    data-toggle="modal"
                                                    data-productmul-id="-1"
                                                    data-target="#exampleModal">
                                                <i class="far fa-trash-alt"></i>
                                                <span>Xóa</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 p-0">
                                            <div id="products">
                                                <c:forEach var="item" items="${items}">
                                                    <div class="one-product">
                                                        <div class="row">
                                                            <div class="col-sm-7 cart-item">
                                                                <div class="checkbox-wrap ">
                                                                    <label class="label-wrap">
                                                                        <input type="checkbox"
                                                                               class="check-box checkbox" ${item.value.status==1?"checked":""}
                                                                               onclick="changeStatus('${item.value.itemId.productdetailId}', this)"
                                                                               data-id="${item.value.productDetail.product.code}"
                                                                        >
                                                                        <span class="checkmark"><i
                                                                                class="fas fa-check"></i></span>
                                                                    </label>
                                                                </div>
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
                                                                <div class="current-price">${myUtils.convertToVndCurrency(item.value.productDetail.promotion_price)}
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
                                                                <button onclick="changeQuantity('${item.value.itemId.productdetailId}', this, 'down')"
                                                                        class="btn btn-outline-primary trash minus"
                                                                        href="#">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>
                                                                <input id="ip_quantity" type="number"
                                                                       class="quantity enter_Quantity"
                                                                       onkeyup="inputQuantity('${item.value.itemId.productdetailId}', this)"
                                                                       value="${item.value.itemQuantity}">
                                                                <button onclick="changeQuantity('${item.value.itemId.productdetailId}', this,'up')"
                                                                        class="btn btn-outline-primary trash plus"
                                                                        href="#">
                                                                    <i class="fas fa-plus"></i>
                                                                </button>
                                                                <button class="btn btn-outline-primary trash float-right trash-item"
                                                                        data-toggle="modal"
                                                                        data-product-id="${item.value.productDetail.productdetailId}"
                                                                        data-target="#exampleModal">
                                                                    <i class="far fa-trash-alt"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="right-content" class="col-sm-4">
                                <div id="address">
                                    <div class="title">Địa điểm</div>
                                    <div class="user-address">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span>${user.address}</span>
                                    </div>
                                </div>
                                <div id="sumary-order">
                                    <div class="title">
                                        Thông tin đơn hàng
                                    </div>
                                    <div class="total-price-products">
                                            <%--                                        <div class="total-products">Tạm tính (${user.cart.totalItemsCheckout()}--%>
                                            <%--                                            sản phẩm)--%>
                                            <%--                                        </div>--%>
                                            <%--                                        <div class="total-price float-right">${myUtils.convertToVndCurrency(user.cart.totalPriceItemsCheckout())}--%>
                                            <%--                                        </div>--%>
                                    </div>
                                    <div class="delivery-fee">
                                        Họ tên:
                                        <div class="delivery-label">${user.fullName}</div>
                                    </div>
                                        <%--                                    <div class="discount">--%>
                                        <%--                                        <input class="col-sm-7" type="text" placeholder="Nhập mã giảm giá">--%>
                                        <%--                                        <button type="button" class="btn btn-outline-primary col-sm-4">Áp dụng</button>--%>
                                        <%--                                    </div>--%>
                                    <div class="sum-price">
                                        <div class="checkout-order-total-row">
                                                <%--                                            <div class="checkout-order-total-title">Tổng cộng</div>--%>
                                                <%--                                            <div class="checkout-order-total-fee"><%=Util.convertToVndCurrency(user.getCart().totalPriceItemsCheckout())%>--%>
                                                <%--                                                <small>Đã bao gồm VAT (nếu có)</small>--%>
                                                <%--                                            </div>--%>
                                        </div>
                                        <a class="btn btn-primary col-sm-12" href="<c:url value="/checkout"/> ">Xác nhận
                                            giỏ
                                            hàng</a>
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
                       href="<c:url value='/api/cart/delete?productDetailId=' />">ĐỒNG Ý</a>
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


<!--Cart-js-->
<%--<script type="text/javascript" src="js/cart.js"></script>--%>
<!--End cart-js-->

<script>
    function changeQuantity(code, btn, type) {
        if (type === 'down') {
            const theInput = $(btn).parent().find('input')
            let quantity = $(theInput).val()
            if (quantity > 1) {
                quantity--
                inputQuantitySEND(code, quantity)
            }
            $(theInput).val(quantity)
        } else {
            const theInput = $(btn).parent().find('input')
            let quantity = $(theInput).val()
            quantity++
            $(theInput).val(quantity)
            inputQuantitySEND(code, quantity)
        }
    }

    function inputQuantity(code, input) {
        let quantity = $(input).val()
        if (quantity < 1) {
            quantity = 1
            $(input).val(quantity)
        }
        inputQuantitySEND(code, quantity)
    }

    function changeStatus(code, btn) {
        const status = $(btn).prop("checked");
        console.log('status' + status)
        $.ajax({
            url: "<c:url value="/api/cart/changeStatus?productDetailId="  />" + code + "&status=" + status,
            type: "GET",
            datatype: 'application/json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
            },
            success: function () {
                // location.reload();
            }
        });
    }

    function inputQuantitySEND(code, quantity) {
        $.ajax({
            url: "<c:url value="/api/cart/quantity?productDetailId="  />" + code + "&quantity=" + quantity,
            type: "GET",
            datatype: 'application/json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
            },
            success: function () {
                location.reload();
            }
        });
    }

    // check/ uncheck all check box
    $(".check-all").click(function () {
        $(".checkbox").prop("checked", $(this).is(':checked'));
    });

    $(".checkbox").click(function () {
        if (allChecked()) {
            $(".check-all").prop("checked", true);
        } else {
            $(".check-all").prop("checked", false);
        }
    });

    if (allChecked()) {
        $(".check-all").prop("checked", true);
    } else {
        $(".check-all").prop("checked", false);
    }

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
        // console.log("vô rồi ");
        xhttp.send();
    }

    // get id from modal, send request delete to server
    //triggered when modal is about to be shown
    var href = $('#exampleModal').find('.modal-footer').find('a').attr("href");
    $('#exampleModal').on('show.bs.modal', function (e) {
        $('.modal-body').html("Bạn có đồng ý loại bỏ sản phẩm này khỏi giỏ hàng?");
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
