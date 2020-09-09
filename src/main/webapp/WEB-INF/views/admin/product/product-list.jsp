<%@ page import="com.cdweb.entity.Product" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<body class="no-skin">
111111111111111
<form:form modelAttribute="searchGrammarform"
           cssClass="form-label-left input_mask"
           servletRelativeAction="/product/list/1" method="POST">

    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12"
               for="name">Name </label>
        <div class="col-md-12 col-sm-12 col-xs-12 has-feedback">
            <form:input path="name" class="form-control has-feedback-left" />
        </div>
    </div>

    <div class="ln_solid"></div>

    <div class="form-group row">
        <div class="col-md-12 col-sm-12  offset-md-3">

            <button type="submit" class="btn btn-success">Search</button>


        </div>
    </div>

</form:form>
2222222222222222222
<div class="table-responsive">
    <table class="table table-striped jambo_table bulk_action">
        <thead>
        <tr class="headings">
            <th class="column-title">Tên s?n ph?m</th>
            <th class="column-title">Giá g?c</th>
            <th class="column-title">Giá bán</th>
            <th class="column-title">S? l??ng s?n có</th>
            <th class="column-title">Tr?ng thái</th>
            <th class="column-title no-link last text-center" colspan="3"><span
                    class="nobr">Action</span></th>
        </tr>
        </thead>

        <tbody>


        <c:forEach items="${products}" var="p" varStatus="loop">
            <tr class="even pointer">
            <td class=" ">${p.Name}</td>
            <td class=" ">${p.Price }</td>
            <td class=" ">${p.PromotionPrice }</td>
            <td class=" ">${p.Quantity }</td>
            <td class=" ">${p.Status }</td>

            <td class="text-center"><a
                    href="<c:url value="/admin/practice/grammar/view/${g.id }"/>"
                    class="btn btn-round btn-default">View</a> <a
                    href="<c:url value="/admin/practice/grammar/edit/${g.id }"/>"
                    class="btn btn-round btn-primary">Edit</a> <a
                    href="javascript:void(0);" onclick="confirmDelete(${g.id});"
                    class="btn btn-round btn-danger">Delete</a></td>
            </tr>
            333333333333333
        </c:forEach>

        </tbody>
    </table>

</div>
44444444444444444

</body>
</html>
