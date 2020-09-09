<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/19/2020
  Time: 12:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<body>

<div class="container">
    <br/>
    <div class="row">
        <div class="col col-xs-6">
            <a href="http://localhost:8080/CDWEB2020/admin/list">Profile List</a>
        </div>
        <div class="col col-xs-6 text-right">
        </div>
    </div>
    <div class="clearfix"></div>
    <fieldset>
        <form:form method="POST" modelAttribute="productAmin"
                   action="http://localhost:8080/CDWEB2020/admin/save" class="form-horizontal">
            <legend>Product</legend>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="Name" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="ProductCode" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="Price" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="PromotionPrice" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="Quantity" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" >Name:</label>
                <div class="col-sm-9">
                    <form:input path="Status" class="form-control" />
                </div>
            </div>




            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <input type="submit" value="Submit" class="btn btn-success"/>
                </div>
            </div>
        </form:form>
    </fieldset>
</div>

</body>
</html>