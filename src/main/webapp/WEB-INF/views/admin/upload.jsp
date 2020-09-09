<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Upload File</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="/WEB-INF/views/admin/assets/js/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/WEB-INF/views/admin/assets/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/WEB-INF/views/admin/assets/js/jquery.form.min.js" />"></script>

</head>
<body>
<form:form id="formUploadFile" method="POST" action="uploadFile" enctype="multipart/form-data" modelAttribute="myFile">

    <form:input path="folder"/>
    <form:errors path="folder" cssClass="error"/>

    <input type="submit" value="Submit" />
</form:form>

<br /> <br />

</body>

<script>
    $(document).ready(function() {
        var exist = false;

        $('#formUploadFile').submit(function(e) {
            e.preventDefault();

            $(this).ajaxSubmit({
                beforeSubmit: function() {
                    resetProgressBar();
                },
                uploadProgress: function (event, position, total, percentComplete){
                    console.log(percentComplete+"");
                    $("#progressbar").width(percentComplete + '%');
                    if (percentComplete < 100) {
                        $("#status").html(percentComplete + '%');
                    }
                    if (percentComplete == 100) {
                        $("#status").html("Saving...");
                    }
                },
                success:function (responseText, statusText, xhr){
                    $("#status").html("Completed!");
                    $("#progressbar").removeClass('progress-bar-striped active')

                },
                error: function(responseText, statusText, xhr){
                    resetProgressBar();
                    console.log(responseText);
                    console.log(statusText);
                    console.log(xhr);
                },
                //url:       url         // override for form's 'action' attribute
                type:      'POST',        // 'get' or 'post', override for form's 'method' attribute
                //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
                clearForm: true,        // clear all form fields after successful submit
                resetForm: true        // reset the form after successful submit
            });
        });


        function resetProgressBar() {
            $("#progressbar").width(0 + '%');
            $("#progressbar").addClass('progress-bar-striped active')
            $("#status").html(0 + '%');
        }

    });

</script>
</html>