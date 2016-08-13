<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-77434018-1', 'auto');
	ga('send', 'pageview');
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/coin-slider-styles.css'/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/form.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/index.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/css/modal-window.css'/>" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/coin-slider.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.simplemodal.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/messages-modal.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/advice-form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/checkbox.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/login-form.js'/>"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#index-menu").addClass('selected');
						$('#coin-slider').coinslider({
							width : 950,
							navigation : true,
							delay : 5000
						});
						showModal(
								"#modal",
								'<a href="#" class="close"><img src="<c:url value='/css/images/close_pop.png'/>" class="btn_close" title="Fechar" alt="Fechar" /></a>');
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

	<div id="page">
		<div id="content">
			<div id="title">
				CATA: Collaborative Academic Text Advisor <br>
				<p>Um verificador de estilo para textos acadêmicos de
					Computação.</p>
			</div>

			<div id="login">

				<form id="login_form" action="<c:url value='/login'/>" method="post">
					<fieldset>
						<div class="single_form_element">
							<label class="label" for="email">E-mail: </label> <input
								id="email" class="input_border width130" type="text"
								maxlength=100 name="user.email" /> <label class="label"
								for="pass">Senha: </label> <input id="pass"
								class="input_border width130" type="password" maxlength=100
								name="user.password" />

							<div id="loginEntry">
								<input class="loginButton" type="submit" value="Entrar">
							</div>
							<div class="small align-left">
								<a href="<c:url value='/signup'/>">Cadastre-se</a>&#160;&#160;&#160;
								<a href="<c:url value='/recover'/>">Esqueci a senha</a>
							</div>

						</div>
						<!-- 						<div id="loginEntry"> -->

						<!-- 						</div> -->
					</fieldset>
				</form>
			</div>
			<br>

			<div id='coin-slider'>
				<a href="<c:url value='/#checkYourTexts'/>"> <img
					src="<c:url value='/css/images/files.png'/>"> <span><b>Envie
							um arquivo .txt, .pdf, .doc ou .tex</b><br> Selecione um arquivo
						de texto sem formatação, um PDF, um DOC ou um arquivo LaTeX e
						envie para verificação. </span>
				</a> <a href="<c:url value='/#checkYourTexts'/>"> <img
					src="<c:url value='/css/images/advice.png'/>"> <span><b>Alternativas
							aos problemas de estilo</b><br> CATA marca problemas de estilo
						em seu texto e oferece sugestões para corrigi-los. </span>
				</a> <a href="<c:url value='/signup'/>"> <img
					src="<c:url value='/css/images/newrule.png'/>"> <span><b>Cadastre
							suas próprias sugestões de estilo</b><br> Cadastrando-se no
						Sistema CATA você poderá inserir e modificar suas próprias regras
						e sugestões de estilo. </span>
				</a> <a href="https://github.com/NAWEB-USP/Cata" target="_blank"> <img
					src="<c:url value='/css/images/free-github.png'/>"> <span>
						<b>CATA é software livre!</b><br> O código-fonte do Sistema
						CATA está hospedado no GitHub.
				</span>
				</a>
			</div>

			<div id="advice">
				<a name="checkYourTexts"></a>
				<center>
					<h2>Verifique o estilo de seus textos</h2>

					<form id="advice_form" action="<c:url value="/advice"/>"
						enctype="multipart/form-data" method="post">
						<div class="single_form_element">
							Selecione um arquivo .txt, .pdf, .doc ou .tex para análise: <input
								id="file" type="file" name="file" size="30"
								onchange="hideorshow()"><br /> <span class="small"
								style="position: relative"> <label for="pt">Português</label><input
								id="pt" name="language" value="0" type="radio"> <label
								for="en">Inglês</label><input id="en" name="language" value="1"
								type="radio"> <br />
							</span>
						</div>
						<div id="type_div" hidden class="small single_form_element">
							<label for="type" class="label">Tipo de txt</label> <select
								id="type" type="text" name="type" class="input_border width250">
								<c:forEach items="${charsets}" var="charset">
									<option value="${charset}"
										<c:if test="${charset eq 'UTF-8' }">selected</c:if>>${charset}</option>
								</c:forEach>
							</select> <br />
						</div>
						<input class="button" type="submit" value="Enviar">
						<div class="small" style="margin-right: none">
							Por padrão, apenas algumas regras cadastradas no Sistema serão
							aplicadas ao seu texto. Para configurar a análise de seus
							arquivos, use a opção<br> <a
								href="<c:url value="/advanced"/>">Verificação Avançada</a>.
						</div>
				</center>
				</form>
			</div>

			<div class="spacer"></div>
		</div>
	</div>

	<%@ include file="../shared/footer.jsp"%>