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

<script type="text/javascript" src="<c:url value='js/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='js/jquery.simplemodal.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='js/messages-modal.js'/>"></script>
<script type="text/javascript" src="<c:url value='js/signup-form.js'/>"></script>
<script type="text/javascript">
			$(document).ready(function () {
				showModal("#modal", '<a href="#" class="close"><img src="<c:url value='/css/images/close_pop.png'/>" class="btn_close" title="Fechar" alt="Fechar" /></a>');
			});
		</script>

<title>Cadastre-se</title>
</head>
<body>
	<%@ include file="../shared/header.jsp"%>
	<%@ include file="../shared/messages.jsp"%>

	<div id="page">
		<div id="content">
			<form id="custom_form" class="width510"
				action="<c:url value='/signup'/>" method="post">
				<fieldset>
					<legend>Cadastre-se</legend>
					<div class="single_form_element">
						<label class="label" for="name">Nome*</label> <br /> <input
							id="name" class="input_border width285" type="text" maxlength=100
							name="newUser.name" /><br /> <span id="nameInfo"
							class="description">Como você será identificado pelos
							outros usuários</span>
					</div>
					<div class="single_form_element">
						<label class="label" for="email">E-mail*</label> <br /> <input
							id="email" class="input_border width285" type="text"
							maxlength=100 name="newUser.email" /><br /> <span
							id="emailInfo" class="description">Uma confirmação será
							enviada para este endereço</span>
					</div>
					<div class="single_form_element">
						<label class="label" for="pass1">Senha*</label> <br /> <input
							id="pass1" class="input_border width285" type="password"
							maxlength=32 name="newUser.password" /><br /> <span
							id="pass1Info" class="description">No mínimo 6 caracteres</span>
					</div>
					<div class="single_form_element">
						<label class="label" for="pass2">Redigite a senha*</label> <br />
						<input id="pass2" class="input_border width285" type="password"
							maxlength=32 name="password" /><br /> <span id="pass2Info"
							class="description">Confirme sua senha</span>
					</div>
					<button type="button" class="button"
						onclick="javascript:history.go(-1);return false;">Voltar</button>
					<input class="button" type="submit" value="Criar minha conta">
				</fieldset>
			</form>
		</div>
	</div>

	<%@ include file="../shared/footer.jsp"%>