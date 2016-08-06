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
	<link href="<c:url value='/css/home.css'/>" rel="stylesheet"
		  type="text/css" />
	<link href="<c:url value='/css/modal-window.css'/>" rel="stylesheet"
		  type="text/css" />
	<link href="<c:url value='/css/user-menu.css'/>" rel="stylesheet"
		  type="text/css" />

	<script type="text/javascript"
			src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript"
			src="<c:url value='/js/jquery.simplemodal.js'/>"></script>
	<script type="text/javascript"
			src="<c:url value='/js/messages-modal.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/advice-form.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/checkbox.js'/>"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			$("#footer ul").append('<li>|<a href="\statistics">Estatística</a></li>');
			$("#index-menu").addClass('selected');
			showModal("#modal", '<a href="#" class="close"><img src="<c:url value='/css/images/close_pop.png'/>" class="btn_close" title="Fechar" alt="Fechar" /></a>');
			$('a').css("margin", "0px 0px");
		});

		function hideorshow() {
			var file = $("#file");
			var type_div = $("#type_div");
			var patt = new RegExp("\.txt$");
			if (patt.test(file.val()))
				type_div.attr("hidden", false);
			else
				type_div.attr("hidden", true);
		};
	</script>

	<title>CATA: Collaborative Academic Text Advisor</title>
</head>

<body>
<%@ include file="../shared/header.jsp"%>
<%@ include file="../shared/messages.jsp"%>
<%@ include file="../shared/user-menu.jsp"%>

<div id="page">
	<div id="content">
		<h1>CATA: Collaborative Academic Text Advisor</h1>
		Um verificador de estilo para textos acadêmicos de Computação.<br />
		<br />

		<div id="advice">
			<center>
				<h2>Selecione um arquivo e envie para verificação</h2>
			</center>
			<form id="advice_form" action="<c:url value="/advice"/>"
				  enctype="multipart/form-data" method="post">
				Selecione um arquivo .txt, .pdf, .doc ou .tex para análise:<br>
				<div class="single_form_element">
					<input id="file" type="file" name="file" size="30"
						   onchange="hideorshow()"><br> <span class="small"
															  style="position: relative"> <input id="pt" name="language"
																								 value="0" type="radio">Português <input id="en"
																																		 name="language" value="1" type="radio">Inglês<br />
						</span>
					<div id="type_div" hidden class="small">
						<label for="type">Tipo de txt</label> <select id="type"
																	  type="text" name="type">
						<c:forEach items="${charsets}" var="charset">
							<option value="${charset}"
									<c:if test="${charset eq 'UTF-8' }">selected</c:if>>${charset}</option>
						</c:forEach>
					</select> <br />
					</div>
				</div>
				<center>
					<input class="button" style="margin-top: 0px;" type="submit"
						   value="Enviar">
					<div class="small">
						Por padrão, apenas algumas regras cadastradas no Sistema serão
						aplicadas ao seu texto. Para configurar a análise de seus
						arquivos, use a opção<br> <a
							href="<c:url value="/advanced"/>" style="margin: 10px 10px">Verificação
						Avançada</a>.
					</div>
				</center>
			</form>
		</div>

		<div class="spacer"></div>
	</div>
</div>

<%@ include file="../shared/footer.jsp"%>