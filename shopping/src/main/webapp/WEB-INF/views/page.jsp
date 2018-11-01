<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Online Shopping Website Using Spring MVC and Hibernate">
<meta name="author" content="Akshay lalwani">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>BG - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!-- homepage CSS -->
<link href="${css}/one-page-wonder.min.css" rel="stylesheet">

<!-- Fonts -->
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class=" se-pre-con"></div>



	<!-- Loading the home content -->
	<c:if test="${userClickHome == true }">
		<%@include file="home.jsp"%>
	</c:if>

	<!-- Page Content -->
	<c:if
		test="${userClickCategoryProducts == true or
		userClickShowProduct == true or 
		userClickAllProducts == true or 
		userClickCategoryProducts == true or 
		userClickAbout == true or 
		userClickContact == true or 
		userClickManageProduct == true or 
		userClickShowCart == true or
		userClickFeedback == true}">
		<div>
			<!-- Navigation -->
			<%@include file="./shared/navbar.jsp"%></div>
		<div class=" wrapper container">
	</c:if>
	<c:if test="${userClickAbout == true or userClickContact == true}">
		<div class="col-md-12 content ">
	</c:if>
	<c:if
		test="${userClickAllProducts == true or userClickCategoryProducts == true or userClickManageProduct == true}">
		<div class="table-responsive col-md-12 content ">
	</c:if>
	<!-- Load only when user clicks about -->
	<c:if test="${userClickAbout == true }">
		<%@include file="about.jsp"%>
	</c:if>

	<!-- Load only when user clicks contact -->
	<c:if test="${userClickContact == true }">
		<%@include file="contact.jsp"%>
	</c:if>

	<!-- Load only when user clicks contact -->
	<c:if
		test="${userClickAllProducts == true or userClickCategoryProducts == true }">
		<%@include file="listProducts.jsp"%>
	</c:if>
	<!-- loading feedback submitted form -->
	<c:if test="${userClickFeedback == true}">
		<%@include file="feedback.jsp"%>
	</c:if>


	<!-- Load only when user clicks show product -->
	<c:if test="${userClickShowProduct == true}">
		<%@include file="singleProduct.jsp"%>
	</c:if>

	<!-- Load only when user clicks manage product -->
	<c:if test="${userClickManageProduct == true}">
		<%@include file="manageProduct.jsp"%>
	</c:if>

	<!-- Load only when user clicks manage product -->
	<c:if test="${userClickShowCart == true}">
		<%@include file="cart.jsp"%>
	</c:if>


	</div>


	<!-- jQuery -->

	<script src="${js}/jquery.js"></script>

	<script src="${js}/jquery.validate.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${js}/bootstrap.min.js"></script>

	<!-- DataTable Plugin -->
	<script src="${js}/jquery.dataTables.js"></script>

	<!-- DataTable Bootstrap Script -->
	<script src="${js}/dataTables.bootstrap.js"></script>

	<!-- DataTable Bootstrap Script -->
	<script src="${js}/bootbox.min.js"></script>

	<!-- Self coded javascript -->
	<script src="${js}/myapp.js"></script>

	</div>

	<div style="width: 100%" class="footgeniusfooter">
		<!-- Footer comes here -->
		<%@include file="./shared/footer.jsp"%></div>

</body>

</html>