<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/19/2020
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<body>

<div class="container">
    <div class="row">
        <div class="col col-xs-6">
            <h4>Profile List</h4>
            <a href="http://localhost:8080/CDWEB2020/admin/create">Create New</a>
        </div>
        <div class="col col-xs-6 text-right">
            <ul class="pagination pull-right">
                <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                <c:forEach var="i" begin="0" end="${totalItem}">
                    <li>
                        <a href="http://localhost:8080/CDWEB2020/admin/list/${i+1}"><c:out value="${i+1}"/></a>
                    </li>
                </c:forEach>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12"><br />
            <div class="table-responsive">
                <table id="mytable" class="table table-bordred table-striped">
                    <thead>
                    <th>Tên sản phẩm</th>
                    <th>Mã sản phẩm</th>
                    <th>Giá gốc</th>
                    <th>Giá bán</th>
                    <th>Số lượng</th>
                    <th>Trạng thái</th>
                    <th style="width: 50px;">Edit</th>
                    <th style="width: 50px;">Delete</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${listProduct}">
                        <tr>
                            <td>${item.Name}</td>
                            <td>${item.ProductCode}</td>
                            <td>${item.Price}</td>
                            <td>${item.PromotionPrice}</td>
                            <td>${item.Quantity}</td>
                            <td>${item.Status}</td>
                            <td><a class="btn btn-default" href="http://localhost:8080/CDWEB2020/admin/edit/${item.Id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            <td><a class="btn btn-default" href="http://localhost:8080/CDWEB2020/admin/delete/${item.Id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
