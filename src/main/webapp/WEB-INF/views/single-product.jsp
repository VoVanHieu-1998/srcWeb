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

<div class="modal fade" id="popup_cmt_form" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel1" aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="border-radius: revert;">
            <div class="modal-header">
                <h5 class="modal-title exampleModalLabel1" id="exampleModalLabel1">Hãy nhập thông tin của bạn</h5>
            </div>
            <div class="modal-body">
                <form id="comment-form" name="form-comment"
                      action="${pageContext.request.contextPath}/comment/add"
                      method="post" name="commentForm">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Họ
                            tên(<span style="color: red;">*</span>):</label> <input style="border-radius: revert;" type="text" class="form-control"
                                                                                    id="recipient-name" name="name">
                        <p id="errHoten" style="color: red;"></p>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Số điện
                            thoại:</label>
                        <%--<textarea class="form-control" id="message-text" name="sdt"></textarea>--%>
                        <input style="border-radius: revert;" type="number" class="form-control"
                               id="message-text" name="sdt">

                        <p id="errSdt" style="color: red;"></p>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Email</label>
                        <%--<textarea class="form-control"  name="email"></textarea>--%>

                        <input style="border-radius: revert;" type="email" class="form-control"
                               name="email">
                        <p id="errEmail" style="color: red;"></p>
                    </div>
                    <input type="hidden" name="productId" value="${product.productId}"
                           id="productId_cmt">
                    <input type="hidden" name="cmtContent" id="lastCmtContent" value="">

                    <p id="errCmt" style="color: red;"></p>
                    <p id="errProduct" style="color: red;"></p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-close"
                                data-dismiss="modal" style="border-radius: revert;">Thoát</button>
                        <button type="submit" class="btn btn-primary">Gửi</button>
                    </div>
                </form>
                <hr />
                <div id="errorMsg">${error}</div>
            </div>



        </div>
    </div>
</div>

<!-- modal -->
<div class="modal fade" id="popup_cmt_form_reply" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="border-radius: revert;">
            <div class="modal-header">
                <h5 class="modal-title exampleModalLabel" id="exampleModalLabel">Hãy nhập thông tin của bạn</h5>

            </div>
            <div class="modal-body">
                <form id="reply-form" name="form-comment"
                      action="${pageContext.request.contextPath}/reply/add"
                      method="post" name="commentForm">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Họ
                            tên(<span style="color: red;">*</span>):</label> <input style="border-radius: revert;" type="text" class="form-control"
                                                                                    name="name">
                        <p id="errHotenReply" style="color: red;"></p>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Số điện
                            thoại:</label>
                        <%--<textarea class="form-control" name="sdt"></textarea>--%>
                        <input style="border-radius: revert;" type="number" class="form-control" name="sdt">

                        <p id="errSdtReply" style="color: red;"></p>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Email:</label>
                        <%--<textarea class="form-control"  name="email"></textarea>--%>
                        <input style="border-radius: revert;" type="email" class="form-control" name="email">

                        <p id="errEmailReply" style="color: red;"></p>
                    </div>
                    <input type="hidden" name="commentId" value="" id="commentId">

                    <input type="hidden" name="replyContent" id="lastReplyContent"
                           value="">

                    <p id="errReply" style="color: red;"></p>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-close"
                                data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send
                            Comment</button>
                    </div>
                </form>
                <hr />
                <div id="errComment" >${error}</div>
            </div>



        </div>
    </div>
</div>


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

                        <a class="elem" id="present-picture"
                           href="<c:url value='/resources/${product.getImageArr()[1]}'/>"
                           data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[1]}'/>">
                            <img class="callImage"  src="<c:url value='/resources/${product.getImageArr()[1]}'/>" alt="">
                        </a>
                        <a class="elem active"
                           href="<c:url value='/resources/${product.getImageArr()[1]}'/>"
                           data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[1]}'/>">
                            <img class="callImage"  src="<c:url value='/resources/${product.getImageArr()[1]}'/>" alt="">
                            <span class="rect"></span>
                        </a>
                        <c:forEach items="${product.imageArr}" varStatus="loop" begin="1">
                            <a class="elem "
                               href="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>"
                               data-lcl-thumb="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>">
                                <img src="<c:url value='/resources/${product.getImageArr()[loop.index]}'/>" alt="">
                            </a>
                        </c:forEach>

                </div>
            </div>
            <div class="col-md-6">
                <div class="info-price">
                    <div class="card flex-md-row mb-4 h-md-250 title">
                        <div class="card-body d-flex flex-column align-items-start" id="code"
                             data-code="${product.productCode}">
                            <strong id="nameProduct" value-productId="${product.productId}"
                                    class="d-inline-block mb-2 text-primary">${product.name}
                            </strong>


                        </div>
                    </div>
                    <div class="card flex-md-row mb-4 h-md-250 price">
                        <div class="card-body d-flex flex-column align-items-start">
                            <div>
                                <c:forEach var="item"
                                           items="${product.productDetails}"
                                           varStatus="loop">
                                    <c:if test="${loop.first}">
                                        <div id="detailID" style="display: none">
                                                ${item.productdetailId}
                                        </div>
                                        <strong id="price" value-price="${item.price}"
                                                class="d-inline-block mb-2 priceee"
                                                style="font-size: 20px; color: #5A88C9">${myUtils.convertToVndCurrency(item.price)}</strong>
                                        <p id="promotionPrice"
                                           value-PromotionPrice="${item.promotion_price}"> ${myUtils.convertToVndCurrency(item.promotion_price)}</p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="mb-1 text-muted" style="color: #2A91D8">Chọn màu</div>
                            <div class="linked-products f-left">
                                <div class="linked" id="priceByColor">
                                    <c:forEach var="c" items="${product.productDetails}" varStatus="loopPD">
                                        <input id="id_proDetail_${loopPD.index}" type="hidden"
                                               name="cc">

                                        <input id="productdetailId" data-value="${c.productdetailId}" type="hidden"
                                               name="cc">

                                        <a class="btn-prince item i-12825 ${loopPD.first?"active":""}"
                                           onclick="ajaxCallImgByColor(this,${c.productdetailId},${product.productId })"
                                           id="a_color_${loopPD.index}"
                                           title="${c.color_proDetail.name }" >
                                            <span id="pd_detail_title_${loopPD.index}"><i
                                                    class="iconmobile-opt"></i>${c.color_proDetail.name }</span>
                                            <strong class="itemprice" id="pd_detail_price_${loopPD.index}"
                                                    value-color="${c.price}"
                                                    class="priceByColor">${myUtils.convertToVndCurrency(c.price)}</strong>
                                        </a>

                                        <input id="idProductDetail" type="hidden">
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="quantity-row">
                                <div class="mb-1 text-muted">Số lượng</div>
                                <div class="quantity quantity-trash">
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
                                </div>
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
                                    <button onclick="addToCart()"
                                            class="btn btn-primary btn-lg text-center col-sm-6 btn-addcart">Thêm vào giỏ
                                        hàng
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
                                        Nhận xét của khách hàng
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                            <div class="product__details__tab__desc">
                                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                                    <div class="product__details__tab__desc">
                                                        <h6>Xin chào!!!</h6>

                                                        <div style="width: 100%; font-size: 20px;">
                                                            <div class="f-left form-add"
                                                                 style="border: 1px solid #dadada; border-radius: 5px !important;">
                                                                <div class="main_form"
                                                                     style="display: block; width: 100%; height: 100%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s; -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;">

												<textarea class="form-control" name="detail"
                                                          style="overflow: auto; border: none; border-radius: 5px; padding: 10px !important;"
                                                          id="review_field" cols="5" rows="5"
                                                          placeholder="Xin mời để lại câu hỏi!"></textarea>

                                                                    <div class="f-left user_action_wrap"
                                                                         style="border-top: 1px solid #dadada; padding: 10px 5px;">

                                                                        <div class="cmt_right" style="float: right;">
                                                                            <a data-toggle="modal"
                                                                               data-target="#popup_cmt_form"
                                                                               style="padding: 5px 25px; height: 20px; font-size: 14px; color: #fff; text-transform: uppercase; border: 1px solid #e11b1e; border-radius: 4px; background: #e11b1e; margin: 0;"
                                                                               data-backdrop="static"
                                                                               data-keyboard="false"
                                                                               class="button" href="javascript:void(0)"
                                                                               id="btnSendCmt"
                                                                               onclick="sendCmt();">Gửi</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <ul style="padding: 0 !important; list-style: none;"
                                                                data-index="1" data-load="0" data-count="">

                                                                <c:forEach items="${comments }" var="c">
                                                                    <li
                                                                            style="margin-top: 10px; list-style-type: none; width: 100%; float: left !important;">
                                                                        <div>
                                                                                <%--javascript:void(0) không ăn sự kiện thẻ a--%>
                                                                            <a style="color: #d70018; text-decoration: none;"
                                                                               href="javascript:void(0)">
                                                                                <div
                                                                                        style="float: left; width: 25px; height: 25px; background: #ddd; margin-right: 7px; text-align: center; color: #666; text-transform: uppercase; font-size: 12px; line-height: 26px; font-weight: 600; text-shadow: 1px 1px 0 rgba(255, 255, 255, .2);">
                                                                                    Hi
                                                                                </div>
                                                                                <strong
                                                                                        style="float: left; overflow: hidden; line-height: 22px; margin-top: 2px; text-transform: capitalize; font-size: 14px; color: #000;">
                                                                                        ${c.name }</strong></a>
                                                                        </div>

                                                                        <div class="question"
                                                                             style="display: block; overflow: hidden; position: relative; margin: 0; font-size: 13px; color: #333; line-height: 24px; clear: both; float: none; width: auto; padding: 10px 0 10px 30px;">
                                                                            <p style="font-size: 20px;">${c.content }</p>
                                                                        </div>

                                                                        <div class="question"
                                                                             style="display: block; overflow: hidden; position: relative; margin: 0; font-size: 13px; color: darkred; line-height: 24px; clear: both; float: none; width: auto; padding: 10px 0 10px 30px;">
                                                                            <span><span>Bởi :</span> ${c.name }</span> |
                                                                            <span> Ngày ${c.createDate}</span>

                                                                        </div>

                                                                        <div class="actionuser"
                                                                             style="display: block; height: 34px; position: relative; margin: -5px 10px 0 0; font-size: 14px; color: #333; line-height: 24px; margin-bottom: 6px; padding-left: 25px;">
                                                                            <a href="javascript:void(0)"
                                                                               class="respondent"
                                                                               style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
                                                                               onclick="reply(${c.commentId})"> <i
                                                                                    style="display: inline-block; font: normal normal normal 14px/1 FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;"
                                                                                    class="fa fa-commenting"
                                                                                    aria-hidden="true"></i> Trả lời
                                                                            </a>

                                                                        </div>


                                                                        <c:forEach items="${c.replies }" var="r">
                                                                            <div class="reply_list"
                                                                                 style="position: relative; background: #eee; margin-bottom: 10px; width: calc(100% - 30px); float: right; border: 1px solid #dadada; border-radius: 5px; padding: 15px 15px 0;">
															<span
                                                                    style="width: 100%; position: absolute; z-index: 2; top: -18px; color: #eee; text-align: left; left: 8px;">
																<font
                                                                        style="position: absolute; top: 2px; left: 0; z-index: 1;"
                                                                        class="fa fa-caret-up fa-2x"></font><font
                                                                    style="color: #dadada; position: absolute; top: 1px; left: 0; z-index: 0;"
                                                                    class="fa fa-caret-up fa-2x"></font>
															</span>
                                                                                <div
                                                                                        style="display: block; position: relative; clear: both; font-size: 14px; color: #333; line-height: 24px; padding: 0;"
                                                                                        class="cmt_item rep_item" id="">
                                                                                    <div class="rowuser">
                                                                                        <c:choose>
                                                                                            <c:when test="${r.user_reply != null }">
                                                                                                <a
                                                                                                        style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
                                                                                                        href="javascript:void(0)">
                                                                                                    <div class="cmt_admin"></div>
                                                                                                    <strong> ${r.user_reply.name }</strong></a>
                                                                                                <b class="qtv"
                                                                                                   style="background: #e11b1e; border-radius: 2px; padding: 0 5px; line-height: normal; border: 1px solid #e11b1e; font-size: 11px; color: #fff; font-weight: 400; display: inline-block; margin: 5px 0 0 10px;">QTV</b>


                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <a
                                                                                                        style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
                                                                                                        href="javascript:void(0)">
                                                                                                    <div class="cmt_admin"></div>
                                                                                                    <strong> ${r.name }</strong></a>


                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </div>
                                                                                    <div class="question"
                                                                                         style="display: block; overflow: hidden; position: relative; margin: 0; font-size: 13px; color: #333; line-height: 24px; clear: both; float: none; width: auto; padding: 10px 0 10px 30px;">
                                                                                            ${r.content} <br>
                                                                                    </div>
                                                                                    <div class="actionuser"
                                                                                         style="display: block; height: 34px; position: relative; margin: -5px 10px 0 0; font-size: 14px; color: #333; line-height: 24px; margin-bottom: 6px; padding-left: 25px;">
                                                                                        <a href="javascript:void(0)"
                                                                                           class="respondent"
                                                                                           style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
                                                                                           onclick="reply(${c.commentId})">
                                                                                            <i
                                                                                                    style="display: inline-block; font: normal normal normal 14px/1 FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;"
                                                                                                    class="fa fa-commenting"
                                                                                                    aria-hidden="true"></i>
                                                                                            Trả
                                                                                            lời
                                                                                        </a><a
                                                                                            style="float: left; padding: 5px 0; font-size: 13px; text-decoration: none; color: #999; position: relative;"
                                                                                            href="javascript:void(0)"
                                                                                            class="time">| 2 tiếng
                                                                                        trước</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach> <br/>
                                                                        <div class="f-left form-add"
                                                                             id="txt_cmt_${c.commentId }"
                                                                             style="border: 1px solid #dadada; display: none; border-radius: 5px !important;">
                                                                            <div class="main_form"
                                                                                 style="display: block; width: 100%; height: 100%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s; -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;">

															<textarea class="form-control" name="detail"
                                                                      style="overflow: auto; border: none; border-radius: 5px; padding: 10px !important;"
                                                                      id="review_field_reply_${c.commentId }" cols="5"
                                                                      rows="5"
                                                                      placeholder="Xin mời để lại câu hỏi!"></textarea>

                                                                                <div class="f-left user_action_wrap"
                                                                                     style="border-top: 1px solid #dadada; padding: 10px 5px;">

                                                                                    <div class="cmt_right"
                                                                                         style="float: right;">
                                                                                        <a data-toggle="modal"
                                                                                           data-target="#popup_cmt_form_reply"
                                                                                           style="padding: 5px 25px; height: 20px; font-size: 14px; color: #fff; text-transform: uppercase; border: 1px solid #e11b1e; border-radius: 4px; background: #e11b1e; margin: 0;"
                                                                                           data-backdrop="static"
                                                                                           data-keyboard="false"
                                                                                           class="button"
                                                                                           href="javascript:void(0)"
                                                                                           onclick="sendReply();">Gửi</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </c:forEach>

                                                            </ul>


                                                        </div>

                                                    </div>
                                                    <div class="tab-pane" id="tabs-3" role="tabpanel">
                                                        <div class="product__details__tab__desc"></div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
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
                                <div>

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


<script src="<c:url value='/resources/js/numeral.min.js' />"
        type="text/javascript"></script>
<script src="<c:url value='/resources/js/utils.js' />"></script>
<%@include file="layout/client/scroll-top.jsp" %>

<%@include file="import/jsImport.jsp" %>

<%@include file="layout/client/footer.jsp" %>

<script>
    function addToCart() {
        const id = $('#detailID').text().trim()
        $.ajax({
            type: "GET",
            url: "<c:url value='/api/cart/add?productDetailId=' />" + id,
            success: function (res) {
                // refesh fage
                location.reload();
            }
        });
    }
    function ajaxCallImgByColor(btnTag, productdetailId, productId) {
        $('#detailID').text(productdetailId)
        $('.btn-prince').removeClass('active')
        $(btnTag).addClass('active')
        $.ajax({
            type: "GET",
            url: "/CDWEB2020/api/getImgProductDetail/" + productdetailId,
            success: function (res) {
                console.log(res);
                var price = document.getElementById("price");
                var img = document.getElementById("img_main");
               /* $(".callImage").attr("src","<c:url value='/resources/${res.img_url}'/>");*/


                $(".callImage").attr("src","/CDWEB2020/resources/"+res.img_url);

              /*  img.setAttribute("src","/didongxanh"+res.img_url);*/
                $('.priceee').each(function () {
                    $(this).text(formatNumber(res.price, ',', '.'));
                })


            }
        });
    }
</script>

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
    function sendCmt() {
        var lastCmtContent = document.getElementById("lastCmtContent");
        var productId = document.getElementById("productId_cmt");
        lastCmtContent.value = document.getElementById("review_field").value;
        console.log(lastCmtContent.value);
        console.log(productId.value);
    }

    function sendReply() {

        var lastReplyContent = document.getElementById("lastReplyContent");

        lastReplyContent.value = document.getElementById("review_field_reply_" + document.getElementById("commentId").value).value;
        console.log("content " + lastReplyContent.value);
        console.log("comment id" + document.getElementById("commentId").value);

    }

    function reply(idCmt) {


        document.getElementById("commentId").value = idCmt;
        console.log("id comment " + document.getElementById("commentId").value);
        document.getElementById("txt_cmt_" + idCmt).style.display = "block";
    }

    $(".btn-close").click(function () {
        location.reload();
    })


    //khi comment form submit
    $('#comment-form').on('submit', function (event) {
        var form = $(this);
        // if (form.data('requestRunning')) {
        //     return;
        // }
        //
        // form.data('requestRunning', true);
        //ngăn không cho mở liên kết url
        event.preventDefault();
        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: form.serialize(),
            success: function (res) {
                console.log("đây là res--------1-1-1-1-1-1-" + res);
                if (res) {
                    if (res.status == "FAIL") {
                        for (var i = 0; i < res.result.length; i++) {
                            if (res.result[i].code == "cmtContent") {
                                var cmt = document.getElementById("errCmt");
                                cmt.innerHTML = res.result[i].defaultMessage;

                            }
                            if (res.result[i].field == "name") {
                                var name = document.getElementById("errHoten");
                                name.innerHTML = res.result[i].code;
                            }

                            if (res.result[i].field == "email") {


                                var email = document.getElementById("errEmail");
                                email.innerHTML = res.result[i].code;
                            }


                        }

                    } else {
                        location.reload();
                    }

                } else {
                    location.reload();
                }

            }

        });

    });


    $('#reply-form').on('submit', function (event) {


        var form = $(this);

        /* if (form.data('requestRunning')) {
             return;
         }

         form.data('requestRunning', true);
         //ngăn không cho mở liên kết url*/
        event.preventDefault();

        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: form.serialize(),
            success: function (res) {
                console.log(res);
                if (res) {
                    if (res.status == "FAIL") {
                        for (var i = 0; i < res.result.length; i++) {
                            if (res.result[i].code == "replyContent") {

                                var cmt = document.getElementById("errReply");
                                cmt.innerHTML = res.result[i].defaultMessage;

                            }

                            if (res.result[i].field == "name") {


                                var name = document.getElementById("errHotenReply");
                                name.innerHTML = res.result[i].code;
                            }

                            if (res.result[i].field == "email") {


                                var email = document.getElementById("errEmailReply");
                                email.innerHTML = res.result[i].code;
                            }


                        }
                    } else {
                        location.reload();
                    }

                } else {
                    location.reload();
                }

            }


        });

    });


</script>
<!-- Viewer -->

</body>
</html>
