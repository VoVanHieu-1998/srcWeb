<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery.js" />"></script>

<!--Sign in-->
<div class="sign">
    <div class="modal fade" id="sign-in-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sign-in">Đăng nhập</h5>
                    <button data-dismiss="modal" data-toggle="modal" data-target="#sign-up-model"
                            class="btn btn btn-outline-primary text-right">Đăng ký
                    </button>
                </div>
                <form id="signInForm" method="post" action="<c:url value='/api/sign/login' />">
                    <div class="modal-body">
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary"
                                data-dismiss="modal">Trở lại
                        </button>
                        <button type="submit" onclick="submitLogin(event)" class="btn btn-primary">Đăng nhập
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--Forgot pass modal-->
<div class="sign">
    <div class="modal fade" id="forgot-pass-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgot-pass">Đặt Lại Mật Khẩu</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="email-phone" class="col-form-label">Vui lòng nhập địa chỉ email hoặc số điện
                                thoại bạn đã đăng ký</label>
                            <input type="text" class="form-control" id="email-phone" placeholder="Email/ Số điện thoại">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                            data-target="#sign-in-model" data-dismiss="modal">Trở lại
                    </button>
                    <button type="button" class="btn btn-primary">Tiếp tục</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Sign up modal-->
<div class="sign">
    <div class="modal fade" id="sign-up-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sign-up">Đăng ký</h5>
                    <button data-toggle="modal" data-dismiss="modal" data-target="#sign-in-model"
                            class="btn btn btn-outline-primary text-right">Đăng nhập
                    </button>
                </div>
                <div class="modal-body">
                    <form action="XuLyDangKy" method="post">
                        <div class="form-group">
                            <input type="text" name="username" class="form-control"
                                   id="user-name1" placeholder="Tên đăng nhập">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control"
                                   id="user-email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input type="text" name="fullname" class="form-control"
                                   id="user-name" placeholder="Tên của bạn">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control"
                                   id="pass-number" placeholder="Mật khẩu">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="pass-number2"
                                   placeholder="Xác nhận mật khẩu">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary"
                                    data-toggle="modal" data-dismiss="modal"
                                    data-target="#sign-in-model">Trở lại
                            </button>
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Header contain--%>
<div id="header" class="header">
    <div class="header-wrap">
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-right p-0">
                        <div class="user-menu">
                            <ul>
                                <c:choose>
                                    <c:when test="${user==null}">
                                        <li><a href="" data-toggle="modal"
                                               data-target="#sign-in-model"><i class="fa fa-user"></i>Đăng
                                            nhập</a></li>

                                        <li><a href="#" data-toggle="modal"
                                               data-target="#sign-up-model"><i class="fas fa-user-plus"></i>
                                            Đăng ký</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="account.jsp"><i class="fa fa-user"></i>Tài
                                            khoản: ${user.username}
                                        </a></li>
                                        <li>
                                            <a href="" onclick="submitLogout(event)"><i
                                                    class="fas fa-user-plus"></i>
                                                Đăng xuất</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End header area -->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2 pl-0">
                        <div class="logo">
                            <h1>
                                <a href="<c:url value="/" />">
                                    <img src='<c:url value="/resources/img/logo.png" /> '
                                         alt="">
                                </a>
                            </h1>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="searchBar">
                            <form class="form-inline" action="<c:url value="/search/Product"/>" method="get">
                                <input required name="keys" class="form-control mr-sm-2 searchInput" type="text"
                                       placeholder="Bạn tìm gì..." oninput="this.setCustomValidity('')"
                                       aria-label="Search" onkeyup="debounce(showResult(), 5000)"
                                       onclick="onClinkInputSearch()"
                                       oninvalid="this.setCustomValidity('Bạn chưa nhập từ khóa tìm kiếm') ">
                                <button class="btn btn-primary my-2 my-sm-0" type="submit"><i
                                        class="fa fa-search"></i></button>

                                <!--Search result-->
                                <div class="fs-sresult" style="display: none">
                                    <div class="fs-sremain">
                                        <ul style="display: block;">
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-2 pr-0">
                        <div class="shopping-item">
                            <a href="<c:url value="/cart" />"> <i
                                    class="fa fa-shopping-cart"></i>
                                <c:if test="${user!=null}">
                                    <span class="product-count">
                                            ${user.cart.totalItems}
                                    </span>
                                </c:if>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="<c:url value="/" />">Trang chủ</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li><a href="<c:url value="/header" />">
                                        <i class="fas fa-mobile-alt"></i>
                                        Điện thoại</a>

                                        <!-- Sub menu -->
                                        <ul class="mn-sub">
                                            <li class="phone-bg">

                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${mobileMenu1}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>


                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${mobileMenu2}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>


                                            </li>
                                            <li class="phone-bg" class="hangCC">

                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${mobileMenu3}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>

                                            </li>
                                        </ul> <!-- End sub menu -->

                                    </li>
                                    <li><a href="<c:url value="/tablet" /> ">
                                        <i class="fas fa-tablet-alt"></i>
                                        Tablet</a>

                                        <!-- Sub menu -->
                                        <ul class="mn-sub tablet">
                                            <li class="phone-bg">
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${tablet1}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${tablet2}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${tablet3}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </li>

                                        </ul> <!-- End sub menu -->

                                    </li>
                                    <li><a href="<c:url value="/laptop" />">
                                        <i class="fas fa-laptop"></i>
                                        Laptop</a>
                                        <!-- Sub menu -->
                                        <ul class="mn-sub laptop">
                                            <li class="phone-bg">
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${laptop1}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${laptop2}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>

                                            </li>
                                            <%--<li class="phone-bg" class="hangCC">
                                                <ul class="clearlist menu-dt">
                                                    <li><a href="">Hàng cao cấp</a></li>
                                                    <li><a href="">Hàng trung cấp</a></li>
                                                    <li><a href="">Hàng phổ thông</a></li>
                                                </ul>
                                            </li>--%>
                                        </ul> <!-- End sub menu -->

                                    </li>
                                    <li><a href="phukien-products">
                                        <i class="fas fa-headphones-alt"></i>
                                        Phụ kiện</a>
                                        <!-- Sub menu -->
                                        <ul class="mn-sub phuKien">
                                            <li class="phone-bg">
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${phukien1}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                                <ul class="clearlist menu-dt">
                                                    <c:forEach var="item" items="${phukien2}">
                                                        <li><a href="">${item.menu_name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                                <%-- <ul class="clearlist menu-dt">
                                                     <li><a href="">Mobell</a></li>
                                                 </ul>--%>
                                            </li>
                                            <%--<li class="phone-bg" class="hangCC">
                                                <ul class="clearlist menu-dt">
                                                    <li><a href="">Hàng cao cấp</a></li>
                                                    <li><a href="">Hàng trung cấp</a></li>
                                                    <li><a href="">Hàng phổ thông</a></li>
                                                </ul>
                                            </li>--%>
                                        </ul> <!-- End sub menu -->
                                    </li>
                                    <li><a href="<c:url value="/about" />">
                                        Giới thiệu</a></li>
                                    <li><a href="<c:url value="/contact" />">
                                        Liên hệ</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- End mainmenu area -->
    </div>
</div>

<%--Search product--%>
<script src="<c:url value="/resources/js/utils.js" />"></script>
<script type="text/javascript">
    const dataJon = "[]";

    $(document).mouseup(function (e) {
        if ($(e.target).closest(".fs-sresult").length === 0) {
            $(".fs-sresult").hide();
        }
    });

    function onClinkInputSearch() {
        $(".fs-sresult").show();
    }

    function debounce(func, wait) {
        let timeout;

        return function executedFunction(...args) {
            const later = () => {
                timeout = null;
                func(...args);
            };

            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    function showResult() {
        var keys = $(".searchInput").val();
        if (!keys) {
            $(".fs-sresult").hide();
        } else {
            $(".fs-sresult").show();
            $.ajax({
                type: "GET",
                url: '<c:url value="/api/search/" />' + keys,
                // dataType: return
                // dataType: "application/json",
                headers: {
                    Accept: "application/json; charset=utf-8",
                    "Content-Type": "application/json; charset=utf-8"
                },
                error: function () {
                    $(".fs-sresult").find("ul>li").remove();

                    $(".fs-sresult").find("ul").append("" +
                        "<li class=\"black\">\n" +
                        "   <a \" href=\"#\">Không tìm thấy kết quả cho\n" +
                        "         <b><i>" + keys + "</i></b>\n" +
                        "   </a>\n" +
                        "</li>");
                },
                success: function (data) {
                    const a = JSON.stringify(data);
                    const obj = $.parseJSON(a);
                    var list = obj.data;

                    $(".fs-sresult").find("ul>li").remove();

                    for (let i = 0; i < list.length; i++) {
                        $(".fs-sresult").find("ul").append("<li><a href=\"<c:url value="/DetailProduct/" />" + list[i].productCode + "\">" +
                            "                                            <p>" +
                            "                                                <img src=\"<c:url value="/resources/" />/" + list[i].imageArr[0] + " \"" +
                            "                                                     alt=\"<c:url value="/resources/" />" + list[i].imageArr[0] + " \">" +
                            "                                            </p>" +
                            "                                            <div>" +
                            "                                               <h3>" + list[i].name + "</h3>" +
                            "                                               <p class=\"fshop-search-prodprice\">" + formatNumber(list[i].promotionPrice, ',', '.') + "</p></div>" +
                            "                                 </a></li>");
                        // obj[i].name;
                    }
                    $(".fs-sresult").find("ul").append("" +
                        "<li class=\"black\">\n" +
                        "   <a \" href=\"SearchPageServlet?keys=" + keys + "\">Hiển thị kết quả cho\n" +
                        "         <b><i>" + keys + "</i></b>\n" +
                        "   </a>\n" +
                        "</li>");
                }
            });
        }
    }

</script>

<%--SIGN IN--%>
<script>
    function submitLogin(event) {
        var formSe = $('form[id="signInForm"]');
        event.preventDefault(); //prevent default action
        console.log('submit sign in');
        var post_url = formSe.attr("action"); //get form action url
        var request_method = formSe.attr("method"); //get form GET/POST method
        var form_data = formSe.serialize();
        $.ajax({
            url: post_url,
            type: request_method,
            data: form_data,
            datatype: 'application/json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function (data) {
                var json = JSON.stringify(data.responseJSON);
                var obj = $.parseJSON(json);
                console.log('data')
                console.log(data)
                if (data.status === 422) {
                    if (obj.errors.username) {
                        console.log(obj.username);
                        $('#email').parent().find('.error').remove();
                        $('#email').parent().append('<div class="error" style="color:red">' + obj.errors.username + '</div>');
                    }
                    if (obj.errors.password) {
                        console.log(obj.password);
                        $('#password').parent().find('.error').remove();
                        $('#password').parent().append('<div class="error" style="color:red">' + obj.errors.password + '</div>');
                    }
                }
                if (data.status === 401) {
                    if (obj.message) {
                        console.log(obj.message);
                        $('.modal-body').find('.errorSign').remove();
                        $('.modal-body').prepend('<div class="errorSign" style="color:red">' + obj.message + '</div>');
                    }
                }
            },
            success: function (data) {
                // var json = JSON.stringify(data);
                // var obj = $.parseJSON(json);

                $('.modal-body').find('.errorSign').remove();
                // $('#signInForm').modal('hide');
                // $("[data-dismiss=modal]").trigger({type: "click"});
                $('#sign-in-model').modal('hide')

                // refesh fage
                location.reload();
            }
        });
    }

    // remove div error on click input IN signin
    $('#email').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#password').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
</script>

<%--SIGN OUT--%>
<script>
    function submitLogout(event) {
        event.preventDefault()
        $.ajax({
            url: "<c:url value="/api/sign/logout" />",
            type: "GET",
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function (data) {
                console.log(data)
                alert("error");
            },
            success: function (data) {
                // refesh fage
                location.reload();
            }
        });
    }
</script>


<%--Sticky menu--%>
<script>
    var scrollableElement = document.body; //document.getElementById('scrollableElement');
    var menu = document.getElementById("header");
    // scrollableElement.addEventListener('scroll', checkScrollDirection);

    // function checkScrollDirection(event) {
    //     if (checkScrollDirectionIsUp(event)) {
    //         //console.log('UP');
    //         menu.classList.remove("header-sticky");
    //     } else {
    //         //console.log('Down');
    //        // if (document.body.scrollTop > 0) {
    //             menu.classList.add("header-sticky");
    //         //}
    //     }
    // }

    var position = $(window).scrollTop();
    // should start at 0
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll > position) {
//            console.log('scrollDown');
            if (scroll > 70) {
                menu.classList.add("header-sticky");
            }
        } else {
//            console.log('scrollUp');
            if (scroll < 70) {
                menu.classList.remove("header-sticky");
            }
        }
        position = scroll;
    });


    // function checkScrollDirectionIsUp(event) {
    //     if (event.scrollDelta) {
    //         return event.wheelDelta > 0;
    //     }
    //     return event.deltaY < 0;
    // }
</script>

