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

    <link rel="stylesheet" href="<c:url value='/resources/css/about.css' />">
</head>
<body>

<%-- Import header--%>
<c:import url="layout/client/header.jsp"/>


<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giới thiệu</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<!--Content-->
<div class="content-about">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 article-template-right ">
                <h1>Giới thiệu công ty</h1><br>
                <p class="title">Hình thành và phát triển</p>
                <p>VinPro là thương hiệu trực thuộc tập đoàn Vingroup ra đời ngày 21/03/2015. Sau 4 năm. không ngừng
                    phát triển, chuỗi Siêu thị Điện Máy VinPro đã xuất hiện tại <strong>38</strong> tỉnh thành trên
                    toàn quốc với tổng số cửa hàng lên đến <strong>57</strong> và liên tục tục tăng trưởng thêm.
                </p>
                <p>Ngoài ra ngày 14.9.2018 đánh dấu cột mốc chuỗi bán lẻ thiết bị công nghệ Viễn Thông A sát nhập
                    cùng chuỗi Siêu Thị Điện Máy VinPro, nâng tổng số hệ thống lên đến <strong>242</strong> cửa hàng
                    trải dài khắp toàn quốc.</p><br>
                <p class="title">Sản phẩm đa dạng, phù hợp mọi nhu cầu</p>
                <p>Với phương châm “Một điểm đến, vạn nhu cầu”, khách hàng sẽ tìm thấy các sản phẩm phù hợp với nhu
                    cầu của mình tại VinPro với hàng hóa rất đa dạng và phong phú, từ điện thoại, máy tính bảng, máy
                    tính xách tay..., cho đến những mặt hàng gia dụng cần thiết hàng ngày như bếp từ, tủ lạnh, máy
                    giặt hay TV...</p>
                <p>Các sản phẩm có mặt tại chuỗi siêu thị VinPro đều là hàng chính hãng, đảm bảo các tiêu chuẩn chất
                    lượng khắt khe từ các nhà sản xuất uy tín.</p>
                <p>Đặc biệt, khi mua sắm tại VinPro, khách hàng sẽ được tích lũy từ 3% giá trị mua sắm vào thẻ
                    VinID, để tiếp tục sử dụng các dịch vụ trong hệ sinh thái Vingroup sau đó.</p><br>
                <p class="title">Nhân viên tận tâm, chu đáo</p>
                <p>Đội ngũ nhân viên giàu kinh nghiệm và chuyên nghiệp của VinPro luôn sẵn sàng để phục vụ mọi nhu
                    cầu của khách hàng. Từ việc tìm ra sản phẩm phù hợp nhất, cho đến công tác lắp đặt tận nhà và
                    những dịch vụ hậu mãi khác, khách hàng sẽ luôn cảm thấy an tâm và hài lòng với dịch vụ chăm sóc
                    đẳng cấp 5 sao từ các nhân viên đến từ VinPro.</p><br>
                <p class="title">Dịch vụ bảo hành tiện lợi</p>
                <p>(Theo Chính sách bảo hành siêu thị điện máy VinPro phát hành ngày 30/03/2018).</p>
                <p>VinPro sẽ bảo hành tại nhà cho các sản phẩm Điện tử, Điện lạnh, Điện gia dụng mua tại VinPro
                    trong phạm vi bán kính 50km.</p>
                <p>Không những vậy, trung tâm Bảo hành VinPro bảo hành tất cả sản phẩm khi Khách hàng mang sản phẩm
                    đến trung tâm bảo hành (bao gồm cả sản phẩm không mua tại Siêu thị Điện Máy VinPro) mà đủ điều
                    kiện bảo hành.</p><br>
                <p class="big-title text-center">TỔNG ĐÀI HỖ TRỢ KHÁCH HÀNG</p>
                <p class="big-title text-center mb-0">1800 6988</p></div>
        </div>
    </div>
</div>
</div>
<!--End content-->

<%-- Import footer--%>
<c:import url="layout/client/scroll-top.jsp"/>
<c:import url="layout/client/footer.jsp"/>

<%-- Import js files --%>
<c:import url="import/jsImport.jsp"/>
</body>
</html>