<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link href="<c:url value='/css/style.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/form.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/home.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/modal-window.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/user-menu.css'/>" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/jquery.simplemodal.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/messages-modal.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/advice-form.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/checkbox.js'/>"></script>
		
		<script type="text/javascript">
			$(document).ready(function () {
				$("#index-menu").addClass('selected');
				showModal("#modal", '<a href="#" class="close"><img src="<c:url value='/css/images/close_pop.png'/>" class="btn_close" title="Fechar" alt="Fechar" /></a>');
				$('a').css("margin", "0px 0px");
			});
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
					<form id="advice_form" action="<c:url value="/advice"/>" enctype="multipart/form-data" method="post">
						Selecione um arquivo .txt, .pdf, .doc ou .tex para análise:<br>
						<div class="single_form_element">
							<input id="file" type="file" name="file" size="30"><br>
							<span class="small" style="position: relative">
								<input id="pt" name="language" value="0" type="radio">Português <input id="en" name="language" value="1" type="radio">Inglês<br />
							</span>
						</div>
						<center>
							<input class="button" style="margin-top: 0px;" type="submit" value="Enviar">
							<div class="small">
								Por padrão, apenas algumas regras cadastradas no Sistema serão aplicadas ao seu texto. Para
								configurar a análise de seus arquivos, use a opção<br>
								<a href="<c:url value="/advanced"/>" style="margin: 10px 10px">Verificação Avançada</a>.
							</div>
						</center>
					</form>
				</div>
				
				<div class="spacer"></div>
			</div>
		</div>
		
<%@ include file="../shared/footer.jsp"%>