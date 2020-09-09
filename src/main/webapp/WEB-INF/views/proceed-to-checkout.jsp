<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/fontawesome/all.min.css' />">
    <!-- Custom CSS -->
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/responsive.css' />">

    <link rel="stylesheet" href="<c:url value='/resources/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/cart.css' />">
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
</head>
<body>


<c:import url="/header"/>
<jsp:useBean id="myUtils" class="com.cdweb.utils.MyUtils"/>




<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Kiểm tra đơn hàng</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<!--Content cart-->
<div id="content-cart">
    <div class="container">
        <div class="row">
            <div id="left-content" class="col-sm-8">
                <c:forEach var="list" items="${listgiohang}">
                <div id="products">


                        <div class="one-product">
                            <div class="row">
                                <div class="col-sm-6 cart-item">
                                    <a href="single-product.jsp">
                                        <div class="img-wrap">
                                            <img src="img/products/mobile/iphone/iphoneX/iphone-11-pro-max-256gb-black-600x600.jpg"
                                                 alt="">
                                        </div>
                                        <div class="content">
                                            <div id="productIdAjax" value-productId="${list.productdetailId}" class="title">${list.nameProduct}</div>
                                            <div class="describe">Sang trọng lĩnh lãm</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-sm-2 cart-item-price">
                                    <div class="current-price" value-Price ="${list.price}" >${list.price} ₫</div>
                                    <div class="origin-price" value-promotionPrice ="${list.promotionPrice}">${list.promotionPrice} ₫</div>
                                    <div class="promotion-ration">-15%</div>
                                </div>
                                <div class="col-sm-4 quantity-trash">
                                    <div class="quantity-products">
                                        Số lượng:
                                        <span id="quantityproductdetail" value-quantyti="${list.quantity}" class="font-weight-bolder">${list.quantity}</span>
                                    </div>
                                    <button class="btn btn-outline-primary trash float-right trash-item" data-toggle="modal"
                                            data-target="#exampleModal">
                                        <i class="far fa-trash-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                </div>
                    </c:forEach>

            </div>
            <div id="right-content" class="col-sm-4">
                <%--Cos Session User sẽ get ra được thông tin User--%>
                <div id="address">
                    <div class="title">
                        Thanh toán vận chuyển
                    </div>
                    <div class="user-address">
                        <div class="user-name"><i class="fas fa-map-marker-alt colorBlue"></i>
                            <span class="user-name"> Trần Minh Hùng</span>
                            <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
                        </div>
                        <div class="address">
                            <span class="house">53 - Đ.106</span>
                            <span class="city">Phường Tăng Nhơn Phú A, Quận 9, Hồ Chí Minh</span>
                        </div>
                    </div>
                    <div class="user-phone user">
                        <i class="fas fa-phone-alt colorBlue"></i>
                        <span>0346533636</span>
                        <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
                    </div>
                    <div class="user-email user">
                        <i class="fas fa-envelope colorBlue"></i>
                        <span>15117018@st.hcmuaf.edu.vn</span>
                        <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
                    </div>
                </div>
                <div id="sumary-order">
                    <div class="title">
                        Thông tin đơn hàng
                    </div>
                    <div class="total-price-products">
                        <div class="total-products">Tạm tính (0 sản phẩm)</div>
                        <div class="total-price float-right">0 ₫</div>
                    </div>
                    <div class="delivery-fee">
                        <div class="delivery-label">Phí giao hàng</div>
                        <div class="fee float-right">0 ₫</div>
                    </div>
                    <div class="discount">
                        <input class="col-sm-7" type="text" placeholder="Nhập mã giảm giá">
                        <button type="button" class="btn btn-outline-primary col-sm-4">Áp dụng</button>
                    </div>
                    <div class="sum-price">
                        <div class="checkout-order-total-row">
                            <div class="checkout-order-total-title">Tổng cộng</div>
                            <div class="checkout-order-total-fee">0 ₫
                                <small>Đã bao gồm VAT (nếu có)</small>
                            </div>
                        </div>
                        <a class="btn btn-primary col-sm-12" href="<c:url value="/cart"/>">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End content cart-->

<!--Delete product-->
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
                <div class="modal-body">
                    Bạn có đồng ý loại bỏ sản phẩm này khỏi đơn hàng?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                    <button type="button" class="btn btn-primary">ĐỒNG Ý</button>
                </div>
            </div>
        </div>
    </div>
</div><!--End Delete product-->

<script>
    $(document).ready(function(){
        $("#delete-product").click(function() {


            var productdetailId= $("#productIdAjax").attr("value-productId");
            console.log("Xóa Id chi tiết sản phẩm :"+productdetailId);
            $.ajax({
                url:"/CDWEB2020/api/deleteProductInCart/"+productdetailId,
                type :"GET",

                success: function (value) {
                    $("#products").remove();


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
        })
    });


</script>

<%@include file="layout/client/footer.jsp"%>


<!--  jQuery  -->
<script src="<c:url value='/resources/js/jquery.js' />"></script>

<!-- Bootstrap-->
<script src="<c:url value='/resources/js/bootstrap4/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap4/bootstrap.min.js' />"></script>

<!-- jQuery sticky menu -->
<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
<script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>

<!-- jQuery easing -->
<script src="<c:url value='/resources/js/jquery.easing.1.3.min.js' />"></script>


<%@include file="layout/client/scroll-top.jsp"%>
</body>
</html>
