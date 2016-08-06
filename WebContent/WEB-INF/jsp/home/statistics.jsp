<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-77434018-1', 'auto');
  ga('send', 'pageview');

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/form.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/modal-window.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/table.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/user-menu.css'/>" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.dataTables.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.simplemodal.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/messages-modal.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/custom-modal.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/pagination.js'/>"></script>
<script type="text/javascript">
			$(document).ready(function() {
				showModal("#modal", '<a href="#" class="close"><img src="<c:url value='/css/images/close_pop.png'/>" class="btn_close" title="Fechar" alt="Fechar" /></a>');
				
				$('#rules').dataTable({
					"aaSorting": [[ 0, "asc" ]],
					"sPaginationType": "four_button"
				});
				$('a').css("margin", "0px 0px");
			});
		</script>

<title>Sobre</title>
</head>

<body>
	<%@ include file="../shared/header.jsp"%>
	<%@ include file="../shared/user-menu.jsp"%>

	<div id="page">
		<div id="content">
			<div class="grid">
				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="rules">
					<thead>
						<tr>
							<th>Erro</th>
							<th>Quantidade</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rules}" var="rule">
							<tr>
								<c:choose>
									<c:when test="${!empty rule.lemmas}">
										<c:forEach items="${rule.lemmas}" var="lemma">
											<c:if test="${lemma.pair.defaultPair == true}">
												<td class="center"><c:out value="${lemma.pair.pattern}" /></td>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach items="${rule.exactMatchings}" var="exactMatching">
											<c:if test="${exactMatching.pair.defaultPair == true}">
												<td class="center"><c:out
														value="${exactMatching.pair.pattern}" /></td>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<td class="center"><c:out value="${rule.count}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="spacer"></div>
			</div>
		</div>
	</div>

	<%@ include file="../shared/footer.jsp"%>