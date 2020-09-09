<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >

<jsp:include page="parts/header.jsp"></jsp:include>

<%--ckfinder--%>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>--%>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>--%>
<script src="<c:url value='/resources/ckeditor/ckeditor.js' />"></script>

<body class="no-skin">

<%--<%--%>
<%--    Product p = (Product) request.getAttribute("p");--%>
<%--    Product pEdit = (Product) request.getAttribute("pEdit");--%>
<%--    String action = (String) request.getAttribute("action");--%>
<%--    String id = (String) request.getAttribute("id");--%>
<%--    HashMap<String, String> errorList = (HashMap<String, String>) request.getAttribute("errorList");--%>
<%--    ArrayList<Brand> brandList = (ArrayList<Brand>) request.getAttribute("brandList");--%>
<%--    ArrayList<Catalog> catalogList = (ArrayList<Catalog>) request.getAttribute("catalogList");--%>
<%--    ArrayList<Warranty> warrantyList = (ArrayList<Warranty>) request.getAttribute("warrantyList");--%>
<%--%>--%>

<%--<%--%>
<%--    String result = (String) request.getAttribute("result");--%>
<%--    if (p != null) {--%>
<%--        if (pEdit != null) {--%>
<%--            p = pEdit;--%>
<%--        }--%>
<%--    } else {--%>
<%--        if (pEdit != null) {--%>
<%--            p = pEdit;--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>


<jsp:include page="parts/navbar.jsp"></jsp:include>

<%--Toast--%>
<style>
    #toastParent {
        display: flex !important;
        align-items: center;
        justify-content: center;
        position: fixed;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        padding-right: 17px;
        overflow-x: hidden;
        overflow-y: auto;
        z-index: 1050;
        outline: 0;
        visibility: hidden;


    }

    #toast {
        display: flex !important;
        align-items: center;
        justify-content: center;
        min-width: 250px;
        min-height: 100px;
        background-color: #000000b3;
        color: #fff;
        border-radius: 2px;
        padding: 16px;
        font-size: 18px;
    }

    #toast.danger {
        background: #fdecea;
        border: 1px solid #f44336;
        color: black;
        border-radius: unset;
        box-shadow: 2px 2px 4px #0000006e;
    }

    #toast.danger i {
        color: #f44336;
    }

    #toast.success {
        background: #51a351;
        opacity: 0.9;
        border: 1px solid #13691e;
        color: white;
        border-radius: unset;
        box-shadow: 2px 2px 4px #0000006e;
    }

    #toast.success i {
        color: white;
    }

    #toastParent.show {

        visibility: visible;
        /*-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;*/
        /*animation: fadein 0.5s, fadeout 0.5s 2.5s;*/
        animation: scale 0.1s, scaleout 0.5s 2.5s;;
        /*transition: transform .2s;*/

    }

    @keyframes scale {
        0% {
            transform: scale(1.0)
        }
        10% {
            transform: scale(1.05)
        }
        20% {
            transform: scale(1.10)
        }
        30% {
            transform: scale(1.15)
        }
        40% {
            transform: scale(1.20)
        }
        50% {
            transform: scale(1.20)
        }
        60% {
            transform: scale(1.20)
        }
        70% {
            transform: scale(1.15)
        }
        80% {
            transform: scale(1.10)
        }
        90% {
            transform: scale(1.05)
        }
        100% {
            transform: scale(1.00)
        }
    }

    @keyframes scaleout {
        from {
            transform: scale(1.00);
            opacity: 1;
        }
        to {
            transform: scale(0);
            opacity: 0;
        }
    }

    @-webkit-keyframes fadein {
        from {
            top: -50px;
            opacity: 0;
        }
        to {
            top: 0;
            opacity: 1;
        }
    }

    @keyframes fadein {
        from {
            top: -50px;
            opacity: 0;
        }
        to {
            top: 0;
            opacity: 1;
        }
    }

    @-webkit-keyframes fadeout {
        from {
            top: 0;
            opacity: 1;
        }
        to {
            top: -50px;
            opacity: 0;
        }
    }

    @keyframes fadeout {
        from {
            top: 0;
            opacity: 1;
        }
        to {
            top: -50px;
            opacity: 0;
        }
    }
     .error {
         color: red;
     }
</style>
<%--<% if (result != null) {%>--%>
<%--<div id="toastParent">--%>
<%--    <%--%>
<%--        String classToast;--%>
<%--        if (result.equals("successNew") || result.equals("successEdit")) {--%>
<%--            classToast = "success";--%>
<%--        } else {--%>
<%--            classToast = "danger";--%>
<%--        }--%>
<%--    %>--%>
<%--    <div id="toast" class="<%=classToast%>">--%>
<%--        <%--%>
<%--            if (classToast.equals("success")) { %>--%>
<%--        <i class="fas fa-check"></i>--%>
<%--        <%} else {%>--%>

<%--        <i class="fas fa-exclamation-triangle"> </i>--%>
<%--        <%} %>--%>
<%--        <%--%>
<%--            if (result.equals("successNew")) {--%>
<%--        %>--%>
<%--        &nbsp;Thêm sản phẩm thành công--%>
<%--        <% }--%>
<%--            if (result.equals("successEdit")) {%>--%>
<%--        &nbsp;Cập nhật sản phẩm thành công--%>
<%--        <% }--%>
<%--            if (result.equals("errorNew")) {%>--%>
<%--        &nbsp;Thêm sản phẩm thất bại--%>
<%--        <% }--%>
<%--            if (result.equals("errorEdit")) {%>--%>
<%--        &nbsp;Cập nhật sản phẩm thất bại--%>
<%--        <% }%>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<% }%>--%>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <jsp:include page="parts/left-menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">

                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>

                        <a href="<c:url value="/admin/home"/>"/>Trang chủ</a>
                    </li>

                    <li>
                        <a href="<c:url value="/admin/product/list"/>">Danh sách sản phẩm</a>
                    </li>
                    <li class="active" >${product.productId!=0?"Cập nhật sản phẩm":"Tạo sản phẩm"}</li>

                </ul><!-- /.breadcrumb -->
                <%--&lt;%&ndash;        <%= == null ? "Tạo sản phẩm" : "Cập nhật sản phẩm"%>&ndash;%&gt;--%>
                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="ace-icon fa fa-cog bigger-130"></i>
                    </div>

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-navbar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-sidebar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-breadcrumbs" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-add-container" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div><!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div><!-- /.pull-left -->
                    </div><!-- /.ace-settings-box -->
                </div><!-- /.ace-settings-container -->
                <div class="row">
                    <div class="col-xs-12">
<%--                        <%--%>
<%--                            String url = "";--%>
<%--                            if (!"".equals(id) && id != null) {--%>
<%--                                url = Util.fullPathAdmin("product/create-edit?action=edit&id=" + id);--%>
<%--                            } else--%>
<%--                                url = Util.fullPathAdmin("product/create-edit?action=new");--%>
<%--                        %>--%>
                        <!-- PAGE CONTENT BEGINS -->
                        <form:form cssClass="form-horizontal was-validated" method="post" modelAttribute="product" servletRelativeAction="/admin/product/add"
                              enctype="multipart/form-data">
                            <form:hidden path="productId" />
                            <form:hidden path="dateCreated" />
                            <form:hidden path="dateModified" />
                            <form:hidden path="status" />
                            <div class="page-header">
                                <h3> Thông tin cơ bản </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                            <label class="col-sm-2 control-label no-padding-right" > *Mã
                                SKU</label>
                            <div class="col-sm-9">
                                <form:input path="productCode"  placeholder="Mã SKU" class="width-100 searchInput"
                                            oninvalid="this.setCustomValidity('Vui lòng nhập Mã SKU')"
                                            oninput="this.setCustomValidity('')"
                                            name="code" onblur="checkExist()"/>
                                <div class="has-error" style="color: red;">
                                    <form:errors path="productCode" cssClass="help-block"></form:errors>
                                    <div id="sku"></div>
                                </div>
                                    <%--                                    <%--%>
                                    <%--                                        if (errorList != null) {--%>
                                    <%--                                            if (!"".equals(errorList.get("code"))) { %>--%>
                                    <%--                                    <div class="error">--%>
                                    <%--                                        <%=errorList.get("code")%>--%>
                                    <%--                                    </div>--%>
                                    <%--                                    <% }--%>
                                    <%--                                    } %>--%>
                            </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" > *Tên sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <form:input path="name"   placeholder="Tên sản phẩm"
                                           class="width-100"
                                            name="name"
                                           oninvalid="this.setCustomValidity('Vui lòng nhập Tên sản phẩm')"
                                           oninput="this.setCustomValidity('')"
                                    />
                                    <div class="has-error" style="color: red;">
                                        <form:errors path="name" cssClass="help-block"></form:errors>
                                    </div>
<%--                                    <%--%>
<%--                                        if (errorList != null) {--%>
<%--                                            if (!"".equals(errorList.get("name"))) { %>--%>
<%--                                    <div class="error">--%>
<%--                                        <%=errorList.get("name")%>--%>
<%--                                    </div>--%>
<%--                                    <% }--%>
<%--                                    } %>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> Mô tả sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <form:textarea path="description" name="description" id="editor1" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100"/>

                                </div>
                                <div class="has-error" style="color: red;">
                                    <form:errors path="description" cssClass="help-block"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> Thông số kỹ thuật </label>
                                <div class="col-sm-9">
                                    <form:textarea path="settingInfo" name="settingInfo" id="editor2" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100"/>
                                </div>
                                <div class="has-error" style="color: red;">
                                    <form:errors path="settingInfo" cssClass="help-block"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" > *Loại sản
                                    phẩm </label>
                                <div class="col-sm-9">

                                <form:select path = "catalog.catalogId" class="width-100" name="catalog">
                                    <c:if test="${listCatalog!=null}">
                                    <c:forEach var="list" items="${listCatalog}">
                                        <option value="${list.catalogId}" ${list.catalogId==product.catalog.catalogId?"selected":""}>${list.name}</option>
                                    </c:forEach>
                                    </c:if>
                                </form:select>


                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="form-field-4"--%><label class="col-sm-2 control-label no-padding-right" for="form-field-4">*Thương
                                    hiệu </label>
                                <div class="col-sm-9">

                                    <form:select path = "brand.brandId" id="form-field-4" class="width-100" name="brand">
                                        <c:if test="${listBrand!=null}">
                                        <c:forEach var="list" items="${listBrand}" >
                                        <option value="${list.brandId}" ${list.brandId==product.brand.brandId?"selected":""}>${list.name}</option>
                                        </c:forEach>
                                        </c:if>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <%--@declare id="form-field-5"--%><label class="col-sm-2 control-label no-padding-right" for="form-field-5"> Bảo
                                    hành</label>
                                <div class="col-sm-9">

                                    <form:select path = "waranty.warrantyId" id="form-field-5" class="width-100" name="warranty">
                                        <c:if test="${listWarranty!=null}">
                                        <c:forEach var="list" items="${listWarranty}" >
                                        <option value="${list.warrantyId}" ${list.warrantyId==product.waranty.warrantyId?"selected":""}>Bảo hành ${list.warrantyMonth}</option>
                                        </c:forEach>
                                        </c:if>
                                    </form:select>
                                </div>
                            </div>

                            <div class=" page-header
                                        ">
                                <h3> Thông tin bán hàng </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" >*Giá
                                    gốc</label>
                                <div class="col-sm-9">
                                    <form:input path="price" placeholder="Giá gốc"
                                           class="width-100"


                                           name="price"
                                           oninvalid="this.setCustomValidity('Vui lòng nhập Giá gốc')"
                                           oninput="this.setCustomValidity('')"
                                    />
                                    <div class="has-error" style="color: red;">
                                        <form:errors path="price" cssClass="help-block"></form:errors>
                                    </div>
<%--                                    pattern="^\d{1,3}(.\d{3})*(\₫)?$" data-type="currency"--%>
<%--                                    <fmt:setLocale value="vi-VI"/>--%>
<%--                                    <fmt:formatNumber value="${product.price}" type="currency"/>--%>
<%--                                    <%--%>
<%--                                        if (errorList != null) {--%>
<%--                                            if (!"".equals(errorList.get("price"))) { %>--%>
<%--                                    <div class="error">--%>
<%--                                        <%=errorList.get("price")%>--%>
<%--                                    </div>--%>
<%--                                    <% }--%>
<%--                                    } %>--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" > *Giá
                                    bán</label>
                                <div class="col-sm-9 offset-sm-1">
                                    <form:input path="promotionPrice"
                                           placeholder="Giá khuyến mãi" class="width-100"


                                           name="promotionPrice"
                                           oninvalid="this.setCustomValidity('Vui lòng nhập Giá khuyến mãi')"
                                           oninput="this.setCustomValidity('')"
                                    />
                                    <div class="has-error" style="color: red;">
                                        <form:errors path="promotionPrice" cssClass="help-block"></form:errors>
                                    </div>
<%--                                    <%--%>
<%--                                    pattern="^\d{1,3}(.\d{3})*(\₫)?$" data-type="currency"--%>
<%--                                        if (errorList != null) {--%>
<%--                                            if (!"".equals(errorList.get("promotionPrice"))) { %>--%>
<%--                                    <div class="error">--%>
<%--                                        <%=errorList.get("promotionPrice")%>--%>
<%--                                    </div>--%>
<%--                                    <% }--%>
<%--                                    } %>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" > *Kho
                                    hàng </label>
                                <div class="col-sm-9 offset-sm-1">
                                    <form:input path="quantity"
                                           placeholder="Số lượng hàng còn trong kho"
                                           class="width-100"
                                           min="0"
                                           name="quantity"
                                           oninvalid="this.setCustomValidity('Vui lòng nhập Số lượng sản phẩm')"
                                           oninput="this.setCustomValidity('')"
                                    />
                                    <div class="has-error" style="color: red;">
                                        <form:errors path="quantity" cssClass="help-block"></form:errors>
                                    </div>
<%--                                    <%--%>
<%--                                        if (errorList != null) {--%>
<%--                                            if (!"".equals(errorList.get("quantity"))) { %>--%>
<%--                                    <div class="error">--%>
<%--                                        <%=errorList.get("quantity")%>--%>
<%--                                    </div>--%>
<%--                                    <% }--%>
<%--                                    } %>--%>
                                </div>
                            </div>

                            <div class="page-header">
                                <h3> Quản lý hình ảnh </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-3-1"> Hình
                                    ảnh sản phẩm </label>
<%--                                <input type="text" id="listImg" name="listImg" style="display: none"/>--%>
<%--                                <div class="listImgSession col-sm-9" id="form-field-3-1">--%>
<%--                                    <%--%>
<%--                                        for (int i = 0; i < 9; i++) {--%>
<%--                                            if (i == 0) {--%>
<%--                                    %>--%>
<%--                                    <div class="itemImg">--%>
<%--                                        <div class="itemImgContent">--%>
<%--                                            <div class="itemImgUpload" onclick="BrowseServer(this);">--%>
<%--                                                <div class="itemImgFileUpload">--%>
<%--                                                    <div class="upload">--%>
<%--                                                        <input class="xFilePath" type="text"--%>
<%--                                                               style="display: none"/>--%>
<%--                                                        <div class="uploadIcon">--%>
<%--                                                            <i class="fas fa-plus-circle"></i>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="image-tools">--%>
<%--                                                <div class="image-tool-delete" onclick="deleteImg(this)">--%>
<%--                                                    <i class="far fa-trash-alt"></i>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="itemImgExplain-text">--%>
<%--                                                Ảnh bìa--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <%} else { %>--%>
<%--                                    <div class="itemImg">--%>
<%--                                        <div class="itemImgContent">--%>
<%--                                            <div class="itemImgUpload" onclick="BrowseServer(this);">--%>
<%--                                                <div class="itemImgFileUpload">--%>
<%--                                                    <div class="upload">--%>
<%--                                                        <input class="xFilePath" type="text"--%>
<%--                                                               style="display: none"/>--%>
<%--                                                        <div class="uploadIcon">--%>
<%--                                                            <i class="fas fa-plus-circle"></i>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="image-tools">--%>
<%--                                                <div class="image-tool-delete" onclick="deleteImg(this)">--%>
<%--                                                    <i class="far fa-trash-alt"></i>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="itemImgExplain-text">--%>
<%--                                                Image <%=i%>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <%--%>
<%--                                            }--%>
<%--                                        }--%>
<%--                                    %>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="images">Image upload <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-12 col-sm-12 col-xs-12 has-feedback">
                                        <form:input path="images"
                                                    class="form-control has-feedback-left" type="file" multiple="multiple"/>

                                    </div>
                                </div>
                                <c:if test="${viewOnly }">
                                    <c:forEach var="item" items="${listimage}">
                                        <div class="itemImg">
                                            <div class="itemImgContent">
                                                <img width="100" src='<c:url value="/resources/Image/${product.productCode}/${item}" /> ' alt="">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="">
                                    <a class="btn "
                                       href="http://localhost:8080/ProjectWeb02/admin/product/list">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Hủy
                                    </a>
                                    <button class="btn btn-info" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        ${product.productId!=0?"Chỉnh sửa":"Tạo mới"}
                                    </button>
                                </div>
                            </div>
                        </form:form>
                    </div><!-- /.col -->

                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="parts/footer.jsp"></jsp:include>

</div><!-- /.main-container -->
<jsp:include page="parts/js-library.jsp"></jsp:include>


<%--Ckeditor/ CKfinder--%>
<script type="text/javascript">
    var editor = CKEDITOR.replace('editor1');
    <%--var url = '<%=request.getContextPath()+"/ckfinder/"%>';--%>
    // CKFinder.setupCKEditor(editor, "../../ckfinder");

    var editor2 = CKEDITOR.replace('editor2');
    // CKFinder.setupCKEditor(editor2, "../../ckfinder");

    // var divImg;

    // function BrowseServer(div) {
        // You can use the "CKFinder" class to render CKFinder in a page:
        // var finder = new CKFinder();
        // divImg = div;
        // finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
        // finder.selectActionFunction = SetFileField;
        // finder.popup();

        // It can also be done in a single line, calling the "static"
        // popup( basePath, width, height, selectFunction ) function:
        // CKFinder.popup( '../', null, null, SetFileField ) ;
        //
        // The "popup" function can also accept an object as the only argument.
        // CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
    // }

    // This is a sample function which is called when a file is selected in CKFinder.
    // function SetFileField(fileUrl) {
    //     $(divImg).css("background-image", "url(" + fileUrl + ")");
    //     $(divImg).css("border", "1px solid #1791f2");
    //
    //     $(divImg).find(".itemImgFileUpload").css("display", "none");
    //     $(divImg).find(".xFilePath").val(fileUrl);
    //     $(divImg).parent().find(".image-tools").css("display", "inline-block");
    // }
    //
    // function deleteImg(divDelete) {
    //     $(divDelete).parent().css("display", "none");
    //     var divGrandParent = $(divDelete).parent().parent();
    //     $(divGrandParent).find(".itemImgFileUpload").css("display", "block");
    //     $(divGrandParent).find(".xFilePath").val("");
    //     $(divGrandParent).find(".itemImgUpload").css("background-image", "");
    //     $(divGrandParent).find(".itemImgUpload").css("border", "1px dashed  #1791f2");
    // }
    //
    // var urlList = "";
    //
    // function gettingUrlImgList() {
    //     $(".xFilePath").each(function () {
    //         if ($(this).val() != "") {
    //             urlList += $(this).val() + "|";
    //         }
    //     });
    //     urlList = urlList.substring(0, urlList.length - 1);
    //     $("#listImg").val(urlList);
    // }

    // set list image on start
    <%--var temp = 0;--%>
    <%--var listImg = [];--%>
    <%--<% if (p != null) {%>--%>
    <%--listImg = <%=Product.toJavascriptArray(p.getListImg())%>--%>
    <%--    <% } %>--%>
    <%--    $(".itemImgUpload").each(function () {--%>
    <%--        if (temp < listImg.length && listImg[0] != "") {--%>
    <%--            $(this).css("background-image", "url(" + listImg[temp] + ")");--%>
    <%--            $(this).css("border", "1px solid #1791f2");--%>

    <%--            $(this).find(".itemImgFileUpload").css("display", "none");--%>
    <%--            $(this).find(".xFilePath").val(listImg[temp]);--%>
    <%--            $(this).parent().find(".image-tools").css("display", "inline-block");--%>
    <%--        }--%>
    <%--        temp++;--%>
    <%--    })--%>
</script>

<%--Format currentcy--%>
<script>
    // Jquery Dependency
    $("input[data-type='currency']").on({
        keyup: function () {
            formatCurrency($(this));
        },
        blur: function () {
            formatCurrency($(this), "blur");
        }
    });

    function formatNumber(n) {
        // format number 1000000 to 1,234,567
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }

    function formatCurrency(input, blur) {
        // appends $ to value, validates decimal side
        // and puts cursor back in right position.

        // get input value
        var input_val = input.val();

        // don't validate empty input
        if (input_val === "") {
            return;
        }

        // original length
        var original_len = input_val.length;

        // initial caret position
        var caret_pos = input.prop("selectionStart");

        // no decimal entered
        // add commas to number
        // remove all non-digits
        input_val = formatNumber(input_val);
        input_val = input_val;

        // final formatting
        if (blur === "blur") {
            input_val += " ₫";
        }

        // send updated string to input
        input.val(input_val);

        // put caret back in the right position
        var updated_len = input_val.length;
        caret_pos = updated_len - original_len + caret_pos;
        input[0].setSelectionRange(caret_pos, caret_pos);
    }
</script>

<%--Toast--%>
<%--<script>--%>
<%--    <% if (result != null) {%>--%>

<%--    var x = document.getElementById("toastParent");--%>

<%--    setTimeout(function () {--%>
<%--        x.classList.add("show");--%>
<%--    }, 1000);--%>
<%--    setTimeout(function () {--%>
<%--        x.className = x.className.replace("show", "");--%>
<%--    }, 4000);--%>

<%--    <%}%>--%>
<%--</script>--%>

<%--Handle error--%>
<script>
    // $(".form-group").each(function () {
    //     // var input= $(this).find("input").val();
    //     var input = $(this).find("input");
    //     var thisSelect = $(this);
    //     var divError = thisSelect.find("div.error");
    //     input.keyup(function () {
    //         thisSelect.find("div.error").remove();
    //     });
    // });
    //
    // // scroll to error
    // $('html, body').animate({
    //     scrollTop: $(".error").parent().offset().top
    // }, 1000)

</script>

<%--Stick menu--%>
<%--<script>--%>
<%--    window.onscroll = function() {myFunction()};--%>

<%--    var navbar = document.getElementById("breadcrumbs");--%>
<%--    var sticky = navbar.offsetTop;--%>

<%--    function myFunction() {--%>
<%--        if (window.pageYOffset >= sticky) {--%>
<%--            navbar.classList.add("sticky")--%>
<%--        } else {--%>
<%--            navbar.classList.remove("sticky");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>

<script>
    function checkExist() {
        // var code = document.forms["form"]["code"].value();
        var code =  $(".searchInput").val();
        console.log(code)
        $.ajax({
            type : "GET",
            // contentType : "application/json",
            url : '<c:url value="/admin/product/checkcode/" />'+code,
            // data : JSON.stringify(developerData),
            // dataType : 'json',
            success : function(data) {
                if (data === "SKU invalid") {
                    $("#sku").text(data).css("color", "red");
                } else {
                    $("#sku").text(data).css("color", "blue");
                }

            }

        });
    }

</script>
</body>
</html>